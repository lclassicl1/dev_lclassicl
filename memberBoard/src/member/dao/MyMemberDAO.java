package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO(Data Access Object): DB연동하여 쿼리관련 실행기능이 있는 클래스
//이 클래스는 DAO로써 주로 회원관련 DB 작업을 실행
public class MyMemberDAO {
	//db와 연동하기위한 DB계정 아이디 비번 URL
	String url = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=utf8";
	String id = "gangnam";
	String pwd = "asdf111";
	StringBuffer sql = new StringBuffer();
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int result;
	
	public int idDuplicate(String getId) {
		System.out.println("MemberDAO 진입 성공");
		System.out.println("MemberDAO까지 잘들고왔나요 Id:"+getId);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pwd); //URL과 ID, PWD를 이용하여 커넥션 객체를 얻는다.
			
			sql.append("select * from member "); 
			sql.append("where memberid = ?");
			
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, getId);
			rs = psmt.executeQuery();
			rs.last();
			result = rs.getRow();
			System.out.println("검색된 row:"+result);
			//System.out.println("connection 얻기 성공");
		} catch (ClassNotFoundException | SQLException e) {
			//System.out.println("connection 얻기 실패");
			e.printStackTrace();
		}
		
		return result; //select 쿼리문 날린후에 row가1이면 id가있는것이고, 0이면 중복되는값이없는것
		
	}
}
