<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp string test</title>
</head>
<body>
	<h1>jps string method list</h1>
	<p>let string = "   제 블로그에 방문해주셔서 감사합니다.   "<br/>
	let string2 = "welcome, yat-ong's blog, thank you visit yat-ong's blog"</p>
	<hr/>
	<p id=test></p>
	<!-- 버튼의 선언방식은 2가지. input type button 으로 선언하거나, <button> 태그로 생성 -->
	<input type="button" value="substr()" onclick="testsubstr()" />
	<button onclick="testsubstring()">substring()</button>
	<button onclick="testslice()">slice()</button>
	<button onclick="testlength()">length</button>
	<button onclick="testreplace()">replace()</button>
	<button onclick="testreplaceAll()">replaceAll()</button>
	<button onclick="testtrim()">trim()</button>
	<button onclick="testcharAt()">charAt()</button>
	<button onclick="testsplit()">split()</button>
	<button onclick="testindexOf()">indexOf()</button>
	
	
	<script>
	
	let string = "   제 블로그에 방문해주셔서 감사합니다.   "
	let string2 = "welcome, yat-ong's blog, thank you visit yat-ong's blog"
	
	function testsubstr() {
		let result = string.substr(3,9);
		document.getElementById("test").innerText = result;
	}
	
	function testsubstring() {
		let result = string.substring(2,5);
		document.getElementById("test").innerText = result;
	}
	
	function testslice() {
		let result = string.slice(1,10);
		document.getElementById("test").innerText = result;
	}
	
	function testlength() {
		let result = string.length;
		document.getElementById("test").innerText = result;
	}
	
	function testreplace() {
		let result = string2.replace("블로그","Blog");
		document.getElementById("test").innerText = result;
	}
	
	function testreplaceAll() {
		let result = string2.replaceAll("blog","블로그");
		document.getElementById("test").innerText = result;
	}
	
	function testtrim() {
		let result = string.trim();
		document.getElementById("test").innerHTML = "string의 길이:"+string.length+"<br/>result의 길이:"+result.length;
	}
	
	function testcharAt(){
		let result = string2.charAt(2);
		document.getElementById("test").innerText = result;
	}
	
	function testsplit(){
		let result = string2.split(",");
		document.getElementById("test").innerText = result[0];
	}
	
	function testindexOf(){
		let result = string2.indexOf("blog");
		if(result != -1){
			alert(result+"번째에서 찾았다");
			document.getElementById("test").innerText = result;
		} else if(result==-1) {
			alert("찾는 문자열이 없습니다.")
		}
	}
	</script>
</body>
</html>