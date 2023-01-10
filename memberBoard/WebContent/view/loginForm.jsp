<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21e0d5f68f588827af92c418f9ecdfbc"></script> 카카오맵-->
<style>
	#field {
	
	}
	
	.error{
		color: red;
	}

</style>
<script>
	

Kakao.init('21e0d5f68f588827af92c418f9ecdfbc');
console.log(Kakao.isInitialized());


function kakao() {
	Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: 'view/loginForm.jsp',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
}


/* 카카오맵 실행 코드 let contanier = document.getElementById('map');
let options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3			
};

let map = new kakao.maps.Map(contanier, options); */

</script>
<title>로그인</title>
</head>
<body>
	<fieldset id="field">
		<legend>로그인Page</legend>
			<span class="error"><c:if test="${errors.notMach}">
				아이디와 암호가 일치하지 않습니다.
			</c:if></span>
		<form action="login.do" method="post">
			<p>
			아이디:<input type="text" name="memberid"/>
			<span class="error"><c:if test="${errors.memberid}">ID를 입력하세요</c:if></span>
			</p>
			<p>
			비밀번호:<input type="password" name="memberpwd"/>
			<span class="error"><c:if test="${errors.memberpwd}">암호를 입력하세요</c:if></span>
			</p>
			<input type="submit" value="Login"/>&nbsp;<input type="reset" value="cancel">&nbsp;<input type="button" value="home" onclick='location.href="<%=request.getContextPath()%>/index.jsp"'>
			<img src="../img/kakao_login.png" onclick="kakao();"/><br/>
			<div id="map" style="width:500px;height:400px;"></div>
		</form>
	</fieldset>	
</body>
</html>