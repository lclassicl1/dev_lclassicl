<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h1>parameter 넘어와서 출력됩니다</h1>
	
<%-- 	<%String id = request.getParameter("id"); 
		String pwd = request.getParameter("pwd");
		if(id != null & id.equals("faker") & pwd.equals("1234")) {
			response.sendRedirect("forword03_1219.jsp?id="+id+"&pwd="+pwd);
		} else if(id != null & !id.equals("faker") & !pwd.equals("1234")) {
			out.print("faker는 아니지만 id는:"+id+"입니다<br/>비밀번호는:"+pwd+"입니다");%><br/>
			<h2><a href="forword03_1219.jsp?id=<%=id%>&pwd=<%=pwd%>">response03.jsp로 강제이동</a></h2>
		<%} else {
			out.print("입력된 아이디가 없습니다");
		}
		%> --%>
		<%-- <jsp:forward page="넘어갈 경로 및 파일명"></jsp:forward> --%>
		<!-- 또다른 forword 하는 방법(java)
		RequestDispatcher 참조변수 = request.getRequestDispatcher("넘어갈페이지주소");
		참조변수.forward(SevletRequest객체, SevletResponse객체); -->
		<%String id = request.getParameter("id");
	  		String pwd = request.getParameter("pwd");%>
		<jsp:forward page="forword03_1219.jsp">
			<jsp:param value="<%=id%>" name="id"/>
			<jsp:param value="<%=pwd%>" name="pwd"/>
		</jsp:forward>
</body>
</html>