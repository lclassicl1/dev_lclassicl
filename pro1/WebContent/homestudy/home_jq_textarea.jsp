<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        
  	<!-- google cdn 방식 -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 

  	

    <meta charset="utf-8">
	<title></title>
	<style></style>
	<script>
		/* jquery */
		
		//textarea 요소에 접근하여 기본값을 가져오기
		$(function(){
			//test용도인 alert, val은 id가 text1인 요소에 접근해 그 요소의 값을 가져온다
			//alert($('#text1').val());
			
			
			$('#text1').keyup(function(){ //id가 text1인 Textarea의 keyup 이벤트
				let text = $(this).val(); //this는 이벤트가 발생하는, 즉 textarea를 의미한다. textarea의 값을 text 변수에 대입
				let textleng = text.length; //text 변수의 글자수를 반환
				
				if(textleng <= 200 || textleng=="") { // this.val의 글자수가 200 이하이고 공백이라면의 조건
					$('#cnt').html(textleng); //true가 발생하면 글자수를 span tag 구역에 출력시켜준다. 
				} else {
					alert('200글자를 초과하였다.'); //false면 경고창이 뜨면서
					$('#text1').val(text.slice(0,200)); //200글자를 초과했다는 말이 되니 text의 글자를 0번인덱스부터 200번째까지 잘라서 다시 textarea에 대입해준다.
				}
				
			});
		});
	</script>
</head>
<body>
	<h1>이곳은 Textarea 입니다</h1>
	<span id="cnt"></span>/
	<span id="maxcnt">200자</span><br/>
	<textarea rows="10" cols="100" name="text1" id="text1"></textarea>
</body>
</html>