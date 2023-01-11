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
	<title>게시글 목록</title>
	<style></style>
	<script>
		$(function(){
			
		});
		
		function moveHome() {
			response.sendRedirect(request.getContextPath()+'/index.jsp');
		}
	</script>
</head>
<body>
	<table border="1">
		<thead>
		<tr>
			<td colspan="5"><a href="write.do">게시글쓰러가기</a>&nbsp;<a href="<%=request.getContextPath()%>/index.jsp">Home으로</a></td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody>
			<c:if test=""></c:if>
			<!-- 반복문 이용예정 -->
			<tr>
				<td>번호예정</td>
				<td>제목예정</td>
				<td>작성자예정</td>
				<td>작성일예정</td>
				<td>조회수예정</td>
			</tr>
			<!-- 반복문 이용예정 -->
			<c:if test="#"></c:if>
			<tr>
			<!-- 게시글이 없는 경우 JSTL if문이용-->
			<td colspan="5" style='text-align: center;'>게시글이 없습니다.<td/>
			</tr>
			<!-- paging 처리부분 -->
			<tr>
				<td colspan="5" style='text-align: center;'>1.2.3.4.5.6.6.<td/>
			</tr>
		</tbody>
	</table>
</body>
</html>