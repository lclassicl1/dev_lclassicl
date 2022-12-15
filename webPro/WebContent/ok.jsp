<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration, java.util.Map, java.util.Set" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responePage</title>
</head>
<body>
	<h1>okokokokokokokokokokokokokokokokokokok</h1>
	<ul>
		<%-- <h2>jsp 주석문</h2>
			expression(표현식) <%= %> 브라우저화면에 출력

		<% --%>
			
		<%String name = request.getParameter("mname"); //이름 
		  String pwd = request.getParameter("mpwd"); //비번
		  
			String[] animals = request.getParameterValues("animals");
		  
		  
		  /*String[] animals = {"bat","tiger","cat","dog","giraffe"};
		  
		   for(int i=0; i<animals.length; i++) {
			  System.out.println("index("+i+")="+animals[i]);
		  }
		  
		  System.out.println("---------------------------");
		  
		  for(String str : animals) {
			  System.out.println(str); 
		  }*/%>
		<h2>유저가 입력한 데이터</h2>
		
		<li>이름:<%=name%></li>
		<li>비번:<%=pwd %></li>
		<li>좋아하는동물들:<%
			if(animals != null) {
				for(int i=0; i<animals.length; i++) {
					  System.out.println("index("+i+")="+animals[i] ); //콘솔출력
					  //out객체는 javax.servlet.jsp.JspWriter가 new 된것
					  //out객체의 println()혹은 print()를 이용하여 브라우저 화면에 출력
					  out.print(animals[i]+"<br/>"); //브라우저 출력
					  
				  }
			}%>
		</li> 
	</ul>
	<hr/>
	<p>*request.getParameterNames()이용<br/>
	=>웹 브라우저가 전송한 파라미터의 이름 목록을 가져오기</p>
	<%
		Enumeration<String> param = request.getParameterNames();
		while(param.hasMoreElements()) {
			String paraList = param.nextElement();
			System.out.println(paraList);
			out.print(paraList+"<br/>");
		}
	%>
	
	<hr/>
	<p>*request.getParameterMap()이용<br/>
	=> 웹브라우저가 전송한 파라미터의 Map을 가져오기</p>
	
	<%
		Map<String, String[]> paraMap = request.getParameterMap();
		/* String[] values = paraMap.get("mname");
		System.out.println(values[0]);
		out.print(values[0]+"<br/>"); */
		
		Set<String> paraSet = paraMap.keySet();
		Iterator iter = paraSet.iterator();
		
		while(iter.hasNext()) {
			String key = (String)iter.next();
			String[] str = paraMap.get(key);
			
			for(String value : str) {
				out.print("key:"+key+":"+value+"<br/>");
			}
			
		}
		
	%>
	
	
</body>
</html>