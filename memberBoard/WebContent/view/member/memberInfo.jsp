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
			$('#searchok').click(function(){
				let idtxt = $('#searchid').val();
				if(idtxt=="") {
					alert('필수입력값');
				}
				
				let queryS = {id:idtxt};
				$.ajax({
					type:"post", //데이터 전송시 방식정하는 type: get or post
					asyns:"true", //true면 비동기방식
					url:"<%=request.getContextPath()%>/getMemberInfoProc.do", //데이터 전송할 controller 지정, 페이지이동이 아님
					data: queryS, //서버로 전송할 데이터
					success:function(data){  // controller에서 값을 제대로 받아왔다면 호출되는 함수, data에 컨트롤러에서 반환해준 값이 담긴다
						
					},
					error:function(xhr,status,error) {
					},
					complete:function() {
						console.log('끝');					
					}
				});//ajax 끝
			});//searchok 끝
		}); // function 끝
	</script>
</head>
<body>
	<h2>멤버조회</h2>
	<form name='frm1' id='frm1'>
		회원ID검색:<input type='search' name='searchid' id='searchid'/>
		<input type='button' id='searchok' name='searchok' value='검색'/>
	</form>
</body>
</html>