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
			let result = ${result};
			
			if(result == 0) {
				alert('삭제에 실패했습니다');
			} else if(result != 0) {
				alert('${result}개가 삭제되었습니다');
				location.href='/article/list.do';
			}
			
		});
	</script>
</head>
<body>
	<!-- DeleteHandler에서 넘어온 모델값 -->
	넘어오는값:${result}
</body>
</html>