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
	<form action="download.jsp" method='post'>
		<input type='hidden' name='data1' value='1.jpg'/>
		<input type='hidden' name='data2' value='2.jpg'/>
		<input type='hidden' name='data3' value='3.png'/>
		<input type='submit' value='Download'/>
	</form>
</body>
</html>