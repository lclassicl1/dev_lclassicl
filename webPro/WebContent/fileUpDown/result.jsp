<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>    
<%@ page import="org.apache.commons.io.output.*" %>    

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
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
		request.setCharacterEncoding("UTF-8");
		//파일 업로드와 관련된 클래스
		//업로드된 파일을 저장할 저장소와 관련된 클래스
		DiskFileItemFactory factory = new DiskFileItemFactory();
		File currentDirPath = new File("C:\\file_repo"); //해당 문자열안에 파일을 저장할 경로를 설정
		
		factory.setRepository(currentDirPath); //파일 저장할 디렉토리 경로를 설정, File타입을 매개변수로 원하고있기때문에 위에서 File타입 변수로 대입
		factory.setSizeThreshold(1024*1024); //최대 업로드할수있는 파일의 사이즈 설정
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		List<FileItem> items = upload.parseRequest(request);
		
		for(int i=0; i<items.size(); i++) {
			
			FileItem fileitem = items.get(i);
			
			if(fileitem.isFormField()) { //폼필드라면
				out.print(fileitem.getFieldName()+":");
				out.print(fileitem.getString("UTF-8"));
				System.out.print(fileitem.getFieldName()+":"+fileitem.getString("utf-8"));
			} else {
				//폼필드가 아니라면
				//브라우저에 출력
				out.println("매개변수명:"+fileitem.getFieldName());
				out.println("파일명:"+fileitem.getName());
				out.println("파일크기:"+fileitem.getSize());
				
				System.out.println("파일명:"+fileitem.getName());
				System.out.println("파일크기:"+fileitem.getSize());
				
				//업로드한 파일경로 가져오기
				//os에 따라서 절대경로로 표시되거나 파일명만 표시되기도 한다 이를 처리해줘야함
				String fileName = fileitem.getName();
				
				if(fileitem.getSize() > 0) {
				//os에 따른 경로표기가 달라서 이를 처리해주는 부분
				int idx = fileName.lastIndexOf("\\"); //먼저 lastindexof로 \ 표시의 가장 마지막 인덱스를 구함
				if(idx == -1) { // idx가 -1인경우는 \\를 못찾았을때의 경우기때문에 
					idx = fileName.lastIndexOf("/"); //다음은 마지막 / 를 찾아서 idx에 대입
				}
				
				String strFileName = fileName.substring(idx+1);
				
				
				//파일업로드
				//실제 업로드 되어지는 파일
				File uploadedFile =  new File(currentDirPath+"\\"+strFileName);
				
				//업로드된 파일을 저장소에 저장
				fileitem.write(uploadedFile);
			}
		}		
	}
	
	
	%>
</body>
</html>