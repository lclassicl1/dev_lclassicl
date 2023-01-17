package article.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import mvc.command.CommandHandler;

//쓰기 기능을 구현하고 쓰기 form을 보여주는 컨트롤러
public class WriteArticleHandler implements CommandHandler {
	private final static  String WRITE_VIEW = "/view/article/writeForm.jsp"; 
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WriteArticleHandler 진입");
		
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("get방식");
			return processForm(request, response); //메소드가 get으로 요청되면 쓰기 폼으로 이동시키는 method
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			System.out.println("post방식");
			return processSubmit(request, response); //메소드가 post로 요청되면 쓰기처리 요청로 이동시키는 method
		} else {
			//HttpServletResponse.SC_METHOD_NOT_ALLOWED 상태코드 405(허용되지않는 메소드)
			//요청에 지정된 방법을 사용할수없다
			//예)post 방식으로 요청받는 서버에 get요청한다던지
			//또는 읽기전용소스에 put 요청을한다던지 이런경우에 405 코드를 제공
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); //error가 없다는 상태코드를 보여주는 메소드
			return WRITE_VIEW;
		
		}
		
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = getUser(request);
		request.setAttribute("authUser", user);
		return WRITE_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		User user = (User) request.getSession().getAttribute("authUser");
		String title = request.getParameter("title"); //제목
		String content = request.getParameter("content"); //내용
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		//writeReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return WRITE_VIEW;
		}
		
		
		
		return "/view/newArticleSuccess.jsp";
	}
	
	//로그인한 유저의 정보를 메소드화
	public User getUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("authUser");
		return user;
	}
	

}
