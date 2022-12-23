<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script>
		let indexNum; 
		let address1;
		let text="";
		function findzip(obj){
			text = "this.value의 값:"+obj+'<br/>'; 
			indexNum = (obj.indexOf(1)-1); //1앞의 -1를 한 인덱스번호 
			text += "숫자1의 뒤로 두번째까지의 인덱스번호:"+indexNum;
			let result = obj.substr(0,indexNum); //주소1
			let result2 = obj.substr(indexNum+1); //주소2
			//alert(result2.indexOf(' '));
			let adr2 = result2.substr(0 ,(result2.indexOf(' ')));
			let zipindex = obj.indexOf('-'); // -의 인덱스번호
		
			let zip1 = obj.slice(zipindex-3,zipindex);
			let zip2 = obj.substr(zipindex+1);
			text += '<br/>주소1:'+result;
			text += '<br/>주소2:'+adr2;
			text += '<br/>우편번호1:'+zip1
			text += '<br/>우편번호2:'+zip2
			//text += obj.strsub(0,address1); 
			document.getElementById('text').innerHTML = text;
			
			//부모창의 문서안의 폼 하위 특정필드
			//alert(opener.window.frm.address1.value);
			
			//계층구조를 이용하여 특정 요소에 접근
			opener.window.frm.address1.value = result;
			
			//opener.document 객체의 getElementById()를 이용하여 특정요소에 접근
			opener.document.getElementById('address2').value = adr2;
			opener.document.getElementById('zipcode1').value = zip1;
			
			//document객체의 query selector를 이용하여 특정요소에 접근
			opener.document.querySelector('#zipcode2').value = zip2;
		}
		
		function clo() {
			window.close();
		}
		
		
	</script>
</head>
<body>	
	<h1>ChildWindow</h1>
	<%String adr1 = request.getParameter("address1");
		String adr2 = request.getParameter("address2");
		String post1 = request.getParameter("zipcode1");
		String porst2 = request.getParameter("zipcode2");%>
	<p id="text"></p>
	<form name="zipcodeFrm" id="zipcodeFrm">
		<!-- ★this는 이벤트가 발생한 객체를 가리킨다. 객체 안에는 속성들도 포함하고 있다 -->
		<input type="button" id="btn1" value="서울시 강남구 역삼동 100번지 123-123" onclick="javascript:findzip(this.value);clo();"/> <!-- onclick에 function 2개넣기 -->
		<input type="button" id="btn2" value="서울시 송파구 잠실동 100번지 456-789" onclick="findzip(this.value);"/>
		<input type="button" id="btn3" value="전북 전주시 무슨읍 무슨면 123번지 777-888" onclick="findzip(this.value);"/>
		<input type="button" id="btn4" value="부산시 무슨구 무슨구 어떤동 155번지 888-999" onclick="findzip(this.value);"/>
		<input type="button" id="btn4" value="강원도 무슨무슨구 무슨무슨리 무슨무슨무슨읍 155번지 888-999" onclick="findzip(this.value);"/>
		<input type="button" id="btn4" value="서울시 관악구 조원로22길25 155번지 888-999" onclick="findzip(this.value);"/>
		<input type="button" id="btn4" value="출력" onclick="print()"/>
	</form>
	<button type="button" onclick="self.close();">자기자신 닫기</button>	<!-- 자기자신닫기 self.close();-->
	<button type="button" onclick="opener.close();">부모창 닫기</button> <!-- 부모창 닫기 opner.close(); -->
</body>
</html>