<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>home_redirect_1222파일에서 값을 넘겨받는 페이지</h1><br/>
	<%String name = request.getParameter("user_name"); //Parameter이름을 가져와 String 타입 name 변수에 대입
		String pw = request.getParameter("user_pw"); //Parameter이름을 가져와 String 타입 pw 변수에 대입
		
		if(name.equals("kim")) { //name이 문자열 kim일경우 
			response.sendRedirect("home_redirect3.jsp?user_name="+name+"&user_pw="+pw); //강제 Page변경
		}
		
		%>
		
		<h2>넘겨받은이름:<%=name %></h2>
		<h2>넘겨받은비번:<%=pw %></h2>
</body>
</html>