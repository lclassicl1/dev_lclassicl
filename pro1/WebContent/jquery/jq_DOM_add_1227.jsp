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
			  $("#btn1").click(function(){
			    $("p").append(" <b>★</b>");
			  });
	
			  $("#btn2").click(function(){
			    $("ol").append("<li>Appended item</li>");
			  });
			});
		$(document).ready(function(){
			  $("#btn3").click(function(){
			    $("p").prepend("<b>＠</b>");
			  });
			  $("#btn4").click(function(){
			    $("ol").prepend("<li>Prepended item</li>");
			  });
			});
		
	</script>
</head>
<body>
	<h2>jquert-dom-요소추가</h2>
	<br/>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
		
		<ol>
		  <li>List item 1</li>
		  <li>List item 2</li>
		  <li>List item 3</li>
		</ol>
		
		<button id="btn1">Append text</button>
		<button id="btn2">Append list items</button>	
		<button id="btn3">Prepend text</button>
		<button id="btn4">Prepend list item</button>
	
	<br/>
	<pre>
		append()- 선택한 요소의 끝에 내용 삽입
		prepend()- 선택한 요소의 시작 부분에 콘텐츠 삽입
		after()- 선택한 요소 뒤에 내용 삽입
		before()- 선택한 요소 앞에 콘텐츠 삽입
	</pre>
</body>
</html>