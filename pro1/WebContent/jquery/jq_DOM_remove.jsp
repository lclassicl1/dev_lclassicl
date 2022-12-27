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
			  $("#btn5").click(function(){
			    $("#div1").remove();
			  });
			});
		
		$(document).ready(function(){
			  $("#btn6").click(function(){
			    $("#div1").empty();
			    $('#div1').append('<ul id="i1"></ul>')
			  });
			});
		
		
	</script>
</head>
<body>
	<div id="div1" style="height:100px;width:300px;border:1px solid black;background-color:yellow;">

	This is some text in the div.
	<p>This is a paragraph in the div.</p>
	<p>This is another paragraph in the div.</p>
	
	</div>
	<br>
	
	<button id="btn5">Remove div element</button>
	<button id="btn6">empty div element</button>
	<button id="btn7">append div element</button>


	<h2>jquery-dom-삭제</h2>
	<pre>
		remove()- 선택한 요소(및 하위 요소)를 제거합니다. - 선택요소+자손요소 제거
		empty()- 선택한 요소에서 하위 요소를 제거합니다. - 자손요소만 제거
	</pre>
</body>
</html>