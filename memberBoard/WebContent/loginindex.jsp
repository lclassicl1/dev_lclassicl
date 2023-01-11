<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 index</title>
<script>
	function logout() {
		location.href="/logout.do";
	}
</script>
</head>
<body>
	<h1>${authUser.membername}님 환영합니다.</h1>
	<p>세션id:<%=session.getId() %></p>
	<p>세션마지막접근시간(long):<%=session.getLastAccessedTime() %></p>
	<p>session.getValue:<%=session.getValue("authUser")%>
	
	
	<p>회원번호:${authUser.memberno}</p>
	<p>회원ID:${authUser.memberid}</p>
	<p>회원이름:${authUser.membername}</p>
	<p>회원등급:
	<c:choose>
		<c:when test="${authUser.grade==1}">기본(${authUser.grade})등급</c:when>
		<c:when test="${authUser.grade==999 }">관리자(${authUser.grade})등급<br>
						<a href="#">회원관리</a><br/>
						<a href="#">게시판관리</a></c:when>
	</c:choose>	</p>
	<input type="button" value="logout" onclick="logout();"/>&nbsp;<a href="/changePwd.do">비밀번호변경하러 가기</a>
	<div id="map" style="width:500px;height:400px;"></div>
</body>
</html>