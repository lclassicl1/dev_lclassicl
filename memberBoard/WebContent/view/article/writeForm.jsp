<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  	<!-- google cdn 방식 jquery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta name="description" content="memberboard web app">
  <meta name="keywords" content="article, javascript, board, webProject">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 수정</title>
	<style>
		.error {
			color:red;
			font-size:0.8em;
		}
	</style>
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
	<!-- 넘어온객체이름 "modReq"안에는 로그인한 userid, 글번호, db에 저장되어있는 제목과 내용이 담겨있다 -->
	process폼에서 받은내용:${authUser}
	에러정보:${errors}
	rowSize:${rSize}
	<%-- 요청페이지:${strPageno}
	1페이지당 게시글수:${rowSize} --%>
	<h1>게시글 작성 Page</h1>
	<h2><a href="<%=request.getContextPath()%>/index.jsp">HOME으로</a></h2>
		<form name='modifyFRM' id='modifyFRM' action='/article/write.do?rowSize=${rSize}' method='post'>
				<%-- <input type='hidden' name='no' id='no' value='${modReq.articleNumber}'/> <!-- 히든속성 parameter를 넘기기위한 hidden 폼태그 안에만 있으면된다 --> --%>
		<table border='1'>
		
		<tr>
			<th>작성자명</th>
			<td>${authUser.membername}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type='text' name='title' id='title' placeholder="제목을입력해주세요"/>
				<span class='error'><c:if test='${errors.title}'>제목을 입력하시죠?</c:if></span>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="30" cols="100" name='content' id='content' placeholder="내용을 입력해주세요"><c:if test='${errors.content}'>내용 필수입력 하시죠?</c:if></textarea>
			</td>
		</tr>
		<tr>
			<td colspan='2' style='text-align: center;'>
				<input type='submit' value='작성'/>
			</td>
		</tr>
		<tr>
			<td colspan='2' style='text-align: center;'>
			<c:set var='pageNo' value="${empty param.pageNo ? '1':param.pageNo}"></c:set>
			<a href='/article/list.do?PageNo=페이지넘버&rowSize=rowsize'>목록보기</a> <!-- pageNo는 요청페이지 rowsize는 보여줄 게시글 갯수 -->
			<a href='/article/read.do?no=글번호&pageNo=페이지넘버&rowSize=페이지당글갯수'>글 상세보기</a>
			<a href='/article/deleteArticle.do?no=글번호'>글삭제(delete용)</a>
			<a href='/article/deleteArticle.do?no=글번호'>글삭제(update용)</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>