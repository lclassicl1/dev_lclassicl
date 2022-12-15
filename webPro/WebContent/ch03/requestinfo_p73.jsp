<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestinfo</title>
	<style></style>
</head>
<body>
	<h1>request의 종류들을 알아보자.</h1>
	<p>http://localhost:8088/webPro/ch03/requestinfo_p73.jsp</p>
	<hr/>
	<ul>
		<li>RemoteAddr:<%=request.getRemoteAddr()%></li>
		<li>contentlength:<%=request.getContentLength() %></li>
		<li>characterEncoding:<%=request.getCharacterEncoding() %></li>
		<li>contenttype:<%=request.getContentType() %></li>
		<li>protocol:<%=request.getProtocol() %></li>
		<li>method:<%=request.getMethod() %></li>
		<li>requesturi:<%=request.getRequestURI() %></li>
		<li>★★★★★contextpath:<%=request.getContextPath() %></li>
		<li>servername:<%=request.getServerName() %></li>
		<li>serverport:<%=request.getServerPort() %></li>
		<li>requestURL:<%=request.getRequestURL() %></li>
	</ul>
</body>
</html>