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
			String getPwd = request.getParameter("memberpwd");
			String getName = request.getParameter("membername");
			String getEmail1 = request.getParameter("email_id");
			String getEmail2 = request.getParameter("email_d");
			System.out.println("입력받은 getId:"+getId);
			System.out.println("입력받은 Pwd:"+getPwd);
			System.out.println("입력받은 Name:"+getName);
			System.out.println("입력받은 Email:"+getEmail1+"@"+getEmail2);
		 /* 2. 비즈니스 로직 수행 ->Service<->DOA<->DB */
			MyMemberService service = new MyMemberService();
			int result = service.idDuplicate(getId);
			
		  		 /* 3. 수행결과 를 모델화
		  		  * 1.session 이용 
		  		  * session에 저장된 로그인한 user 정보
		  		  * session.setAttribute("",이름);
		  		  * */
				
				
		  		  /* 2. request 이용 
		  		   * request.setAttribute(String 속성명, Object 값);
		  		   *
		  		   * */
					
					//값을 여러개 넘겨줄수있다. 입력받은 id와 select 쿼리 실행후 반환받은 row의 수가 response 되었으니 이 둘을 view에 response 해준다.
					request.setAttribute("result", result);
					request.setAttribute("getId", getId);
		  		   
		  		  
		 /*4. 어떤 view를  보여줄지 지정 */
					/*
					 * if(result != 0) { return "view/member/idNo.jsp"; } else { return
					 * "view/member/idOK.jsp"; }
					 */
					return "view/member/idDuplicate.jsp";
	}
}
