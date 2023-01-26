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
			width: 200px;
			height: 200px;
			border-radius: 25%;
			object-fit: cover;
			box-shadow: 3px 3px 2px gray;
			/* object-fill - 가로세로 비율유지X 지정된 크기로채운다
			cover - 이미지의 가로세로 비율을 유지하면서 가득채울때까지 크기가 확대
			contain - 이미지의 가로세로 비율을 유지하면서 가능한 경우까지 확대 */
			
			}
		
		#profile {
			
		}
	</style>
	<script>
		$(function(){
			$('#button').click(function(){
				
				let jsoninfo = '{"no":7782,"name":"scott","sal":5000,"hiredate":"2020/01/02","pic":"<%=request.getContextPath()%>/image/faker.jpg"}';
				let jsonObj = JSON.parse(jsoninfo);
				
				let output = "<ul>"
				output += '<li><div class="profile"><img src="'+jsonObj.pic+'"/></div></li>'
				output += '<li>번호:'+jsonObj.no+'</li>';
				output += '<li>이름:'+jsonObj.name+'</li>';
				output += '<li>급여:'+jsonObj.sal+'</li>';
				output += '<li>입사일:'+jsonObj.hiredate+'</li>';
				output += '</ul>';
				
				$('#result').html(output);
			});
		});
	</script>
</head>
<body>
	<input type='button' value='click' id='button'/>
	<!-- 결과 출력은 div로 -->
	<div id='result'></div>		
</body>
</html>