<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jdbc.conn.ConnectionProvider,java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Connection Test</title>
</head>
<body>
	<h1>DB연동테스트(p586)	</h1>
	<%
		//db 커넥션을 얻기 위한 jsp 문서
		//문제가 생길수도 있는 메소드를 가져다 쓸때는 받아서 사용하는곳에서도 Try-catch 절을 사용해주는것이 좋다
		try {
			Connection conn	= ConnectionProvider.getConnection();
			out.println("Connection 성공"); //성공인지 실패인지 명확하게 나타내주기 위한 출력문구
		} catch(SQLException e) {
			e.printStackTrace();
			out.println("Connection 실패");
		}
	%>
</body>
</html>