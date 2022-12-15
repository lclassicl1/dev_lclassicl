<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestPage</title>
</head>
<body>
	<!-- url의 ?부터 문자열을 쿼리스트링이라고 한다.
	?파라미터명 = 값&파라미터명=값
	파라미터와 value가 한쌍으로움직인다.
	name = "파라미터명" value="값" -->
	<form action="ok.jsp" method="get" target="_blank" name="frm1" id="frm1">
		<ul>
			<li>이름:<input type="text" name="mname" id="mname" placeholder="입력" maxlength="10" autofocus="autofocus" size="10"/></li>
			<li>비번:<input type="password" name="mpwd" id="mpwd" required="required" placeholder="비밀번호"/></li>
			<li>좋아하는동물:<input type="checkbox" name="animals" id="animals1" value="dog">개
				<input type="checkbox" name="animals" id="animals2" value="cat">고양이
				<input type="checkbox" name="animals" id="animals3" value="bat">박쥐
				<input type="checkbox" name="animals" id="animals4" value="giraffe">기린
				<input type="checkbox" name="animals" id="animals5" value="tiger" checked="checked">호랑이</li>
			
		</ul>
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</form>
</body>
</html>