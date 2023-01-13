<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<style>
		td {
			text-align: center;
		}
	</style>
	<script>
		$(function(){
		
		$('#rowSize').change(function(){
			//let num = $('select[id=rowSize] option:selected').val();
			$('#rowSizeFRM').submit();
		});
	});	
	</script>
</head>
<body>
	<!-- controller에 의해서 ArrayList 타입의  articlePage를 세션에 저장되어 받음
		  articlePage에는 Article의 정보가 담겨있다.-->
		  
	<table border="1">
		<thead>
		<tr>
			<td colspan="6"><a href="write.do">게시글쓰러가기</a>&nbsp;<a href="<%=request.getContextPath()%>/index.jsp">Home으로</a>
				<p>
				<form action="/article/list.do" name="rowSizeFRM" id="rowSizeFRM" method="get">
				<select name="rowSize" id="rowSize">
							<option value="3">3</option>
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="30">30</option>
				</select>
				</form>
				</p>
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>마지막수정시간</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody>
			<%-- <c:if test="${articlePage.hasNoArticles()}">
				<tr>
					<td colspan='5' style='text-align: center;'>게시글이 없습니다.</td>
				</tr>
			</c:if> --%>
			<!-- 반복문 이용예정 -->
			<c:forEach var='article' items='${articlePage}'>
			<tr>
				<td>${article.article_no }</td>
				<td><a href="#">${article.title }</a></td>
				<!-- 표면적으로필드명을 호출한거 같지만 get메소드를 호출하는것이며 get이 생략되고 앞의 대문자들을 소문자 처리해준다 -->
				<td>${article.writer.name}</td>
				<td>
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${article.regdate}"></fmt:formatDate></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${article.moddate}"></fmt:formatDate></td>
				<td>${article.read_cnt }</td>
			</tr>
			</c:forEach>
			
			<!-- paging 처리부분 -->
			<tr>
				<td colspan="6" style='text-align: center;'><a href="#">prev</a>1.2.3.4.5.6.6.<a href="#">next</a><td/>
			</tr>
		</tbody>
	</table>
</body>
</html>