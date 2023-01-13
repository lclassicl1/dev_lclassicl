package article.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.model.Article;
import article.service.ArticlePage;
import article.service.ListArticleService;
import mvc.command.CommandHandler;

public class ListarticleHandler implements CommandHandler {
	private final static String LIST_VIEW = "/view/article/listArticle.jsp"; 
	private ListArticleService listService = new ListArticleService();
	int size;
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("articleList Handler 진입");
		
		//페이징 처리시 코드
		String strPageNo = request.getParameter("pageNo"); //유저가 선택하는 Page 번호
		int pageNo = 1;
		
		if(strPageNo != null) {
			pageNo = Integer.parseInt(strPageNo);
		}
		
		
		
		
		String strsize = request.getParameter("rowSize");
		int rSize = 3;
		
		if(strsize != null) {
			rSize = Integer.parseInt(strsize);
		}
		
		//페이징 작업 추가 예정
		ArticlePage articlePage = listService.getArticlePage(rSize, pageNo);
		request.setAttribute("articlePage", articlePage);
		request.setAttribute("rSize",rSize);
		
		return LIST_VIEW;
	}

}
