package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//로그인 여부 검사 필터 역활을 하는 클래스 P612
//로그인여부를 검사
//로그인을 하지 않았다면, 로그인화면으로 이동시키고
//
//로그인을 했다면 요청할 기능을 실행

public class LoginCheckFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(false);
		
		if(session == null || session.getAttribute("authUser") == null) {
			System.out.println("로그인 안되어있음");
			HttpServletResponse res = (HttpServletResponse)response;
			String url = req.getContextPath()+"/login.do";
			/* alertGo(res, "로그인 안되어있어서 로그인화면으로이동됩니다", url); */
			res.sendRedirect(url);
		} else {
			System.out.println("로그인되어있음");
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	/* 얼럿창을 띄워보고싶었지만 현재 테스트중
	 * public static void alertGo(HttpServletResponse response, String msg, String
	 * url) { try { response.setContentType("text/html; charset=utf-8"); PrintWriter
	 * pw = response.getWriter(); pw.println("<script>alert('되나요')</scirpt>");
	 * pw.flush(); pw.close(); } catch (IOException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); }
	 * 
	 * }
	 */
	
	

}
