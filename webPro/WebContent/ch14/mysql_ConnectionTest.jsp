<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Collection, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Connector</title>
</head>
<body>
	<h1>mysql connection test</h1>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver"); //문제가 없다면 try절에서 수행
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException");
			e.printStackTrace(); //문제가 있다면 catch 절에서 console에 출력해준다.
		}
		
		//2.연결
		//DriverManager를 통해서 getConnection 메소드를 호출, 파라미터값은 3개)
		//주소와 id password를 각자 String타입의 변수에 담아서 DriverManager파라미터값에는 변수만 대입
		StringBuilder url1 = new StringBuilder();
		StringBuilder user1 = new StringBuilder();
		StringBuilder pw1 = new StringBuilder();
		
		url1.append("jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8");
		user1.append("jspexam");
		pw1.append("jsppw");
		
/* 		String url = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8";
		String user = "jspexam";
		String pw = "jsppw"; */
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url1.toString(),user1.toString(),pw1.toString());
		} catch (SQLException e) {
			System.out.println("SQLException 연결실패");
			e.printStackTrace();
		}
		
		out.println("DB 연동 완료");
				
		//3.쿼리문 실행과 관련된 조작을 위한 객체 준비작업, - Preparedstatement객체 or statement 객체 
		//4.쿼리문 실행
				
		//5.리소스 close
		try {
			if(conn != null) {
				conn.close();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.print("close");
	%>
</body>
</html>