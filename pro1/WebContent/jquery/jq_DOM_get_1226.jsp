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
	
		//jquery style
		 $(document).ready(function(){
			$('#btn1').click(function(){
				alert('text:'+$('#test').text());
			});
		});
		
		$(document).ready(function(){
			$('#btn2').click(function(){
				alert('html'+$('#test').html());
			});
		});
		
		
		//javascript style
		function text(){
			let text = document.getElementById('test').innerText;
			alert(text);
		}
		
		function html(){
			let html = document.getElementById('test').innerHTML; 
			alert(html);
		}
		
		function showvalue(){
			let val = document.getElementById('user_name');
			
			alert('user_name.value:'+val.value);
			
		}
		
		$(document).ready(function(){
			$('#btn6').click(function(){
				alert('user_name.value:'+$('#user_name').val());
			});
		});
		
		
	</script>
</head>
<body>
	<form name="frm1" id="frm1">
		이름:<input type="text" id="user_name" name="user_name" value="룰루랄라"/>
	</form>
	<p id="test">Jquery와 javascript 스타일의 <b>굵게해준</b> text와 html을 찾으려고 합니다</p>

	<button id="btn1">jquery style:Show Text</button>
	<button id="btn2">jquery stlye:Show HTML</button>
	<button id="btn3" onclick="text();">jsp style:Show text</button>
	<button id="btn4" onclick="html();">jsp style:Show HTML</button>
	<button id="btn5" onclick="showvalue();">jsp:show value</button>
	<button id="btn6">jquery:show value</button>
	<hr/>
	
	
	<h1>jquert-dom-get</h1>
	<pre>
		text() - 선택한 요소의 텍스트내용을 설정하거나 반환
		html() - 선택한 요소의 내용을 설정하거나 반환 (html 마크업 포함)
		★★★★★val() - 양식 필드의 값을 설정하거나 반환
		$(selector).val() => 값 가져오기
		$(selector).val(value) => 값 설정하기
		$(selector).val(function(index, currentvalue)) =>함수를 사용하여 값 속성을 설정하기
	</pre>
</body>
</html>