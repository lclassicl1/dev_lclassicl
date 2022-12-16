<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인성공</title>
</head>
<body>
	<h1>로그인성공페이지</h1>
	<img src="../image/faker.jpg"/>
	<%String name = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		out.print(name+"님 환영합니다<br/>비밀번호는:"+pwd);%>
</body>
</html>