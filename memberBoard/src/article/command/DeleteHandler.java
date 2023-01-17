package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.DeleteArticleService;




//글삭제(update) ver 를 담당하는 컨트롤러
public class DeleteHandler implements mvc.command.CommandHandler{
	private static String RETURN_VIEW="/view/article/deleteArticle2.jsp"; //성공하면 list page로	
	private DeleteArticleService deleteArticle = new DeleteArticleService();
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DELETE HANDLER 진입");
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("no="+no);
		
		int result = deleteArticle.deleteArticle2(no);
		
		request.setAttribute("result", result);
		
		
		return RETURN_VIEW;
	}


	

}
