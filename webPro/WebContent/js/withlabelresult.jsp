<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map, java.util.Set"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>withlabel의 결과창</title>
</head>
<body>
	<h1>withlabel의 결과창</h1>
	<p>선택한 결과(getParameterValues방식):<%
	/* getParameterValues방식 */
	String[] names = request.getParameterValues("name");
	if(names != null) {
		for(int i=0; i<names.length; i++) {
		out.print(names[i]+" ");
		}
	} else {
		out.print("선택된값이 없습니다");
	}
	%></p> <br/>
	
	<p>선택한결과(getParameterMap방식):<%
		Map<String, String[]> nameMap = request.getParameterMap();
		Set<String> nameSet = nameMap.keySet();
		Iterator iter = nameSet.iterator();
		
		if(iter.hasNext()){
		while(iter.hasNext()) {
			String keys = (String)iter.next();
			String[] results = nameMap.get(keys);
			
			for(int i=0; i<results.length; i++) {
				out.print("key:"+keys+" ");
				out.print("value:"+results[i]+" ");
			}
		}
		} else {
			out.print("선택된 값이없습니다.");
		}
	%></p>
	
	
</body>
</html>