<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h1>parameter 넘어와서 출력됩니다</h1>
	<%String id = request.getParameter("id"); 
		String pwd = request.getParameter("pwd");
		if(id != null & id.equals("faker") & pwd.equals("1234")) {
			response.sendRedirect("logincomplete.jsp?id="+id+"&pwd="+pwd);
		} else if(id != null & !id.equals("faker") & !pwd.equals("1234")) {
			out.print("faker는 아니지만 id는:"+id+"입니다<br/>비밀번호는:"+pwd+"입니다");
		} else {
			out.print("입력된 아이디가 없습니다");
		}
		%>

</body>
</html>