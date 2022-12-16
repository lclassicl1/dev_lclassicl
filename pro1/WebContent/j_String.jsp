<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>javascript의 String</h1>
	<p>let text = "Apple, Banana, Kiwi"<br/>
		let text1 = "Please visit Microsoft and Microsoft!"</p>
	<hr/>
		<p id="demo"></p>
		<input type="button" name="slice" value="slice" onclick="fslice();">
		<button type="button" onclick="fsubstr();">substr(start,length)</button>
		<button type="button" onclick="fsubstring()">substring(start,end)</button><br/>
		<button type="button" onclick="freplace()">replace(text,newtext)</button>
		<button type="button" onclick="freplaceAll()">replaceAll(text,newtext)</button>
		<button type="button" onclick="fcharAt()">fcharAt()(index)</button>
		<button type="button" onclick="fsplit()">fsplit(구분자)</button>
		<button type="button" onclick="findexOf()">indexOf(찾을문자열)</button>
		<script>
		let text = "Apple, Banana, Kiwi";
		let text1 = "Please visit Microsoft and Microsoft!";
		let text2 = "a,b,c,d,e,f";
		
		/* 함수선언 */
		function fslice() { /* 7번쨰 문자부터 13번째까지 */
			let part = text.slice(7,13);
			document.getElementById("demo").innerHTML = part; 
		}
		function fsubstr() { /* 7번째 문자열을 시작(0)으로 13번째까지 */
			let part = text.substr(7,13);
			document.getElementById("demo").innerHTML = part;
		}
		function fsubstring() {
			let part = text.substring(7,13);
			document.getElementById("demo").innerHTML = part;
		}
		
		function freplace() {
			let part = text1.replace("Microsoft","Apple");
			document.getElementById("demo").innerHTML = part;
		}
		function freplaceAll() {
			let part = text1.replaceAll("Microsoft","Apple");
			document.getElementById("demo").innerHTML = part;
		}
		function fcharAt() {
			/* let part = text1.charAt(2).toUpperCase();
			document.getElementById("demo").innerHTML = part; */
			let endlength1 = text1.length;
			let result = text1.charAt((endlength1-1));
			if(result === "!") {
				document.getElementById("demo").innerHTML = "일치합니다, 조회한문자열:"+result;	
			} else {
				document.getElementById("demo").innerHTML = "불일치합니다, 조회한문자열:"+result;
			}
			
		}
		
		function fsplit() {
			const myArray = text.split(",");
			
			document.getElementById("demo").innerHTML = myArray[(myArray.length-1)]; //배열의 마지막 가져오기
			
			
			/* for(let str in part){
				document.getElementById("demo").innerHTML += part[str]+"<br>";
			} */
			
		}
		//찾을 문자열의 index번호 받기
		function findexOf() {
			let result = text1.indexOf("Microsoft"); /* 찾을 문자열이 존재하지 않는다면 -1을 반환 */
			document.getElementById("demo").innerHTML = result;
			
			if(result != -1) {
				alert("찾았다");
			} else {result === -1} {
				alert("없다");
			}
		}
		
		</script>
		<pre>
			slice의 주의사항 - start는 0부터 시작, end는 미포함(그앞까지 추출), end를 생략하면 시작인덱스 번호 부터 끝까지.
							매개변수가 음수이면 문자열의 끝부터 역으로 된다
			substring - start는 0부터 시작, end는 미포함(그앞까지 추출), end를 생략하면 시작인덱스 번호 부터 끝까지.
							음수지원X
			replace - replace는 첫번째 일치 항목만 새로운 문자열로 변환한다, 대소문자를 엄격하게 구분한다. MICROSOFT라고 검색하면 검색하지 못한다.
			replaceAll - replaceAll은 일치하는 항목 전부를 새로운 문자열로 변환한다
			charAt - 해당 인덱스번호에 해당하는 문자열을 반환한다.
		</pre>
</body>
</html>