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
		#panel, #flip {
		  padding: 5px;
		  text-align: center;
		  background-color: #e5eecc;
		  border: solid 1px #c3c3c3;
		}
		
		#panel {
		  padding: 50px;
		  display: none;
		}
	</style>
	<script>
		//함수선언
		function f1(){
			 alert('callback함수!!!');
		};
	
		$(document).ready(function(){
		  $("#hide").click(function(){
			    $("p").hide('slow',f1);
		  });
		  $("#show").click(function(){
			    $("p").show('fast',f1);
		  });
		});
		
		$(document).ready(function(){ //toggle
			$('#toggle').click(function(){
				$('p').toggle(100,f1)	
			});
		});
		
		$(document).ready(function(){ //fadetoggle
			  $("#fadetoggle").click(function(){
			    $("#div1").fadeToggle();
			    $("#div2").fadeToggle("slow");
			    $("#div3").fadeToggle(3000);
			  });
			});
		
		$(document).ready(function(){ //slidetoggle
			  $("#flip").click(function(){
			    $("#panel").slideToggle("slow"); 
			  });
			});
	</script>
</head>
<body>
	<h1>jquery effects</h1>
	<p>If you click on the "Hide" button, I will disappear.<br/>
		hide와 show 사이의 () 괄호에 slow와 fast로 속도 조절 가능하다<br/>
		callback을 뒤에 지정할수있다, callback에 함수를 지정할수도있는데 그때는 ()를 호출하지않는다</p>

	<button id="hide">Hide</button>
	<button id="show">Show</button>
	<button id="toggle">toggle</button>
	<hr/>
	
	<p>Demonstrate fadeToggle() with different speed parameters.</p>
	<button id="fadetoggle">Click to fade in/out boxes</button><br><br>
	
	<div id="div1" style="width:80px;height:80px;background-color:red;"></div>
	<br>
	<div id="div2" style="width:80px;height:80px;background-color:green;"></div>
	<br>
	<div id="div3" style="width:80px;height:80px;background-color:blue;"></div>
	
	<hr/>
	
	
	
	<div id="flip">Click to slide the panel down or up</div>
	<div id="panel">Hello world!</div>	
	
	<pre>
		$(selector).hide(speed,callback);
			=>speed는 'slow'와 'fast'같은 문자열, ms(milliseconds)숫자도 가능
			=>callback은 hide된 후에 호출되는 callback 함수, callback 함수는 생략가능
		$(selector).show(speed,callback);	
		
		$(selector).toggle(speed,callback);
			=>hide와 show가 번갈아 실행됨
	</pre>
</body>
</html>