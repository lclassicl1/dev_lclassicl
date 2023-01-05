<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		$('#btn1').click(function(){
			//alert('${getId}');
			$(opener.document).find('#mid').val('${getId}');
			self.close();
		});
	});
	
	/* function idUse() {
		//alert("${getId}");
		
		
		
		opener.document.memberFRM.memberid.value = "${getId}";
		document.getElementById('search').value = "${getId}";
		self.close();
	} */
</script>
</head>
<body>
	<!-- server로부터 response받은 후에는(비즈니스로직 수행 결과물을 받음) 컨트롤러에 의해서 request.setAttribute("result",result); 형식으로 받음-->
	<%-- 수행결과 browser에 출력하는방법
	기존에는 <%= %> 방식으로 출력했지만
	컨트롤러로부터 받은 response는 ${이름}호출로 출력이 가능하다, server를 한번거쳐서 response된 값이 있어야 출력 가능하다 --%> 
	<form name="idDup" id="idDup" action="<%=request.getContextPath()%>/idDuplicate.do">
	사용할ID:<input type="text" id="search" name="search" value="${getId}"/><input type="submit" value="확인" id="ok" name='ok'/>
	</form>
	<p id="text" style="display: none;"><input type="button" id="idOk" name="idOk" value="사용"/></p>
	
	<!-- jstl = 자바코드를 태그처럼 사용하기 위한 라이브러리 -->
	<!-- 원칙적으로는 jstl을 사용할때 url을 다 기재해줘야하지만 prefix 속성을 통해 c로 지정해놓고 c를 입력하면 uri을 사용할수잇게 해준다 -->
	<!--  if문 -->
	<%-- <c:if test="${result==1}"> <p id="text">${result}는 사용가능합니다.<input type="button" id="idOk" name="idOk" value="사용"/></p>
	</c:if> --%>
	<!-- if else는 choose를 사용한다 -->
	<c:choose>
		<c:when test="${result==1}">
			<p>${getId}는사용중인 ID 입니다.</p>
		</c:when>
		<c:when test="${result==0}">
			<p>${getId}는사용가능한 ID 입니다. <input type="button" value="사용" id="btn1"/></p>
		</c:when>
	</c:choose>
</body>
</html>