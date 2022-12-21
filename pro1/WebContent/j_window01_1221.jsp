<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>window?</title>
	<style></style>
	<script>
		//confirm
		function f_confirm() {
			//확인을 선택하면 true를 리턴 취소를 누르면 false 리턴
			let result = confirm('민짜니?');
			document.getElementById('result').innerHTML = '<br/>'+result;
		}
		
		//prompt
		function f_prompt() {
			//promt('출력할 메세지','초기값'); 으로 설정 가능
			//내용을 입력하면 입력 내용을 리턴
			let age = prompt('나이를 숫자로 입력해주세요','나이입력');
			//parseInt(String) : 문자열을 number타입으로 변환
			//parseFloat(String) : 문자열을 실수 Number 타입으로 변환
			age += '<br/>만나이:'+(parseInt(age)-1);
			document.getElementById('result').innerHTML='입력한 나이 :'+age;
			
			
			
		}
	</script>
</head>
<body>
	<h2>window 객체</h2>
	<hr/>
		<div id="result"></div>
			<button type="button" onclick="alert('에러가 싫어요');">alert()</button>
			<button type="button" onclick="f_confirm();">confirm()</button>
			<button type="button" onclick="f_prompt();">prompt()</button>
	<pre>
		window 객체는 BOM(browser object model)에서 가장 최상위 객체
		window.하위객체
		하위객체 예) window.location
				  window.history
				  window.document
				  window.document.forms
				  window.document.forms[]
	</pre>
	<hr/>
</body>
</html>