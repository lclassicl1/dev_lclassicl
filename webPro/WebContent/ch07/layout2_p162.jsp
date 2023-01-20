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
	<style></style>
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
	<!-- jsp: 표준태그 -->
	<%-- <jsp:include page="포함시키고자 하는 Page"></jsp:include> --%>
	<jsp:include page="module/top.jsp"></jsp:include>
	<hr/>
	<h2>layout2.jsp</h2>
	<hr/>
	<jsp:include page="module/bottom.jsp"></jsp:include>
</body>
</html>