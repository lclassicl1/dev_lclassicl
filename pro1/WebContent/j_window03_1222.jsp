<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style>
	
	</style>
	<script>
		/* let win;
		let frmTest = document.frm;
		frmTest.target = 'nw';
		frmTest.action = 'j_childWindow_1222.jsp';
		frmTest.submit(); */
		function openwindow(){
			win = window.open('j_childWindow_1222.jsp','nw','width=20','height=20');
		}
		
		function childclose(){
			win.close();
		}
	</script>
</head>
<body>
	<h1>window</h1>
	<form name="frm" method="get">
		<fieldset>
			<legend>주소</legend>	
				주소:<input type="text" id="address1" name="address1" placeholder="주소"/><br/>
				상세주소:<input type="text" id="address2" name="address2" placeholder="상세주소"/><br/>
				우편번호:<input type="text" id="zipcode1" name="zipcode1" placeholder="우편번호" size="3"/>-
				<input type="text" id="zipcode2" name="zipcode2" placeholder="우편번호" size="3"/>
				<input type="button" id="btn_findzip" name="btn_findzip" value="우편번호찾기" onclick="openwindow();"/><br/>
				<!-- <button type="button" onclick="openwindow();" >새창열기</button>
				<button type="button" onclick="childclose();" >새창닫기</button> -->
		</fieldset>
	</form>
</body>
</html>