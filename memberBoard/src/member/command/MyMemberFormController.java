package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

//mvc.command의 commentHandler의 구현클래스
//controller 클래스, URL registerForm.do로 요청되면 호출되는 controller 클래스
public class MyMemberFormController implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * 컨트롤러가 해야할일 
		 * 1. 요청과 함께 넘어온 parameter 얻기 
		 * 2. 비즈니스 로직 수행 ->Service<->DOA<->DB
		 * 3. 수행결과 를 모델화 
		 * 4. 어떤 view를  보여줄지 지정
		 */
		System.out.println("MyMemberForm 호출 성공");
		return "view/member/myJoinForm.jsp";
	}

}
