package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import member.service.ChangePwdService;
import member.service.InvalidPasswordException;
import member.service.MemberNotFoundException;
import mvc.command.CommandHandler;

//이 컨트롤러는 비번변경폼을 보여주고, 변경처리요청을 처리하는 클래스
public class ChangePasswordHandler implements CommandHandler {
	private final static  String CHANGEPWD_VIEW = "view/member/changePwd.jsp";
	private final static String CHANGEPWDSUCCESS_VIEW = "view/member/changepwdSuccess.jsp";
	private ChangePwdService changePwdService = new ChangePwdService();
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("비밀번호 변경 Handler 접속");
		
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
			return CHANGEPWD_VIEW;
		
		}

	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("ChangePassword processSubmit 정상진입");
		User user = (User) request.getSession().getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		String oldPwd = request.getParameter("memberpwd");
		String newPwd = request.getParameter("new_memberpwd");
		
		if(oldPwd == null || oldPwd.isEmpty()) {
			errors.put("oldPwd", Boolean.TRUE);
		}
		
		if(newPwd == null || newPwd.isEmpty()) {
			errors.put("newPwd", Boolean.TRUE);
		}
		
		/*
		 * if(user.getmemberpwd().equals(newPwd)) { errors.put("invalid", Boolean.TRUE);
		 * }
		 */
		if(!errors.isEmpty()) {
			return CHANGEPWD_VIEW;
		}
		
		try {
		changePwdService.changePassword(user.getMemberid(), oldPwd, newPwd);
			return CHANGEPWDSUCCESS_VIEW;
		
		} catch(InvalidPasswordException e) {

			errors.put("badoldPwd", Boolean.TRUE);
			return CHANGEPWD_VIEW;
		} catch(MemberNotFoundException e) {
			try {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			} catch (IOException e1) {
				e1.printStackTrace();
				return null;
			}
		}
		return null;
		
		
		
		
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return CHANGEPWD_VIEW; //회원가입 form
	}	
}



	
