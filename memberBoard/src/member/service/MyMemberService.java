package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.conn.ConnectionProvider;
import member.dao.MyMemberDAO;
import member.model.Member;

//이 클래스는 비즈니스 로직을 수행하는 Service 클래스
//컨트롤러에서 DAO 가기전 단계에서 중간다리역활로 Controller -> service -> DAO -> DB
public class MyMemberService {
	private MyMemberDAO mmDao = new MyMemberDAO(); 
	
	
	//method
	public int idDuplicate(String getId) { //IdDuplicateController에서 구한 입력받은 ID를 넘겨받았다. getId
		//DAO를 호출하는 역활(ID 중복 조회를 하는 메소드)
		System.out.println("Memberservice 클래스 진입");
		Connection conn = null; //Connection 객체 받을 변수 준비
		
		
		try {
			conn = ConnectionProvider.getConnection(); //jdbc.conn에 있는 ConnectionProvider를 통하여 getConnection
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		//MyMemberDAO 객체 생성
		 int result = mmDao.idDuplicate(getId, conn); //Controller에서 넘겨받은 매개변수를 그대로 다시 전달
		 
		return result;
	}
	
	public Member getMember(String id) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();
		return mmDao.getMember(id, conn);
	}
	
	/*
	 * public int insertMember(String getId, String getPwd, String getName, String
	 * getEmail) { MyMemberDAO mDao = new MyMemberDAO();
	 * mDao.insertMember(getId,getPwd,getName,getEmail); return 0; }
	 */

}
