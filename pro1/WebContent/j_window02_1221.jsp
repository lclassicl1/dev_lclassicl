<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>window object</title>
	<style></style>
	<script>
		let newWindow;
		
		function openWin() {
			//window.open(url, 창이름);
			newWindow = window.open('j_String.jsp','nw','width=50','height=50'); //새 지정한 사이트가 있는 window 객체가 생성
		}
		
		function resizeWin(){
			newWindow.resizeTo(60,60);
		}
		
		function bysizeWin() {
			newWindow.resizeBy(60,60);
		}
		
		function movesizeTo() { //가장 기본 좌표 x,y 왼쪽 상단
			newWindow.moveTo(0,0);
		}
		
		//매개변수에는 숫자 문자 객체 다 가능하다
		//button에 id값을 입력해주고 이때 매개변수 this를 호출하면 sir에는 HTMLButtonElement 객체 가 대입된다.
		function movesize(sir) {
			switch(sir.id) {
				case 'up':newWindow.moveBy(0,-100); break;
				case 'down':newWindow.moveBy(0,100); break;
				case 'right':newWindow.moveBy(100,0); break;
				case 'left':newWindow.moveBy(-100,0); break;
			}
		}
		
		/* function movesizeBydown() { //아래
			
		}
		function movesizeByup() { //위
		}
		function movesizeByright() { //오른쪽 
		}
		function movesizeByleft() { //왼쪽
		} */
	</script>
</head>
<body>
	<h1>window object</h1>
		<button type="button" onmouseover="resizeWin();">window.resizeTo()</button>
		<button type="button" onmouseover="bysizeWin();">window.resizeBy()</button>
		<button type="button" onclick="openWin();">openWin();</button>
		<hr/>
		<button type="button" onmouseover="movesizeTo();">moveTo();</button>
		<button type="button" onmouseover="movesize(this);" id="up">위</button>
		<button type="button" onmouseover="movesize(this);" id="down">아래</button>
		<button type="button" onmouseover="movesize(this);" id="right">오른</button>
		<button type="button" onmouseover="movesize(this);" id="left">왼</button>
	<hr/>
	<pre>
		resizeTo(가로크기, 세로크기); - 절대값, 고정값으로 창사이즈를 변경해준다
		resizeBy(가로크기, 세로크기); - 가변값, 기존값에 누적해서 창사이즈를 점진적으로 변경해준다
	</pre>
	
	
</body>
</html>