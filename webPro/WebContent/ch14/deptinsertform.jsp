<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DEPT insert form</h1>
	<form action="deptInsertProc_1223.jsp">
		<fieldset>
		<legend>DEPT 데이터 입력</legend>
		<table border="1">
			<tr>
				<th>부서번호</th>
				<td><input type="number" id="depno" name="deptno" placeholder="부서번호" min="41" max="999"/></td>
			</tr>
			<tr>
				<th>부서명</th>
				<td><input type="text" id="dname" name="dname" placeholder="부서명"/></td>
			</tr>
			<tr>
				<th>소재지</th>
				<td><input type="text" id="loc" name="loc" placeholder="소재지"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="입력"/>
					<input type="reset" value="취소"/>
					<button type="button" onclick="window.open('deptList_1222.jsp')">전체조회</button>
				</th>			
			</tr>
		</fieldset>
		</table>
	</form>
</body>
</html>