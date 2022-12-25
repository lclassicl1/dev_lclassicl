<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page1</title>
</head>
<body>
	<h1>jsp forward와 param</h1>
	<form action="jspforward2.jsp">
		<!-- url에 user_name=입력값 으로 parameter가 넘어가게됨 -->
	이름:<input type="text" id="user_name" name="user_name" placeholder="이름"/>
	
		<!-- url에 user_pw=입력값으로 parameter가 넘어가게됨 --> 
	비번:<input type="password" id="user_pw" name="user_pw"/><br/>
	
		<!-- submit은 입력값을 가지고 form의 action을 수행시킨다 --> 
		<input type="submit" value="확인"/> 
	</form>  
</body>
</html>