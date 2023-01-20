package article.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.model.Writer;
import article.service.WriteRequest;
import auth.service.User;
import auth.service.WriteArticleService;
import mvc.command.CommandHandler;

//쓰기 기능을 구현하고 쓰기 form을 보여주는 컨트롤러
public class WriteArticleHandler implements CommandHandler {
	private final static  String WRITE_VIEW = "/view/article/writeForm.jsp"; 
	private WriteArticleService writeArticle = new WriteArticleService();
	
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
		String strSize = request.getParameter("rowSize");
		System.out.println("rSize="+strSize);
		int rSize = Integer.parseInt(strSize);
		request.setAttribute("rSize", rSize);
		request.setAttribute("authUser", user);
		
		return WRITE_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		User user = (User) request.getSession().getAttribute("authUser");
		String title = request.getParameter("title"); //제목
		String content = request.getParameter("content"); //내용
		int rowSize = Integer.parseInt(request.getParameter("rowSize")); //한페이지의 게시글수
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		WriteRequest writeReq = createWriteRequest(user, request);
		writeReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return WRITE_VIEW; //여기서 view로 넘어갈때 map 방식의 errors내용이 담긴 세션도 같이 넘어간다
		}
		
		int newArticleNo = writeArticle.write(writeReq);
		request.setAttribute("newArticleNo", newArticleNo);
		request.setAttribute("rSize", rowSize);
		System.out.println("세션에 보내준 rowSize:"+rowSize);
		
		
		return "/view/newArticleSuccess.jsp";
	}
	
	//유효성검사
	
	//리턴유형 writeRequest는 로그인한 유저의 아이디와 이름(Writer)을 가지고 있고, 입력받은 title과 content를 가지고있다.
	private WriteRequest createWriteRequest(User user, HttpServletRequest request) {
		return new WriteRequest(
					new Writer(user.getMemberid(),user.getMembername()),
					request.getParameter("title"),
					request.getParameter("content"));
	}
	
	//로그인한 유저의 정보를 메소드화
	public User getUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("authUser");
		return user;
	}
	

}
