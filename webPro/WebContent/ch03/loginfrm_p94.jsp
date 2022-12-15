<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h1>login form</h1>
	<form action="login_p94.jsp" target="_blank" id="login" method="get">
		<fieldset>
		<legend>로그인</legend>
		아이디:<input type="text" name="id" id="id" size="10" placeholder="id"/><br/>
		비밀번호:<input type="password" name="pwd" id="pwd" placeholder="password"/><br/>
		<input type="submit" value="확인"/>
		<input type="reset" value="취소"/>
		</fieldset>
	
	</form>
</body>
</html>