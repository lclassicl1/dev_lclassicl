
<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="java.io.InputStream, java.io.IOException, org.apache.commons.fileupload.servlet.*,
				org.apache.commons.fileupload.disk.*, org.apache.commons.io.output.*"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  	<!-- google cdn 방식 jquery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta name="description" content="memberboard web app">
  <meta name="keywords" content="article, javascript, board, webProject">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
	<title>받은 파일?</title>
	<style></style>
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
	<h1>파일 받는 페이지?</h1>
	<%
		ServletContext context = pageContext.getServletContext();
		
		//파일 업로드와 관련된 파라미터 받아오는 코드
		String filePath = context.getInitParameter("file-upload");
		String contentType = request.getContentType();
		
		if((contentType.indexOf("multipart/form-data"))>=0) {
			DiskFileItemFactory factory = new DiskFileItemFactory(); 
			out.print("파일이 있다");
		} else {
			out.print("파일이없다");
		}
	
		out.println(request.getContentType());	
		out.println(request.getParameter("file1"));
	
	%>
</body>
</html>