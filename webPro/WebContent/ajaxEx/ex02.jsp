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
			$('#button').click(function(){
				let jsonStr = '{"name":["youngjun","jo","kim","hangyeol"]}';
				let jsonObj = JSON.parse(jsonStr);
				let output = '';
				output += '<ul>';
				output += '<li>'+jsonObj.name+'</li>';
				output += '<li>'+jsonObj.name[0]+'</li>';
				output += '<li>'+jsonObj.name[1]+'</li>';
				output += '<li>'+jsonObj.name[2]+'</li>';
				output += '<li>'+jsonObj.name[3]+'</li>';
				output += '<li>'+jsonObj.name.length+'</li>';
				output += '</ul>';
				
				let length = jsonObj.name.length;
				for(let str in jsonObj.name) {
					output += '<br>'+jsonObj.name[str];
				}
				
				//$('#result').html(output);
				
				let jsonStr2 = '{"age":[20,30,40,50]}';
				let jsonObj2 = JSON.parse(jsonStr2);
				
				for(let str2 in jsonObj2.age) {
					console.log(
						jsonObj.name[str2]+':'+jsonObj2.age[str2]);
				}
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