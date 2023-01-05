package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {
	private static String FORM_VIEW = "view/member/joinForm_p600.jsp";
	private static String TEST_VIEW = "view/testView.jsp";


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		1.파라미터 가져오기
//		2.비즈니스 로직 수행
//		3.response 결과 모델화
//		4.view 지정
		
		System.out.println("JoinHandler 왔다갑니다");
		return FORM_VIEW;
	}

}
