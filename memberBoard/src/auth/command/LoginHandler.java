package auth.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {
	private final static  String LOGIN_VIEW = "view/loginForm.jsp"; 
	private LoginService loginService = new LoginService();
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginHandler 진입");
		
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
			return LOGIN_VIEW;

		}	
		
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return LOGIN_VIEW; //회원가입 form
	}
	
	
	//로그인 처리
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("processSubmit 진입");
		String memberid = request.getParameter("memberid");
		String memberpwd = request.getParameter("memberpwd");
		
		System.out.println("memberid:"+memberid);
		System.out.println("memberpwd:"+memberpwd);

		//error 관련 Map 객체 생성
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		
		if(memberid == null || memberid.isEmpty()) {
			errors.put("memberid", Boolean.TRUE);
		}
		
		if(memberpwd == null || memberpwd.isEmpty()) {
			errors.put("memberpwd", Boolean.TRUE);
		}
		
		if(!errors.isEmpty()) {
			return LOGIN_VIEW;
		}
		
		try {
			//모델화 하는법 2가지
			//request.setAttribute("속성값", Object value);
			//session.setAttribute("속성값", Object value);
			User user = loginService.login(memberid, memberpwd);
			request.getSession().setAttribute("authUser", user);
			try {
				response.sendRedirect(request.getContextPath()+"/loginindex.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		} catch(LoginFailException e) {
			errors.put("notMach", Boolean.TRUE);
			return LOGIN_VIEW;
		}
		
		
	}
	

	//문자열의 좌우 공백 제거
	private String trim(String str) {
		return str == null ? null : str.trim();
	}

}
