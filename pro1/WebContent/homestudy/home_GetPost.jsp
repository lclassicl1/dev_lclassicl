<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Get방식, Post방식</h1>
	<form action="home_result.jsp" method="get">
		이름:<input type="text" name="username" id="username"/><br/>
		별명:<input type="text" name="nickname" id="nickname"/><br/>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>