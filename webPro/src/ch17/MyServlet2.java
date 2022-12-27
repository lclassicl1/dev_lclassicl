package ch17;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml에서 servlet으로 맵핑하는게 아닌 어노테이션으로 맵핑하는방법
@WebServlet(urlPatterns = "/ms2") 
public class MyServlet2 extends HttpServlet {
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
		out.println("<h1>오우2야오우오우오우으밍러ㅏㅁ나이로머나ㅣㅇ로미나오리ㅏㅁㄴ오라ㅣㅁㄴ로아ㅣㅗㄹ</h1>"); //태그도 먹는다
		Date today = new Date();
		out.println("<p>현재시간:"+today+"</p>");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년-MM월-dd일");
		out.println(sdf.format(today));
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
