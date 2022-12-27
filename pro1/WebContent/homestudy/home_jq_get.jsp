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
	<style></style>
	<script>
		/* Jquery Style */
		$(document).ready(function(){
			$('#btn1').click(function(){
				alert($('#text1').text());
			});
		});
		
		$(document).ready(function(){
			$('#btn2').click(function(){
				alert($('#text2').html());
			});
		});
		
		/* Javascript Style */
		
		function textget(){
			let text1 = document.getElementById('text1').innerText;
			alert(text1);
		}
		
		function htmlget(){
			let text2 = document.getElementById('text2').innerHTML;
			alert(text2);
		}
	</script>
</head>
<body>
	<h1>Jquery와 Javascript</h1>
	<p id="text1">중요한건 꺾이지않는 마음</p>
	<p id="text2">By <strong>deft</strong></p>
	<hr/>
	<em>Jquery Style</em><br/>
	<button type="button" id="btn1">Gettext</button>
	<button type="button" id="btn2">Gethtml</button>
	<hr/>
	<em>Javascript Style</em><br/>
	<button type="button" id="btn3" onclick="textget();">Gettext</button>
	<button type="button" id="btn4" onclick="htmlget();">Gethtml</button>
	
</body>
</html>