package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.JoinRequest;
import member.service.JoinService;
import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {
	private static String FORM_VIEW = "view/member/joinForm_p600.jsp";
	private static String JOIN_SUCCESS_VIEW = "view/member/joinSuccess_p601.jsp";


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//form의 요청방식에 따라 각각 다른 결과를 도출해냄(form에서 method의 방식에 따라 Controller의 동작을 나눔)
		
		//request의 메소드를 get 하면서, 해당 글자가 "get"과 대소문자 구별없이(ignorecase) 동일한지 조건식
		if(request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("get방식");
			return processForm(request, response); //메소드가 get으로 요청되면 회원가입 폼으로 이동시키는 method
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			System.out.println("post방식");
			return processSubmit(request, response); //메소드가 post로 요청되면 success page로 이동시키는 method
		} else {
			//HttpServletResponse.SC_METHOD_NOT_ALLOWED 상태코드 405(허용되지않는 메소드)
			//요청에 지정된 방법을 사용할수없다
			//예)post 방식으로 요청받는 서버에 get요청한다던지
			//또는 읽기전용소스에 put 요청을한다던지 이런경우에 405 코드를 제공
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); //error가 없다는 상태코드를 보여주는 메소드
			return FORM_VIEW;

		}
		
//		2.비즈니스 로직 수행
		
//		3.response 결과 모델화 request.getAtturibute

	} // process method의 끝
	
	
//		4.view 지정
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		//1.파라미터 가져오기
		//form에서 넘어오는 parameter 이름은 name 속성에서 넘어오는 명칭이다.
		String memberid = request.getParameter("memberid");
		String memberpwd = request.getParameter("memberpwd");
		String re_memberpwd = request.getParameter("re_memberpwd");
		String membername = request.getParameter("membername");
		String email_id = request.getParameter("email_id");
		String email_domain= request.getParameter("email_d");
		
		JoinService joinService = new JoinService(); //서비스 객체 생성
		JoinRequest joinRequest = new JoinRequest(); //Joinrequest 객체 생성
		
		joinRequest.setMemberid(memberid);
//		joinRequest.setMemberpwd(memberpwd);
//		joinRequest.setRe_memberpwd(re_memberpwd);
//		joinRequest.setMembername(membername);
//		joinRequest.setEmail_id(email_id);
//		joinRequest.setEmail_domain(email_domain);
		
		System.out.println("입력받은ID:"+joinRequest.getMemberid());
		joinService.join(joinRequest);
		
		return FORM_VIEW;
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW; //회원가입 form
	}

}
