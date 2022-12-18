<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>duci</title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>innerText, innerHTML Test</h1>
	<p id="test">P태그의 Project입니다.</p>
	<script>
		document.getElementById("test").innerText = "<strong><em>P태그는<br/>나가있어</em></strong>";
		
	</script>
</body>
</html>