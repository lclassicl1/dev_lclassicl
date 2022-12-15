<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>자바스크립트 output test</title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>output</h1>
		<pre>
			window.alert() - 알람? 팝업창?기능
			innerText = 해당요소의 글자를 가져오거나, 대입한다 HTML 태그도 글자취급 
			innerHTML = 해당요소 내부의 글자와 HTML태그를 가져오거나 적용 가능하다.
			console.log() = 콘솔에 로그를 남긴다
			document.write(); = html document에 출력
		</pre>
	<hr/>
	<p id="demo"></p>
		<script>
		console.log("콘솔에 출력되는 기능");
	 	document.getElementById("demo").innerText = "중요한건 꺾이지않는 마음"; //innertext는 text 글자 삽입
	 	alert(document.getElementById("demo").innerText); //window.alert()
	 	document.getElementById("demo").innerHTML = "<em>by deft</em>";
	 	/* innertext와 innerHTML의 차이점은 기능은 비슷하나 innerText는 오로지 문자열, innerHTML은 태그도 적용 가능 */
	 	document.write("document객체의.write()로 출력<br>");
	 	document.write("두번째로 출력");
		</script>
		

</body>
</html>