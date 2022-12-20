<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginform02.jsp</title>
</head>
<body>
	<%String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		if(user_id.equals("admin") && user_id != null) {
			String url = "loginform03_1220.jsp?user_id="+user_id+"&user_pw="+user_pw;
			response.sendRedirect(url);
		}
		%>
	<h1><%=user_id %>님 환영합니다</h1>
	
	<h2>ID:<%=user_id%></h2>
	<h2>PW:<%=user_pw%></h2>
</body>
</html>