<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  	<!-- google cdn 방식 jquery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta name="description" content="memberboard web app">
  <meta name="keywords" content="article, javascript, board, webProject">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<style>
		img {
			width: 300px;
			height: 300px;
		}
	</style>
	<script>
		$(function(){
			$('img').click(function(){
				location.href=$(this).attr('src');
			});
		});
	</script>
</head>
<body>
	download.jsp
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<c:set var='data1' value="${param.data1}"/>		
	<c:set var='data2' value="${param.data2}"/>		
	<c:set var='data3' value="${param.data3}"/>		
	
	1.<c:out value="${data1}"/> <br/>
	2.<c:out value="${data2}"/> <br/>
	3.<c:out value="${data3}"/>
	
	<c:if test="${!empty data1}">
		<img src='<%=request.getContextPath()%>/download.dong?fileName=${data1}'/>
	</c:if>
	<br/>
	<br/>
	<c:if test="${!empty data2}">
		<img src='<%=request.getContextPath()%>/download.dong?fileName=${data2}'/>
	</c:if>
	<br/>	
	<br/>
	<c:if test="${!empty data3}">
		<img src='<%=request.getContextPath()%>/download.dong?fileName=${data3}'/>
	</c:if>	
</body>
</html>