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
	<title>파일업로드 예제</title>
	<style></style>
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
	<h1>파일업로드 Page</h1>
	<!-- 파일업로드 form -->
	<form action="result.jsp" method="post" enctype="multipart/form-data">
	파일1:<input type="file" name='file1' id='file1'/>
	<!-- 파일2:<input type="file" name='file2'/> -->
	<input type='submit' value='전송'/>
	</form>
</body>
</html>