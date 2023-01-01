<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
     
     
     <!-- google에서 제공하는 cdn방식의 jquery -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


    <meta charset="utf-8">
	<title></title>
	<style></style>
	<script>
		$(function(){ //문서 준비 
			alert($('p').html());	//Alert으로 P태그의 html부분을 get 하는 Jquery
		});
	</script>
</head>
<body>	
	<h1>Jquery의 기본 문법</h1>
	<p id="text">새해복 많이 받으세요</p>
</body>
</html>