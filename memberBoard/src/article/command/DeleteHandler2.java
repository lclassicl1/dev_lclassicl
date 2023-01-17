package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.DeleteArticleService;
import mvc.command.CommandHandler;

public class DeleteHandler2 implements CommandHandler {
	private static String RETURN_VIEW="/view/article/deleteArticle2.jsp"; //성공하면 list page로	
	private DeleteArticleService deleteArticle = new DeleteArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("DELETE HANDLER 진입");
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("no="+no);
		
		int result = deleteArticle.deleteArticle(no);
		
		request.setAttribute("result", result);
		
		
		return RETURN_VIEW;
		
	}

}
