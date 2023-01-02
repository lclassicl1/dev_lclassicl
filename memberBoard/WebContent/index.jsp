<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		http://localhost:8088/memberBoard/index.jsp
		welcome 파일 정상적으로 접속되는지 확인할때는
		memberBoard까지만 입력해보면 알수있다
		
		server의 server.xml에 보면 Context docBase란이 있다. path 부분을 수정하면 기본 컨텍스트패스를 변경할수있다.  
		http://localhost:8088/mBoard/index.jsp
		http://localhost:8088/mBoard
	</pre>
</body>
</html>