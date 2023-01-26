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
  <link rel='stylesheet' href='<%=request.getContextPath()%>/css/table1.css'>
	<title></title>
	<style>
		img {
			width: 30px;
			height: 30px;
		}
	
	</style>
	<script>
		$(function(){
			$('#button').click(function(){
				let jsonStr = '{"emps":[{"empno":7782,"ename":"김희선","sal":5000,"pic":"<%=request.getContextPath()%>/image/cake.jpg"},{"empno":7781,"ename":"차승원","sal":35000,"pic":"<%=request.getContextPath()%>/image/faker.jpg"},{"empno":7780, "ename":"쿠리나","sal":25000,"pic":"<%=request.getContextPath()%>/image/main.png"},{"empno":7712,"ename":"문동은","sal":15000, "pic":"<%=request.getContextPath()%>/image/1.png"}]}';
				let jsonObj = JSON.parse(jsonStr);
				
				
				let output = '<table>';
				output += '<thead><th>번호</th><th>이름</th><th>급여</th><th>이미지</th></thead>';
				output += '<tbody>';
				
				for (let i in jsonObj.emps) {
					output += '<tr>';
					output += '<td>'+jsonObj.emps[i].empno+'</td>';
					output += '<td>'+jsonObj.emps[i].ename+'</td>';
					output += '<td>'+jsonObj.emps[i].sal+'</td>';
					output += '<td><img src="'+jsonObj.emps[i].pic+'"/></td>';
					output += '</tr>';
				}
				output += '</tbody>';
				output += '</table>';
				
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