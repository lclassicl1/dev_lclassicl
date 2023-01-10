package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;
import member.dao.MemberDAO;
import member.model.Member;

//p621
//비번변경을 포함한 개인정보수정도 가능한 Service 클래스
public class ChangePwdService {
	private MemberDAO memberDAO = new MemberDAO();
	
	public void changePassword(String memberid, String memberpwd, String new_memberpwd) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false); //auto커밋 방지
			
			
			Member member = memberDAO.selectById(conn, memberid);
			if(member == null) {
				throw new MemberNotFoundException();
			}
			if(!member.matchPassword(memberpwd)) {
				System.out.println("비밀번호가 틀립니다");
				throw new InvalidPasswordException();
			}
			
			member.changePassword(new_memberpwd);
			
			memberDAO.update(conn, member);
			
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn); //문제가 생겼을때 롤백
			throw new RuntimeException(e);
			
		} finally {
			JdbcUtil.close(conn);
			
		}
	}
}
