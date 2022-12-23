<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script>
		function changeURL() {
			/* let link = location.href='http://www.naver.com';
			window.open(link); */
			let a = document.getElementById('i1');
			a.href='http://www.nate.com';
			a.target = '_blank';
			a.innerHTML = 'nate로이동';
		}
		
	</script>
</head>
<body>
	<h1>Location 객체</h1>
	<pre>
		원래 window객체의 location속성이지만 = 예)window.location
		Location객체로 분리해서 사용 가능하다
		-location객체는 현재 URL에 대한 정보를 포함하고있다.
		
		location.href=url : 지정주소로 이동
		location.reload() : 새로고침
		location.replace(url) : 지정주소로 이동. (이전페이지로 이동불가) 아마 새로운요청으로 인식하는듯?
		location.reassign(url) : 지정주소로 이동 (이전페이지로 이동 가능) 기존정보를 가지고 page 이동되는듯
	</pre>
	<hr/>
	<script>
		document.write('<pre>');
		document.writeln('현재url=>프로토콜://ip주소:포트번호/Contextpath/파일명');
		document.writeln('현재url=>http://localhost:8088/pro1/j_location_1223.jsp');
		document.writeln('현재url(location.href이용)=>'+location.href);
		/* location.href="http://www.google.com"; //해당 url로 바로 이동됨 */
		document.writeln('</pre>');
	</script>
	
	<%	/* 자바스크립트코드 request객체 이용하여 url 출력*/
		StringBuffer buff = request.getRequestURL();
		out.println("현재URL:"+buff);
	%><br/>
	<ul>
	<li>location 객체의 이용:<button type="button" onclick="location.reload();">location.reload()</button></li> <!--현재 Page reload 새로고침 -->
	<li>location replace()이용:<button type="button" onclick="location.replace('https://yat-ong.tistory.com/');">location.replace()</button></li> <!--현재 Page reload 새로고침 -->
	<li>location assign이용:<button type="button" onclick="location.assign('https://yat-ong.tistory.com/');">location.assign()</button></li>
	<li>js이용:<button type="button" onclick="javascript:location.href='https://yat-ong.tistory.com/'">블로그</button></li>
	<li>js이용:<button type="button" onclick="changeURL()">네이버1</button></li>
	<li>a태그 이용:<a href="http://www.naver.com" target="_self" id="i1">네이버이동</a></li>
	<li><button type="button" onclick="changeURL()">a태그를 네이트로 변경</button></li>
	</ul>
	
	<hr/>
	<h2>History 객체</h2>
	<hr/>
	<span onclick="history.back();" style="background-color: pink;">history.back()</span>
	<span onclick="history.forward();" style="background-color: sky;">history.forward()</span>
	<span onclick="history.go(1);" style="background-color: red;">history.go(1)</span>
	<span onclick="history.length();" style="background-color: red;">history.length()</span>
</body>
</html>