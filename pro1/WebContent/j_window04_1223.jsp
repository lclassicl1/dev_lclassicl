<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script>
		const myInterval = setInterval(myTimer, 1000);
		
		function myTimer() {
		  const date = new Date();
		  document.getElementById("demo").innerHTML = date.toLocaleTimeString();
		}
		
		function myStopFunction() {
		  clearInterval(myInterval);
		}
		
		function startTime() {
			  const date1 = new Date();
			  document.getElementById("demo1").innerHTML = date1.toLocaleTimeString();
			  setTimeout(function() {startTime()}, 1000);
		}
	</script>
</head>
<body onload="startTime()">
	<h1>setInteval()</h1>
	<h2><p>setInterval(function, milliseconds):일정시간을 간격으로 특정함수를 호출<br/>
		파라미터 funtion은 호출하고자하는 함수명, 함수명뒤에 ()를 사용하지 않는다.<br/></p>
		<p>-파라미터 milliseconds는 밀리세컨드 단위. 일정시간을 간격
			clearInterval - setInterval()로 설정한 Timer를 clear함(재시작X, 종료의 의미)</p></h2>
		
		<!-- demo는 interval 시간이 출력되는영역 --> 
		<p id="demo"></p>
			<button onclick="myStopFunction()">Stop time</button>
		<hr/>
		
	<h2>The setTimeout() Method</h2>
	<p id="demo1">1초뒤 시간보임</p>
	
	
	
</body>
</html>