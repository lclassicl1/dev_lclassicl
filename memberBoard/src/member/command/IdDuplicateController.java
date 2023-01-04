package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MyMemberService;
import mvc.command.CommandHandler;

//이 클래스는 myJoinForm에서 Id중복확인을 누르면 open으로 새창이뜨고, idDuplicate.jsp에서 submit 버튼을 누르면 호출되는클래스
//또한 idDuplicate.do를 입력했을때 호출되는 클래스
public class IdDuplicateController implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//System.out.println("idDup 클래스 호출");
		/*
		 * 컨트롤러가 해야할일 
		 * 1. 요청과 함께 넘어온 parameter 얻기*/ 
			String getId = request.getParameter("search");
			System.out.println("입력받은 ID:"+getId);
		 /* 2. 비즈니스 로직 수행 ->Service<->DOA<->DB */
			MyMemberService service = new MyMemberService();
			int result = service.idDuplicate(getId);
			
		  		 /* 3. 수행결과 를 모델화 
		 * 4. 어떤 view를  보여줄지 지정
		 */
			if(result != 0) {
				return "view/member/idNo.jsp";
			} else {
				return "view/member/idOK.jsp";
			}
		
	}

}
