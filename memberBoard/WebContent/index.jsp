<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome file index.jsp</title>
</head>
<body>
	<h1>index</h1>
	<pre>
		
	
	
		프로토콜://ip주소:포트번호/컨텍스트패스/파일명
		http://localhost:8088/mBoard/index.jsp
		welcome 파일 정상적으로 접속되는지 확인할때는
		mBoard까지만 입력해보면 알수있다
		
		server의 server.xml에 보면 Context docBase란이 있다. path 부분을 수정하면 기본 컨텍스트패스를 변경할수있다.  
		http://localhost:8088/mBoard/index.jsp
		http://localhost:8088/mBoard
	</pre>
	<ul>
		<li><a href="<%=request.getContextPath()%>/registerForm.do">MY회원가입(폼)</a></li>
		<li><a href="<%=request.getContextPath()%>/join.do">Join회원가입(폼)</a></li>
		<li><a href="<%=request.getContextPath()%>/login.do">로그인</a></li>
		<li><a href="<%=request.getContextPath()%>/article/list.do">목록보기</a>
		<li><a href='<%=request.getContextPath()%>/article/write.do'>글쓰기</a></li>
		<li><a href='<%=request.getContextPath()%>/getMemberInfoProc.do'>회원관리(특정회원조회)</a>
		
	</ul>
</body>
</html>