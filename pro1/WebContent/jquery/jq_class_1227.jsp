<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <!-- cdn 방식으로 jquery 연동 -->
        <!-- <script src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
       	<!-- download방식으로 jquery 연동 -->
  	<script src="../js/jquery-3.6.3.js"></script>
    <meta charset="utf-8">
	<title></title>
	<style>
		span {
			display: inline-block;
			width: 50px;
			height: 30px;
			padding: 10px;
			text-align: center;
			font-weight: bold;
		}
		
		.reverse {
			color:white;
			background: black;
		}
		.highlight {
			color:black;
			background: white;
		}
		
	</style>
	<script>
		$(document).ready(function(){
			$('#btn1').click(function(){
				$('span').addClass('reverse');
			});
		});
		
		$(document).ready(function(){
			$('#btn2').click(function(){
				$('span').removeClass('reverse');
			})
		});
		
		$(document).ready(function(){
			//this : 이벤트가 일어난 요소 -> click 이벤트가 발생한 span요소
			//아래코드는 click한 span요소에 reverse 클래스가 추가, 삭제가 번갈아가면서 적용
			$('span').click(function(){
				$(this).toggleClass('reverse');
			})
		});
	
	</script>
</head>
<body>
	<span>메뉴1</span><span>메뉴2</span><span>메뉴3</span><span>메뉴4</span>
	<hr/>
	<button id="btn1">addclass()</button>
	<button id="btn2">removeClass()</button>
	<button id="btn3">toggleClass()</button>
	<button id="btn4">미구현</button>
	<hr/>
	<h1>jquery -클래스 조작</h1>
	<pre>
		addClass()- 선택한 요소에 하나 이상의 클래스를 추가합니다.
		removeClass()- 선택한 요소에서 하나 이상의 클래스를 제거합니다.
		toggleClass()- 선택한 요소에서 클래스 추가/제거 간을 전환합니다.
		css()- 스타일 속성을 설정하거나 반환합니다.
	</pre>
</body>
</html>