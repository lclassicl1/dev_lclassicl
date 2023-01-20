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
	<h1>입력 성공시 보이는 화면입니다</h1>
	<!-- 세션정보 newArticleNo -->
	newArticleNo정보:${newArticleNo}
	rowSize=${rSize}
	<a href="<%=request.getContextPath()%>/index.jsp">Home으로</a>
	<a href='/article/list.do?&PageNo=1&rowSize=${rSize}'>목록보기</a>
	<%-- <a href='/article/modify.do?no=${articleData.article.article_no}&PageNo=${pageNo}&rowSize=${rowSize}'>수정</a>
	<a href='/article/deleteArticle.do?no=${articleData.article.article_no}'>글삭제(delete용)</a>
	<a href='/article/read.do?no=${newArticleNo}&pageNo=${}&rowSize=${}'>상세보기</a> --%>
	<hr/>
</body>
</html>