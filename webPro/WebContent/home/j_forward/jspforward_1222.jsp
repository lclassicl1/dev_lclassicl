<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp forward와 param</h1>
	<form action="jspforward2.jsp">
	이름:<input type="text" id="user_name" name="user_name" placeholder="이름"/>
	비번:<input type="password" id="user_pw" name="user_pw"/><br/>
		<input type="submit" value="확인"/>
	</form>  
</body>
</html>