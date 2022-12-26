<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서목록</title>
<style>
table, td, tr {	  
		  border:1px solid black;
	 	  width:500px;
	 	  height:30px;
	 	  padding-block: var(--padding-lg);
	 	  text-align: center;
 	  }

</style>
</head>
<body>
	<h2><strong>Connection Pool을 이용한 DeptList</strong></h2>
	<table id="dept">
		<caption>부서목록</caption>
		<thead>
			<td>부서번호</td>
			<td>부서명</td>
			<td>소재지</td>
		</thead>
		<tbody>
		<%
			String url = "jdbc:apache:commons:dbcp:chap14"; //환경설정한거랑 똑같이 맞춰줘야함, DBCPInit의 85번째Line
			StringBuilder sql = new StringBuilder();
			sql.append("select deptno, dname, loc"); 
			sql.append(" from dept"); 
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null; //Select 쿼리 결과문의 집합
			
		
			//Connection Pool을 이용한 Connection 얻기 
			try {
				conn = DriverManager.getConnection(url);
				System.out.println("접속 성공");
			} catch (SQLException e1) {
				System.out.println("오류가 있어서 접속 실패");
				e1.printStackTrace();
			} 
			
			
			//preparedStatement 객체 생성
			try {
				pstm = conn.prepareStatement(sql.toString());
				System.out.println("객체 생성 완료");
			} catch (SQLException e2) {
				System.out.println("객체 생성 실패");
				e2.printStackTrace();
			}
			
			try {
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					int dno = rs.getInt("deptno");
					String dname = rs.getString("dname");
					String loc = rs.getString("loc");
				
			 
		%>
		<tr>
			<td><%=dno%></td>
			<td><%=dname%></td>
			<td><%=loc%></td>
		</tr>
		<% 
			}
				
				}
			 catch (Exception e3) {
				e3.printStackTrace();
				System.out.println("select 실패");
			}
			
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstm != null) {
					pstm.close();
				}
				
				if(conn != null) {
					conn.close();
				}
				System.out.println("모든 객체 close완료");
			} catch (Exception e) {
				System.out.println("객체 닫기 실패");
			}
		%>
		</tbody>
	</table>
</body>
</html>