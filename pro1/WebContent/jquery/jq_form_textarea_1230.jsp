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
		$(function(){
			/* textarea에 글자가 입력되면
			입력된 글자수는 id=cnt 요소에 출력
			입력된 글자수가 최대 200 넘으면 경고메세지 출력
			넘어가는 글자는 삭제? */
					
			//keyup 키보드 떼는순간
			$('#textarea1').keyup(function(){
				let cntleng = $(this).val(); //입력된 글자수
				
				//$('#cnt').html(cntleng.length+'자'); //입력된 글자수를 length로 구해와 span id=cnt란에 출력
				
				if(cntleng ===0 || cntleng.length =="") {
					$('#cnt').html(0+"자");	
				} else {
					$('#cnt').html(cntleng.length+'자');	
				}
				
				if(cntleng.length > 10) {
					alert('200글자 초과입니다');
					$(this).val($(this).val().slice(0,10));
				} 
			});
		});
		
	</script>
</head>
<body>
	<h1>text area</h1>
	<div>최대 200글자 이내로 작성하세요</div>
	<div>
		<span id="cnt">0자</span>/
		<span id="maxcnt">200자</span>
	</div>
	<form name="frm1" id="frm1">
		<textarea rows="5" cols="30" name="textarea1" id="textarea1"></textarea>
	</form>
</body>
</html>