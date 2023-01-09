<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>
	function movePage() { //5초뒤 main으로 page 이동
		setTimeout('location.href="<%=request.getContextPath()%>/index.jsp"',3000);
	}
</script>
<body>
	<script>
	movePage();
	</script>
	<h2>회원가입에 성공했습니다. 3초뒤 main으로이동됩니다</h2>
	<hr/>
	<h1>님 회원가입 ㅊㅋㅊㅋ</h1>
	<p>joinSuccess.jsp(p601)eeeeeeeeeee</p>
</body>
</html>