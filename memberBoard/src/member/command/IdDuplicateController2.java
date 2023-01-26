package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MyMemberService;
import mvc.command.CommandHandler;

//이클래스는 id중복검사요청 ajax verion의 호출 컨트롤러
public class IdDuplicateController2 implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		/*
		 * 1. 요청과 함께 넘어온 parameter 얻기 ajax는 json 형태로 데이터를 넘긴다 {id:idtxt}*/ 
			String id = request.getParameter("id");  
		 /* 2. 비즈니스 로직 수행 ->Service<->DOA<->DB */
			
			MyMemberService mmService = new MyMemberService(); //쿼리문 실행
			int result = mmService.idDuplicate(id); //result에 담기는 리턴값이 1이면 아이디 사용불가 0이면 사용 가능
			
			response.setCharacterEncoding("UTF-8"); //응답결과가 한글 깨지지않게 인코딩 설정
			if(result == 1) { //중복되는 id가 있다
				response.getWriter().print("1"); //browse에 출력하기위한 writer 클래스 생성
				 
			} else {//중복되는 아이디가 없다 즉 사용가능한 아이디이다.
				response.getWriter().print("2");
			}
		 	return null;
	}
}
