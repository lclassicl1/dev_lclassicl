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
				/* json 형태 */
				let emp = '{"name":"peter", "age":40, "isshow": true}';
				/* json의 메서드 */
				/* parse = JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다 */
				let output = JSON.parse(emp);
				
				
				let output1 = '<ul>';
				output1 += '<li>'+output.name+'</li>'
				output1 += '<li>'+output.age+'</li>'
				output1 += '<li>'+output.isshow+'</li>'
				output1 +='</ul>';
				
				/* JSON.stringify(Json 문자열로 변환할 데이터값) */
				/* JavaScript 값이나 객체를 JSON 문자열로 변환합니다. */
				console.log(JSON.stringify(output));
				console.log(JSON.stringify({x:new Number(30), y:new Boolean(false)}));
				console.log(JSON.stringify(new Date(2022,12,25,13,10,25)));
				
				$('#result').html(output1);
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