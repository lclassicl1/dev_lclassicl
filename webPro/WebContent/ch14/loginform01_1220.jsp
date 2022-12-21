<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login form</title>
<style>
#submit {width:410px; height:50px; background-color: #04AA6D;}
#cancel {width:80px; height:40px; background-color: #F44336;}
.textbox {width:400px; height:30px;}
#img{border-radius: 70%;}
#main{text-align: center;}
</style>
</head>
<body>
	<h1>Login Form</h1>
	<fieldset>
	<div id="main">
		<form action="loginform02_1220.jsp" target="_blank" >
			<img src="../image/main.png" alt="로그인페이지사진" id="img"><br/>
			<strong>Username</strong><br/><input type="text" name="user_id" id="user_id" class="textbox" required="required" placeholder="Enter Username"><br/>
			<strong>Password</strong><br/><input type="password" name="user_pw" id="user_pw" class="textbox" required="required" placeholder="Enter Password">	<br/>
			<input type="submit" value="Login" id="submit"><br/>
			<script>
				function testcon() {
					let result = confirm('비밀번호 찾기 하실껀가요?');
					if(result == true) {
						response.sendRedirect('changpwd.jsp');
					} else {
						
					}
				}
			</script>
				<div id="cancel"><input type="reset" value="Cancel" id="cancel"> </div>Forgot&nbsp;<a href="changepwd.jsp" onclick="testcon()" target="_blank">Password?</a>
			
		</form>
	</div>		
	
	</fieldset>
</body>
</html>