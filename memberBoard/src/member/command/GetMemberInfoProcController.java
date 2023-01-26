package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.service.MyMemberService;
import mvc.command.CommandHandler;

public class GetMemberInfoProcController implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		System.out.println(id);
		
		MemberDAO memberDAO = new MemberDAO();
		MyMemberService mmService = new MyMemberService();
		
		mmService.idDuplicate(id);
		
			
		
		
		
		
		
		
		return null;
	}

}
