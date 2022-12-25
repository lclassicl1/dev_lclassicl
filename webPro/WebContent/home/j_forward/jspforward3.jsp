<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Forward로 보내진 page3 </h1>
	<%String name = request.getParameter("user_name");
		String pw = request.getParameter("user_pw");
		String nic = request.getParameter("user_nic");
		%>
		
		<h2>넘겨받은이름:<%=name %></h2>
		<h2>넘겨받은비번:<%=pw %></h2>
		<h2>Param으로 넘겨받은것:<%=nic %></h2>
		
		
</body>
</html>