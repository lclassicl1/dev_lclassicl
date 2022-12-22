<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table1.css">
<style>
	
</style>
</head>
<body>
	<h1>member History </h1>
	<h2>ResultSet에서  midiumtext 읽어오기 p396</h2>
	<table>
		<caption>조회목록</caption>
		<thead>
			<td>MemberId</td>
			<td>history</td>
		</thead>
		<tbody>
		<%
			String url = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8";
			String id = "jspexam";
			String pw = "jsppw";
			StringBuilder sql = new StringBuilder();
			StringBuffer buff = new StringBuffer();
			sql.append("select memberid, history"); 
			sql.append(" from member_history"); 
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null; //Select 쿼리 결과문의 집합
			String memberid = null;
			String history = null;
			Reader reader = null;
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("OracleDriver 클래스 생성 완료");
			} catch (ClassNotFoundException e) {
				System.out.println("OracleDriver 클래스 생성 실패");
				e.printStackTrace();
			}
			
			try {
				conn = DriverManager.getConnection(url, id, pw);
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
				
				
				
				if(rs.next()) {
					memberid = rs.getString("MEMBERID");
					history = rs.getString("history");
					
					//쿼리의 결과값이 null이면 getcharacterSteam은 null을 반환한다
					reader = rs.getCharacterStream("history");
					
					if(reader != null) {
						char[] ch = new char[512];
						int len = -1;
						//read()는 array에 있는 characters를 읽는다
						//read()는 읽은 characters 수를 리턴하고 stream의 끝에 도달하면 -1을 리턴한다
						while((len = reader.read(ch)) != -1) { //-1이 아닌동안 buff에 append로 한글자한글자 대입한다. array ch를 다 읽고나면 -1이 되므로 반복문 종료
							buff.append(ch,0,len); //임시 문자 기억저장소인 buff에 첫번째 index번호부터 읽어들인 문자열 갯수만큼 buff에 추가하겠다.
						}
					}
					
					history = buff.toString();
			%>
					<tr>
						<td><%=memberid%></td>
						<td><%=history%></td>
					</tr>
			<% 
			} else { %>
				<tr>
				<td><%=memberid%></td>
				<td><%=history %></td>
				</tr>
			<% }
				}catch (Exception e3) {
				e3.printStackTrace();
				System.out.println("select 실패");
			} finally { //exception 발생여부와 상관없이 무조건 마지막에 finally 블럭을 실행하게된다
				try {
					if(reader != null) {
						reader.close();
					}
				} catch(IOException e3) {
					e3.printStackTrace();
				}
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