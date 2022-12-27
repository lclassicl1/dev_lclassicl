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
		.c1:hover{background-color: red;}
	
	</style>
	<script>
	$(document).ready(function(){
		  $("#btn1").click(function(){
		    $("#test1").text("Hello world!");
		  });
		  $("#btn2").click(function(){
		    $("#test2").html("<b>Hello world!</b>");
		  });
		  $("#btn3").click(function(){
		    $("#test3").val("Dolly Duck");
		  });
		});
	
	function setText() {
		document.getElementById('test1').innerText = 'Hello world!';
	}
	
	function sethtml() {
		//tagname으로 현재 p가 다수라서 elemenets로 표현하고 인덱스번호로 구분한다 2번째 p기때문에 [1]인덱스 
		document.getElementsByTagName('p')[1].innerHTML = '<strong>Hello world!</strong>';
	}
	
	function setvalue()	{
		document.getElementsByClassName('c1')[0].value = 'Dolly Duck';
	}
		
	</script>
</head>
<body>
	<p id="test1">이 부분은 문단</p>
	<p id="test2">이것은 <strong><i>또다른</i></strong> 문단</p>
	
	<p>Input field: <input type="text" id="test3" class="c1" value="Mickey Mouse"></p>
	JQuery식<br/>
	<button id="btn1">Set Text</button>
	<button id="btn2">Set HTML</button>
	<button id="btn3">Set Value</button><br/>
	<hr/>
	javascript식<br/>
	<button id="btn4" onclick="setText();">Set Text</button>
	<button id="btn5" onclick="sethtml();">Set HTML</button>
	<button id="btn6" onclick="setvalue();">Set Value</button><br/>
</body>
</html>