package ch17;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//웹에서도 동작이 가능하게끔 HttpServlet을 상속받는다
public class MyServlet extends HttpServlet {
	@Override
	public void init() throws ServletException { //웹 어플리케이션 시작시 단 한번만 호출이 되는 init method

	}
	@Override
	//get방식으로 요청시 호출 request와 response는 무조건 한쌍이다
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget");
		response.setContentType("text/html; charset=utf-8"); //browser에게 html 문서를 읽어들이라고 명령, utf-8 인코딩 방식으로
		
		PrintWriter out = response.getWriter(); //입출력과 관련된 녀석, getWriter가 PrintWriter 타입을 반환한다
		out.println("<!DOCTYPE HTML>");
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<title>");
		out.println("제목");
		out.println("</title>");
		out.println("<body>");
		out.println("<h1>오우야</h1>"); //태그도 먹는다
		out.println("</body>");
		out.println("</html>");
		
	}
	
	
	@Override
	//post 방식으로 요청시 호출
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("dopost");
	}
	
	
	@Override
	public void destroy() { //종료시 호출되는 method
		System.out.println("destroy 호출");
		super.destroy();
	}
}
