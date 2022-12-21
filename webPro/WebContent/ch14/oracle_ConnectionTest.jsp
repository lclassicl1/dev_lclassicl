<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Collection, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oracle Connector</title>
</head>
<body>
	<h1>Oracle database 연동</h1>
	<%
		try {
			Class.forName("oracle.jdbc.OracleDriver"); //문제가 없다면 try절에서 수행
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException");
			e.printStackTrace(); //문제가 있다면 catch 절에서 console에 출력해준다.
		}
		
		//2.연결
		//DriverManager를 통해서 getConnection 메소드를 호출, 파라미터값은 3개)
		//주소와 id password를 각자 String타입의 변수에 담아서 DriverManager파라미터값에는 변수만 대입
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String user = "scott";
		String pw = "tiger";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url,user,pw);
		} catch (SQLException e) {
			System.out.println("SQLException 연결실패");
			e.printStackTrace();
		}
		
		out.write("여기까지 잘왔구나....");
				
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
		out.write("close");

	%>
</body>
</html>