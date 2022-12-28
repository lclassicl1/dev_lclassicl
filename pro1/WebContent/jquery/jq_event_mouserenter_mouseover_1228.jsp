<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <!-- cdn 방식으로 jquery 연동 -->
        <!-- <script src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
       	<!-- download방식으로 jquery 연동 -->
  		<!-- <script src="./js/jquery-3.6.3.js"></script> -->
  		<!-- google cdn 방식 -->
  		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->

  	<script src="../js/jquery-3.6.3.js"></script>

    <meta charset="utf-8">
	<title></title>
	<style>
		body {
		  width: 500px;
		  margin: 30px auto;
		}
		.outer {
		  width: 200px;
		  height: 200px;
		  background: Orange;
		  padding: 50px;
		  margin: 10px;
		}
		.inner {
		  width: 100%;
		  height: 100%;
		  background: Pink;
		}
	</style>
	<script>
		$(function(){
			$('.outer')
			.mouseover(function(){ /* 자식에게 전파됨 */
				$('body').append('<p>마우스오버가 발생</p>')
			})
			.mouseenter(function(){ /* 자식에게 전파되지않음 */
				$('body').append('<p>마우스엔터</p>');
			});
		});
	</script>
</head>
<body>
	<div class="outer">
		<div class="inner"></div>
	</div>
	<pre>
		mouse를 orange영역(outer영역(부모영역))에 마우스를 올리면
		mouseover와 mouseenter가 둘다 발생됨
		mouseover 이벤트는 이벤트 버블링이 적용되는 이벤트이므로
		내부요소(자식요소, inner요소)에 진입해도 over가발생함
		
		mouseenter는 버블링이 적용되지않아 내부요소에 진입해도 enter는 발생하지않는다.
		
	</pre>
</body>
</html>