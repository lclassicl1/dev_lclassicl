<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.*,java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*, java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원목록조회</title>
<style>
	table, td, tr {
		border:1px solid black;
		text-align: center;
		width:800px;
	}
</style>
</head>
<body>
	<h1>사원목록조회</h1>
	<table id="emp">
		<thead>
			<td>empno</td>
			<td>ename</td>
			<td>job</td>
			<td>mgr</td>
			<td>hiredate</td>
			<td>sal</td>
			<td>comm</td>
			<td>deptno</td>
		</thead>
		<tbody>
		<%
			String url = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8";
			String id = "jspexam";
			String pw = "jsppw";
			Connection conn = null;
			PreparedStatement pst = null;
			StringBuilder sql = new StringBuilder();
			ResultSet rs = null;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,id,pw);
			
			sql.append("select empno, ename, job, mgr, hiredate, sal, comm, deptno");
			sql.append(" from emp");
			
			pst = conn.prepareStatement(sql.toString());
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int eno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				int mgr = rs.getInt("mgr");
				Date date = rs.getDate("hiredate");
				int sal = rs.getInt("sal");
				int comm = rs.getInt("comm");
				int dno = rs.getInt("deptno");
		%>
				<tr>
					<td><%=eno %></td>
					<td><%=ename %></td>
					<td><%=job %></td>
					<td><%=mgr %></td>
					<td><%=date %></td>
					<td><%=sal %></td>
					<td><%=comm %></td>
					<td><%=dno %></td>
				</tr>
			<% 
				}
			
			
			%>
		</tbody>
	</table>
</body>
</html>