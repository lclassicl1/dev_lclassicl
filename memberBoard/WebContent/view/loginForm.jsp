<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#field {
	
	}
</style>
<title>로그인</title>
</head>
<body>
	<fieldset id="field">
		<legend>로그인Page</legend>
			<c:if test="${errors.notMach}">
				아이디와 암호가 일치하지 않습니다.
			</c:if>
		<form action="login.do" method="post">
			<p>
			아이디:<input type="text" name="memberid"/>
			<c:if test="${errors.memberid}">ID를 입력하세요</c:if>
			</p>
			<p>
			비밀번호:<input type="password" name="memberpwd"/>
			<c:if test="${errors.memberpwd}">암호를 입력하세요</c:if>
			</p>
			<input type="submit" value="Login"/>&nbsp;<input type="reset" value="cancel">&nbsp;<input type="button" value="home" onclick='location.href="<%=request.getContextPath()%>/index.jsp"'>
		</form>
	</fieldset>	
</body>
</html>