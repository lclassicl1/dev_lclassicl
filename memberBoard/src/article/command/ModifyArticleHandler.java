package article.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;

public class ModifyArticleHandler implements CommandHandler {
	private final static  String MODIFYFORM_VIEW = "/view/article/modifyForm.jsp";
	private final static  String MODIFYSUCCESS_VIEW = "/view/article/modifySuccess.jsp";
	//상세 보기를 위한 readArticleService 객체 생성
	private ReadArticleService readService = new ReadArticleService();
	private ModifyArticleService modifyService = new ModifyArticleService();
	
	//수정 처리를위한 service 호출
	/* private ModifyArticleService modifyService = new ModifyArticleService(); */
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("modifyHandler 진입");
		
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("get방식");
			return processForm(request, response); //메소드가 get으로 요청되면 수정 폼으로 이동시키는 method
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			System.out.println("post방식");
			return processSubmit(request, response); //메소드가 post로 요청되면 수정처리요청 page로 이동시키는 method
		} else {
			//HttpServletResponse.SC_METHOD_NOT_ALLOWED 상태코드 405(허용되지않는 메소드)
			//요청에 지정된 방법을 사용할수없다
			//예)post 방식으로 요청받는 서버에 get요청한다던지
			//또는 읽기전용소스에 put 요청을한다던지 이런경우에 405 코드를 제공
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); //error가 없다는 상태코드를 보여주는 메소드
			return MODIFYFORM_VIEW;
		
		}
		
		
	}
	
	//수정 폼으로 이동하는 메서드(해당 게시글의 제목과 내용이 같이 출력되어야 한다)
	private String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//글번호에 대한 파라미터 가져오기
				try {
				int no = Integer.parseInt(request.getParameter("no"));
				
				String strPageNo = request.getParameter("PageNo");
				int pageNo = 1;
				
				if(strPageNo != null) {
					pageNo = Integer.parseInt(strPageNo);
				}
				
				String rowsize = request.getParameter("rowSize");
				int rSize = 3;
				
				if(rowsize != null) {
					rSize = Integer.parseInt(rowsize);
				}
				
				
				
				ArticleData articleData = readService.getAticle(no, false);
				User user = (User)request.getSession().getAttribute("authUser");
				System.out.println(user.getMemberid());
				
				if(!canModify(user, articleData)) {
						System.out.println("로그인 안되어있지?");
						response.sendError(HttpServletResponse.SC_FORBIDDEN);
						return MODIFYFORM_VIEW;
				} 
					//로그인한 userid, 글번호, db에 저장되어있는 제목과 내용
					ModifyRequest modifyRequest = new ModifyRequest(user.getMemberid(), no, articleData.getArticle().getWriter().getName(), articleData.getArticle().getTitle(), articleData.getArticleContent());
					request.setAttribute("modReq", modifyRequest);
					request.setAttribute("rowSize", rSize);
					request.setAttribute("pageNo", pageNo);
					return MODIFYFORM_VIEW;
					} catch (ArticleNotFoundException e) {
						response.sendError(HttpServletResponse.SC_NOT_FOUND);
						e.printStackTrace();
						return null;
					}
				
	}	

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//글번호에 대한 파라미터 가져오기
		
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("글번ㅇ호 몇번?"+no);
		
		String strPageNo = request.getParameter("PageNo");
		int pageNo = 1;
		
		if(strPageNo != null) {
			pageNo = Integer.parseInt(strPageNo);
		}
		
		String rowsize = request.getParameter("rowSize");
		int rSize = 3;
		
		if(rowsize != null) {
			rSize = Integer.parseInt(rowsize);
		}
		
		String title = request.getParameter("title"); //수정할 글의 제목
		String content = request.getParameter("content"); //수정할 글의 내용
		
		
		ArticleData articleData = readService.getAticle(no, false);
		User user = (User)request.getSession().getAttribute("authUser");
		
		ModifyRequest modifyRequest = new ModifyRequest(user.getMemberid(), no, user.getMembername(), title, content);
		request.setAttribute("modReq", modifyRequest);
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		modifyRequest.validate(errors);
		
		if(!errors.isEmpty()) {
			return MODIFYFORM_VIEW;
		}
	
		try {
			modifyService.modify(modifyRequest);
			return MODIFYSUCCESS_VIEW;
		
		} catch (ArticleNotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
			
	
	}
	



	//수정 권한 체크, 로그인한 id가 작성자와 일치하는지 검증후 일치하면 true, 아니면 false
	private boolean canModify(User user , ArticleData articleData) {
		//작성자 정보를 가져오는 writer_id
		String writer_id = articleData.getArticle().getWriter().getId();
		
		//user는 로그인한 user의 정보가 담겨있는 객체.
		return user.getMemberid().equals(writer_id);
	}
	
}
