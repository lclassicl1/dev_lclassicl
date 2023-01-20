<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<!-- google cdn 방식 jquery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta name="description" content="memberboard web app">
  <meta name="keywords" content="article, javascript, board, webProject">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 조회</title>
	<style></style>
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
	DB내용:${articleData}
	요청페이지:${strPageno}
	1페이지당 게시글수:${rowSize}
	<h1>게시글 조회 Page</h1>
	<h2><a href="<%=request.getContextPath()%>/index.jsp">HOME으로</a></h2>
	<table border='1'>
		<tr>
			<th>번호</th>
			<td>${articleData.article.article_no}</td>
		</tr>
		<tr>
			<th>작성자명</th>
			<td>${articleData.article.writer.name}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${articleData.article.title}</td>
		</tr>
		<tr>
			<th>작성시간</th>
			<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${articleData.article.regdate}"></fmt:formatDate></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><u:pre value="${articleData.articleContent}"/></td>
		</tr>
		<tr>
			<td colspan='2' style='text-align: center;'>
			
			<c:set var='pageNo' value='${empty param.pageNo?"1": param.pageNo}'></c:set>
			<a href='/article/list.do?PageNo=${pageNo}&rowSize=${rowSize}'>목록보기</a> <!-- pageNo는 요청페이지 rowsize는 보여줄 게시글 갯수 -->
			<!-- 수정과 삭제는 로그인한아이디와 작성자의 아이디가 일치해야만 나타나게 처리 -->
			<c:if test="${authUser.memberid==articleData.article.writer.id}">
			<a href='/article/modify.do?no=${articleData.article.article_no}&PageNo=${pageNo}&rowSize=${rowSize}'>수정</a>
			<a href='/article/deleteArticle.do?no=${articleData.article.article_no}'>글삭제(delete용)</a>
			<a href='/article/deleteArticle2.do?no=${articleData.article.article_no}'>글삭제(update용)</a>
			</c:if>
			</td>
		</tr>
	</table>
</body>
</html>