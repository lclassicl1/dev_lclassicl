<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.errors{
		color: red;
	}

</style>
<title>비밀번호 변경 Page</title>
</head>
<body>
	<h1>비밀번호 변경 Page</h1>
	<form action="/changePwd.do" method="post">
	현재비밀번호:<input type="password" name="memberpwd" id="memberpwd" value=""/>
	<span class="errors"><c:if test="${errors.oldPwd}">비밀번호를 입력해주세요</c:if></span>
	<span class="errors"><c:if test="${errors.invalid}">기존비밀번호가 일치하지않습니다</c:if></span>
	변경할비밀번호:<input type="password" name="new_memberpwd" id="new_memberpwd"/>
	<span class="errors"><c:if test="${errors.newPwd}">새비밀번호를 입력해주세요</c:if></span>
	비밀번호확인:<input type="password" name="renew_memberpwd" id="renew_memberpwd"/>
	<span class="errors"><c:if test="${errors.newPwd}">새비밀번호를 입력해주세요</c:if></span>
	<input type="submit" value="변경하기"/>
	</form>
</body>
</html>