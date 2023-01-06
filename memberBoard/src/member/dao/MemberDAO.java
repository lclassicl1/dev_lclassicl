package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.sql.Timestamp;


import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDAO {
	StringBuffer sql = new StringBuffer();
	PreparedStatement psmt;
	ResultSet rs;
	
	//parameter memberid = 유저가 입력한 id값, conn은 ConnectionProvider에서 connection 객체를 Service에서 넘겨받음
	public Member selectById(Connection conn, String memberid) {
		System.out.println("MemberDAO 진입() 넘겨받은 아이디"+memberid);
		sql.append("select memberno, memberid, membername, memberpwd, email, regdate, grade");
		sql.append(" from member");
		sql.append(" where memberid = ?");
		Member member = null; //user가 입력한 아이디를 사용하는 기존 member를 리턴하기 위한 변수
		try {
			//쿼리실행
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, memberid);
			rs = psmt.executeQuery();
			
			//쿼리의 결과가 있다면, id가 존재하는것이므로
			if(rs.next()) {
				int mno = rs.getInt("memberno");
				String mid = rs.getString("memberid");
				String mname = rs.getString("membername");
				String mpwd = rs.getString("memberpwd");
				String email = rs.getString("email");
				Date rDate = toDate(rs.getTimestamp("regdate"));
				int grade = rs.getInt("grade");
				//해당 member테이블에서 해당 컬럼값들을 다 가져와서
				//리턴할 변수에 새롭게 대입해준다.
				member = new Member(mno, 
									mid, 
									mname, 
									mpwd, 
									email, 
									rDate, 
									grade);
				System.out.println("member:"+member.toString());
				return member;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
		
		return member;
	}

	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
	
	//service 클래스에서 호출되는 insert 메소드 member의 정보를 전달받아 insert를 실행하는 메소드
	public void insert(Connection conn, Member member) {
		
	}
	


}
