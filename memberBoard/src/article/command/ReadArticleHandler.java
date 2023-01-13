package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ReadArticleService;
import mvc.command.CommandHandler;

//상세조회 담당 Controller
// http://localhost/article/read.do
public class ReadArticleHandler implements CommandHandler {
	private final static  String VIEW = "/view/article/readArticle.jsp"; 
	private ReadArticleService readService = new ReadArticleService();
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("readArticle 진입");
		
		//파라미터 받기
		//article/read.do?no=${article.article_no}&pageNo=${articlePage.currentPage}&rowSize=${rSize}
		
		int no = Integer.parseInt(request.getParameter("no")); //상세조회할 글번호
		int strPageNo = Integer.parseInt(request.getParameter("pageNo")); //현재 페이지번호
		int rowsize = Integer.parseInt(request.getParameter("rowSize")); //페이지에 보여줄 글수?
		
		ArticleData articleData = readService.getAticle(no);
		request.setAttribute("articleData", articleData);
		request.setAttribute("strPageno", strPageNo);
		request.setAttribute("rowSize", rowsize);
		
		
		return VIEW;
	}

}
