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
	<style></style>
	<script>
		$(document).ready(function(){
			$('#btn1').click(function(){
				alert($('#img1').attr('src'));
			});
		});
		
		$(document).ready(function(){
			$('#btn2').click(function(){
				$('#img1').attr('width',800);
			});
		});
		
		$(document).ready(function(){
			$('#btn3').click(function(){
				$('#img1').attr({'width':150, 'height':100, 'src':'../images/jquery.png'});
				$('#a1').attr({'href':'http://www.jquery.com','title':'제이쿼리','target':'_blank'});
			});
		});
		
		
		
		
		function getSrc() {
			alert(document.getElementById('img1').getAttribute('src'));
		}
		
		function setSrc() {
			document.getElementById('img1').setAttribute('width',100);
		}
		
		function setEx() {
			let img1 = document.getElementById('img1');
			let a1 = document.getElementById('a1');
			
			img1.setAttribute('src','../images/jquery.png');
			a1.setAttribute('title','제이쿼리');
			a1.setAttribute('href','http://www.jquery.com');
			a1.setAttribute('target','_blank');
		}
		
	</script>
</head>
<body>
	<a href="http://www.google.com" title="구글" target="_self" id="a1"><img src="../images/google.png" id="img1"></a><br/>
	Jquery Style<br/>
	<p id="text"></p>
	<button type="button" id="btn1">이미지src 가져오기</button>
	<button type="button" id="btn2">이미지너비변경</button>
	<button type="button" id="btn3">이미지여러속성변경</button>
	<hr/>
	javascript stype<br/>
	<button type="button" id="btn4" onclick="getSrc();">이미지src 가져오기</button>
	<button type="button" id="btn5" onclick="setSrc();">이미지너비변경</button>
	<button type="button" id="btn6" onclick="setEx();">이미지여러속성변경</button>
	
	
	
	
	
	<hr/>
	<h1>jquery-DOM-attr</h1>
	<pre>
		$(selector).attr(attribute)-속성 값을 반환합니다.
		
		$(selector).attr(attribute,value)-속성 및 값을 설정합니다.
		
		$(selector).attr(attribute,function(index,currentvalue))-함수를 사용하여 속성과 값을 설정합니다.
		
		$(selector).attr({attribute:value, attribute:value,...})-{}를 사용하여 여러 속성 및 값 설정:
	</pre>

</body>
</html>