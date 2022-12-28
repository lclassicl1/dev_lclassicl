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
		.text {
			color: #000;
		    padding: .5em;
		    border: 1px solid #444;
		    width:1000px;
		    height:300px;
		    text-align: center;
		    line-height: 300px;
		}	
		
		.active { 
			 /* 마우스 빠져나갈떄 */
   			 font-size:30px;
  		}
		.inside {
		 	/* 마우스진입 */
		    background-color: aqua; 
		}
		
		.cli {
			/* 클릭시 */
			color: #900;
		}
	</style>
	<script>
		/* 기본문법 
		$(document).ready(function(){
			
		});*/
		
		/* 기본문법을 이렇게 사용도 가능하다 */
		/* $(function(){
			$('.text').click(function(){
				$(this).addClass('cli');
			});
			
			$('.text').mouseenter(function(){
				$(this).addClass('inside');
			});
			
			$('.text').mouseleave(function(){
				$(this).addClass('active');
			});
			
		}); */
		
		/* 메서드 on을 이용하여 다중 이벤트를 적용 */
		$(function(){
			$('div.text').on({
				click:function(){
					$(this).addClass('cli active');
				}, mouseenter:function(){
					$(this).addClass('inside');	
				}, mouseleave:function(){
					$(this).removeClass('cli active');
				}
			});
		});
		
	</script>
</head>
<body>
	<h1>Jquery event on</h1>
	<hr/>
	<div class="text">마우스 진입, 마우스빠져나갈때, 클릭시</div>
	<hr/>
	<pre>
		$(selector).on(event, childSelector, data, function, map)
		on() 메서드는 선택한요소 및 자식요소에 대해 하나이상의 이벤트 핸들러를 연결한다
		
		on("이벤트명",동작(함수));-1개 적용시		
		
		on({key(여기서 key에 event명):value(동작 수행할 function),{key(여기서 key에 event명):value(동작 수행할 function)}); -다중 적용시
	</pre>
</body>
</html>