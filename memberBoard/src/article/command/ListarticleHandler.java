package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class ListarticleHandler implements CommandHandler {
	private final static String LIST_VIEW = "/view/article/listArticle.jsp"; 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("article Handler 진입");
		return LIST_VIEW;
	}

}
