<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverConnectionFactory"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptinserForm</title>
</head>
<body>
	<h1>deptinsertForm의 조회Page</h1>
	<h2><strong>부서목록</strong></h2>
	<hr/>
	<p id="result"></p>
	<!-- 	<table>
			<thead>
				<td>부서번호</td>
				<td>부서이름</td>
				<td>소재지</td>
			</thead>
		</table> -->
		
		<%String sdno = request.getParameter("deptno"); /* 입력받은 deptno */
			int dno = Integer.parseInt(sdno); //insert 하기위한 숫자형 변환
			String dname = request.getParameter("dname"); /* 입력받은 dname */
			String loc = request.getParameter("loc"); /* 입력받은 loc */
			String url = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8"; /* mysql url */
			String id ="jspexam"; /* mysql 계정명 */
			String pw = "jsppw"; /* mysql 비번 */
			
			
			Connection conn = null;
			PreparedStatement psmt = null;
			StringBuffer sql = new StringBuffer();
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, id, pw);
				
			} catch(SQLException s1) {
				s1.printStackTrace();
			}
			
			
			sql.append("INSERT INTO DEPT");
			sql.append("  VALUES(?,?,?)");
			
			try {
				psmt = conn.prepareStatement(sql.toString());
				psmt.setInt(1, dno);
				psmt.setString(2, dname);
				psmt.setString(3, loc);
				
				int result = psmt.executeUpdate();
				
				if(result != 0) {
					
				%> 
				<script>
				alert(<%=result%>+'건입력완료');
				/* 페이지 이동방법1 location.href */
				//location.href="deptList_1222.jsp";
				
				/* 페이지 이동방법2 <jsp:forward> */
				</script>
				<%-- <jsp:forward page="deptList_1222.jsp"><jsp:param value="1" name="1"/></jsp:forward> --%>
				
				<%}
			} catch(Exception e) {
				%>
				<script>
				alert('입력실패');
				window.history.back();
				</script>
				<%
				e.printStackTrace();
				}
				
				try{
					if(psmt != null) {
						psmt.close();
					} 
				} catch (Exception e1) {
					e1.printStackTrace();
				} finally {
					conn.close();
				}
			%>	
</body>
</html>