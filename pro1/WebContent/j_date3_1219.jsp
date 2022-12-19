<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>실행 시걸리는 시간?</h1>
		<hr/>
			<script>
				document.write('<pre>');
				let startTime = Date.now(); //now는 1970년 1월1일 자정부터 지금까지의 밀리세컨드를 출력
				document.writeln('시작시간='+startTime+'/ms'); //밀리세컨드로 출력
				
				for(let i=0; i<10000000000; i++) {
									
				}
				
				let endTime = Date.now();
				document.writeln('끝나는시간='+endTime+'/ms'); //끝나는시간
				
				let toDoTime = endTime - startTime;
				document.writeln('경과시간='+toDoTime+'/ms');
				document.writeln('경과시간='+Math.floor(toDoTime/1000)+'/sec');
				/* 경과시간은 지나간 시간을 의미하므로 올림이나 반올림이 아닌 내림처리 해야한다 */
				document.writeln();
				
				document.write('</pre>');
			</script>

</body>
</html>