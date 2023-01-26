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
				
				let idv = $('#id').val();
				if(idv == "") {
					alert('id필수입력');
					$('#id').focus();
					return false;
				} 
				
				/* ajax */
				/* 핵심메소드 */
				/* $.ajax({
					type:"get" or "post", 요청 방식을 정해주는 type 속성
					async:"true" or "false", 
					timeout:, 요청제한시간 설정
					data:{키:값}, //서버로 전송할 data
					url:"요청url", 이동할 url 주소? 예)board/article.do
					data:, 서버로 전송할 데이터 예){"name":"블라블라블라"}
					contentType:값, 서버로 전송할 데이터의 contenttype
					dataType:값, 서버로부터 응답받을 데이터타입 예)text, json, html, xml
					success:function(data,status, xhr){}, 정상 응답후 호출되는 함수
									data: 서버로부터 응답받은내용
									status:응답코드
									xhr: xhr 헤더
					error:function(xhr, status, error){} 오류발생시 호출되는 함수
					complete:function(){} 작업완료후 호출되는 함수
				});  */
				
				$.ajax({
					type:"GET",
					async:"true",
					url:"<%=request.getContextPath()%>/ex05.do",
					data:{name:"손오공", id:idv},
					success:function(data){
						//매개변수 data에는 서버에서 보내는 내용이 담겨온다 <strong>이름은:</strong>"+name
						alert('success');
						$('#result').html(data);
					},
					error:function(){
						alert('오류발생');
					},
					complete:function()	{
						console.log('작업 다 마쳤을때 호출되는 콜백함수');						
					}
				});
			});
		});
	</script>
</head>
<body>
	<form name='frm' id='frm'>
	id:<input type='text' name='id' id='id' />
	<input type='button' value='클릭' id='button'/>
	</form>
	<div id='result'></div>
</body>
</html>