package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class WriteArticleHandler implements CommandHandler {
	private final static  String TEST_VIEW = "testView.jsp"; 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return TEST_VIEW;
	}

}
