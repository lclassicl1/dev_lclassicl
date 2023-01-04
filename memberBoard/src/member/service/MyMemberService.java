package member.service;

import member.dao.MyMemberDAO;

//이 클래스는 비즈니스 로직을 수행하는 Service 클래스
//컨트롤러에서 DAO 가기전 단계에서 중간다리역활로 Controller -> service -> DAO -> DB
public class MyMemberService {
	
	
	//method
	public int idDuplicate(String getId) { //IdDuplicateController에서 구한 입력받은 ID를 넘겨받았다. getId
		//DAO를 호출하는 역활(ID 중복 조회를 하는 메소드)
		System.out.println("Memberservice 클래스 진입");
		 
		//MyMemberDAO 객체 생성
		 MyMemberDAO mDao = new MyMemberDAO(); 
		 int result = mDao.idDuplicate(getId); //Controller에서 넘겨받은 매개변수를 그대로 다시 전달
		 
		return result;
	}

}
