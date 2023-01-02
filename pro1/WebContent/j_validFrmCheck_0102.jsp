<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <!-- cdn 방식으로 jquery 연동 -->
        <!-- <script src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
       	<!-- download방식으로 jquery 연동 -->
  		<!-- <script src="./js/jquery-3.6.3.js"></script> -->
  		<!-- google cdn 방식 -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  	

    <meta charset="utf-8">
	<title></title>
	<style>
	.c1 {
		width:90px;
	}
	
	#memberFRM td, memberFRM th{
		border: 1px solid #ddd;
		padding: 4px;
	}
	
	#memberFRM th{
		text-align: left;
		width:100px;
		background-color: aqua;
	}
	
	</style>
	<script>
		//회원가입 form의 유효성 검사를 하기위한 함수
		function validChk(obj){ 
			//console.log(obj); //object HTMLFormElements
			let id = obj.mid.value; //각 요소의 value를 꺼내옴
			let pwd = obj.mpwd.value;
			let re_pwd = obj.re_mpwd.value;
			let name = obj.mname.value;
			let phone = obj.tel.value;
			
			if(id == null || id=="") { //id의 값이 비었을때
				alert('아이디를 입력해주세요');
				obj.mid.focus(); //포커스 위치 지정
				return false; //return문만 있으면 하단에 코드가 더 있더라도 함수를 더이상 진행하지않는다
			}
			
			if(pwd == null || pwd=="") { //pwd의 값이 비었을때
				alert('비밀번호를 입력해주세요');
				obj.mpwd.focus();
				return false;
			} 
			
			if(pwd.length < 4 || pwd.length > 12) { //글자수 4~12사이로 제한
				alert('비밀번호4~12글자 이내로 작성하세요');
				obj.mpwd.value=""; //비밀번호 입력된 값을 초기화
				obj.mpwd.focus();
				return false;
			}
			
			if(re_pwd == null || re_pwd == "") { //비밀번호 확인 필수입력 유효성검사
				alert('비밀번호 확인을 입력해주세요');
				obj.re_mpwd.focus();
				return false;
			}
			
			if(pwd != re_pwd) { //비밀번호와 비밀번호 확인이 일치하지 않을때
				alert('비밀번호가 일치하지 않습니다');
				obj.re_mpwd.value=""; //비밀번호 확인란 초기화
				obj.mpwd.value=""; //비밀번호란 초기화
				obj.mpwd.focus(); //비밀번호란에 다시 포커스 지정
				return false;
			}
			
			if(name == null || name=="") { //이름 작성 여부 검증
				alert('이름을 입력해주세요');
				obj.mname.focus();
				return false;
			}
			
			//약관동의여부
			if(!obj.agree.checked) { //체크된 상태가 아닐때
				alert('동의해주세요');
				obj.agree.focus();
				return false;
			}
			
			let genderObj = obj.gender;
			 if(!genderObj[0].checked && !genderObj[1].checked) { //성별여부 체크검증
				alert('성별을 체크해주세요');
				return false;
			} 
			
			
			
			if(phone==null || phone=="") {
				alert('전화번호 필수입력사항입니다');
				obj.tel.focus();
				return false;
			} else if(phone != "") {
				//alert(phone.indexOf('-'));
				//alert(phone.replace('-',""));
				let phonenumber = phone.replaceAll('-',"");
				alert(phonenumber);
			}
			
			
			
			
			
			return true;
		}
		
		function selectEmail(op) { //select
			let text =""; 
			let index = op.selectedIndex; //select의 인덱스 번호 가져오기
			text =  op[index].value; //해당 인덱스번호의 value를 가져와 text 변수에 대입
			//alert(text);
			
			//document.getElementById('email_d').value = text; //text를 해당 email_d에 뿌려주기
			document.memberFRM.email_d.value = text; //text를 해당 email_d에 뿌려주기 form으로 접근해 대입함
			
			if(op[index].value == null || op[index].value == "") {
				//alert('직접입력');
				document.getElementById('email_d').focus();
			}
		}
		
	</script>
</head>
<body>
	 <!-- onsubmit은 submit 버튼을 눌렀을때만 수행된다 여기서 this는 submit 이 아닌 이벤트가 발생하는 form을 의미 -->
	<form action="j_ok.jsp" name="memberFRM" id="memberFRM" method="get" onsubmit="return validChk(this);"> <!-- return을 부여하면서 함수가 false를 리턴하면 넘기지않는다 -->
		<table>
			<caption>회원가입</caption>
			<tbody>
				<tr>
					<th class='c1'>아이디</th>
					<td><input type="text" name="mid" id="mid"/></td>
				<tr/>
				<tr>	
					<th class='c1'>비밀번호</th>
					<td><input type="password" name="mpwd" id="mpwd"/></td>
				</tr>
				<tr>	
					<th class='c1'>비밀번호확인</th>
					<td><input type="password" name="re_mpwd" id="re_mpwd"/></td>
				<tr/>
				<tr>
					<th class='c1'>이름</th>
					<td><input type="text" name="mname" id="mname"/></td>
				</tr>
				<tr>	
					<th class='c1'>성별</th>
					<td><input type="radio" name="gender" id="gender0" value="man"/><label for="gender0">남</label>
						<input type="radio" name="gender" id="gender1" value="woman"><label for="gender1">여</label></td>
				</tr>
				<tr>	
					<th class='c1'>전화번호</th>		
					<td><input type="text" name="tel" id="tel" placeholder="01012345678형식으로 입력해주세요"/></td>
				</tr>
				<tr>
					<th class='c1'>이메일</th>	
					<td><input type="text" name="email_id" id="email_id" size="12">@<input type="text" name="email_d" id="email_d" size="10"/>
							<select name="email_dd" id="email_dd"  onchange="selectEmail(this.options);">
								<option value="">직접입력</option>
								<option value="daum.net">daum.net</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="checkbox" name="agree" id="agree"/><label for="agree">약관동의</label></td>
				</tr>
				<tr> 
					<td colspan="2" style="text-align: center;"><input type="submit" value="확인"/><input type="reset" value="취소"/></td>
				</tr>	
		</tbody>	
		</table>
	</form>
</body>
</html>