package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;
import member.dao.MemberDAO;
import member.model.Member;

//p596 coltroller에 의해 호출되는 service 클래스 여러가지 기능을 제공한다
//controller가 받은 parameter를 넘겨받아 dao에 전달하는 역활을 한다
public class JoinService {
	//회원정보를 담고있는 클래스를 필드로 선언
	private MemberDAO memberDAO = new MemberDAO();
	Connection conn;
	
	//method
	//회원가입(ID중복검사 포함)
	//JoinRequest 클래스에는 회원정보가 담겨있다.
	public void join(JoinRequest joinReq) {
		//id 중복검사
		System.out.println("JoinService 진입");
		try {
			//Connection 가져옴
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false); //auto commit 기능 해제
			
			
			Member member = memberDAO.selectById(conn, joinReq.getMemberid()); //id의 값을 가져옴
			if(member != null) {
				JdbcUtil.rollback(conn);
			}
			
			
			//insert 기능이 있는 DAO 호출
			memberDAO.insert(conn, new Member(
					
					));
			
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
	}
}
