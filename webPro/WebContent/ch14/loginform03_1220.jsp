<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin page</title>
</head>
<body>
	<h1>Admin Page입니다</h1>
	<%String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");%>
		
	<h2><%=user_id%>님 환영합니다.</h2>
</body>
</html>