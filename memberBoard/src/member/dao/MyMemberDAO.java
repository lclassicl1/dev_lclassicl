package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import member.model.Member;

//DAO(Data Access Object): DB연동하여 쿼리관련 실행기능이 있는 클래스
//이 클래스는 DAO로써 주로 회원관련 DB 작업을 실행
public class MyMemberDAO {

	StringBuffer sql = new StringBuffer();
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int result;
	
	public int idDuplicate(String getId, Connection conn) {
		System.out.println("MemberDAO 진입 성공");
		System.out.println("MemberDAO까지 잘들고왔나요 Id:"+getId);
		try {
			//1.DriverLoad - web.xml & jdbc.DBCPInitListner로 처리
			
			//2.Connection 얻기 - 여기에서는 Service로부터 Connection 객체를 전달받기, DAO 에서 직접 받을수도있다.
				//Service 클래스에서 conn으로 Connection 객체를 넘겨받았다.
			//3.객체준비 
				sql.append("select memberno,memberid,memberpwd,email");
				sql.append(" from member"); 
				sql.append(" where memberid = ?");
				
				psmt = conn.prepareStatement(sql.toString());
			//4.쿼리실행
				psmt.setString(1, getId);
				rs = psmt.executeQuery();
				rs.last();
				result = rs.getRow();
				System.out.println("검색된 row:"+result);
				//System.out.println("connection 얻기 성공");
			//5. 자원반납 -> jdbc.JdbcUtil클래스의 메소드들을 이용하여 처리해줌
			
		} catch (SQLException e) {
			//System.out.println("connection 얻기 실패");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
		 
		return result; //select 쿼리문 날린후에 row가1이면 id가있는것이고, 0이면 중복되는값이없는것
		
	}

	public Member getMember(String id, Connection conn) {
		System.out.println("MemberDAO 진입 성공");
		System.out.println("MemberDAO까지 잘들고왔나요 Id:"+id);
		int result = 0;
		try {
			//1.DriverLoad - web.xml & jdbc.DBCPInitListner로 처리
			
			//2.Connection 얻기 - 여기에서는 Service로부터 Connection 객체를 전달받기, DAO 에서 직접 받을수도있다.
				//Service 클래스에서 conn으로 Connection 객체를 넘겨받았다.
			//3.객체준비 
				sql.append("select memberno,memberid,memberpwd,email");
				sql.append(" from member"); 
				sql.append(" where memberid = ?");
				
				psmt = conn.prepareStatement(sql.toString());
			//4.쿼리실행
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				rs.last();
				result = rs.getRow();
				System.out.println("검색된 row:"+result);
				//System.out.println("connection 얻기 성공");
			//5. 자원반납 -> jdbc.JdbcUtil클래스의 메소드들을 이용하여 처리해줌
			
		} catch (SQLException e) {
			//System.out.println("connection 얻기 실패");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
		 
		return new Member(); //select 쿼리문 날린후에 row가1이면 id가있는것이고, 0이면 중복되는값이없는것
	}
	
	/* insert
	 * public int insertMember(String getId, String getPwd, String getName, String
	 * getEmail) {
	 * 
	 * return 0; }
	 */
}
