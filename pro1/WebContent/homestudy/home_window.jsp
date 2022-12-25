<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script>
	
		function t_alert(){ //window.alert()을 호출하는 함수
			window.alert('alert테스트');
		}	
		function t_prompt() { //입력값을 받는 prompt를 호출하는 함수
			let text = "";
			let age = window.prompt('당신의 나이를 입력해주세요');
			text = "사용자가 입력한 나이:"+age;
			text += "<br/>만나이:"+(parseInt(age)-1); //JSP는 기본적으로 리턴받는 타입이 문자열이다. 문자열을 숫자타입으로 변환해주는 parseInt 메서드
			document.getElementById('textline').innerHTML = text; //p태그에 아이디를 부여하고 해당 아이디 구간에 HTML형식을 대입
		}
		function t_confirm(){ //예 아니요 를 묻는 confirm를 호출하는 함수
			let result = window.confirm('당신은 성인입니까?');
			document.getElementById('textline').innerHTML = result;
		}
	
		
	</script>
</head>
<body>
	<h1>Alert, Prompt, Confirm</h1>
	<hr/>
	<p id="textline">
	<hr/>
	<button type="button" onclick="t_alert();">Alert</button>
	<button type="button" onclick="t_prompt();">Prompt</button>
	<button type="button" onclick="t_confirm();">Confirm</button>
</body>
</html>