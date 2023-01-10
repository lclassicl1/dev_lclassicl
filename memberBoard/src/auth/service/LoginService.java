package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.management.RuntimeErrorException;

import jdbc.conn.ConnectionProvider;
import member.dao.MemberDAO;
import member.model.Member;

//이 클래스는 로그인 동작을 위해 존재하는 Service 클래스이다. 여기에서 DAO를 호출한다
public class LoginService {
	private MemberDAO memberDao = new MemberDAO();
	
	
	public User login(String memberid, String memberpwd) {
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			Member member = memberDao.selectById(conn, memberid);
			
			if(member == null) {
				throw new LoginFailException();
			}
			
			if(!member.matchPassword(memberpwd)) {
				throw new LoginFailException();
			}
			
			//새 user를 생성하여 return
			//이렇게 여러정보를 리턴하고싶을때는 객체를 생성하여 리턴해주면 된다.
			return new User(member.getMemberNo(), member.getMemberId(), member.getMemberName(), member.getGrade());
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
		
	}
	
}
