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
		//jquery 시작부분
		$(function(){
			//폼의 유효성 검사를 담당하는 function
			//memberFRM 폼객체의 onsubmit에 해당하는 submit
			$('form#memberFRM').submit(function(){ // = form객체의 submit이 발생되면
				let obj = $(this);
				//alert(obj.attr('id'));
			
				//회원가입 form의 유효성 검사를 하기위한 함수
				//console.log(obj); //object HTMLFormElements
				let id = $('#mid').val(); //각 요소의 value를 꺼내옴
				let pwd = $('#mpwd').val();
				let re_pwd = $('#re_mpwd').val();
				let name = $('#mname').val();
				let phone = $('#tel').val();
				
				if(id == null || id=="") { //id의 값이 비었을때
					alert('아이디를 입력해주세요');
					$('#mid').focus(); //포커스 위치 지정
					return false; //return문만 있으면 하단에 코드가 더 있더라도 함수를 더이상 진행하지않는다
				}
				
				if(pwd == null || pwd=="") { //pwd의 값이 비었을때
					alert('비밀번호를 입력해주세요');
					$('#mpwd').focus();
					return false;
				} 
				
				if(pwd.length < 4 || pwd.length > 12) { //글자수 4~12사이로 제한
					alert('비밀번호4~12글자 이내로 작성하세요');
					$('#mpwd').val(""); //비밀번호 입력된 값을 초기화
					$('#mpwd').focus();
					return false;
				}
				
				if(re_pwd == null || re_pwd == "") { //비밀번호 확인 필수입력 유효성검사
					alert('비밀번호 확인을 입력해주세요');
					$('#re_mpwd').focus();
					return false;
				}
				
				if(pwd != re_pwd) { //비밀번호와 비밀번호 확인이 일치하지 않을때
					alert('비밀번호가 일치하지 않습니다');
					$('#re_mpwd').val(""); //비밀번호 확인란 초기화
					$('#mpwd').val(""); //비밀번호란 초기화
					$('#mpwd').focus(); //비밀번호란에 다시 포커스 지정
					return false;
				}
				
				if(name == null || name=="") { //이름 작성 여부 검증
					alert('이름을 입력해주세요');
					$('#mname').focus();
					return false;
				}
				
				//약관동의여부
				
				let c = $('input[type=checkbox]:checked').length; //input의 type 속성중에 checkbox가 체크되어있는지 확인해서 그 길이를 리턴
				if(c===0) { //0인경우에는 체크된 항목이 없다는 말이 된다.
					alert('동의해주세요');
					$('#agree').focus();
					return false;
				} 
				

				let n = $('input[type=radio]:checked').length;
				 if(n === 0) { //성별여부 체크검증
					alert('성별을 체크해주세요');
					return false;
				}
				
				
				//정규식 let reg = /^[0-9]+/g;
				//정규표현식.test(대상문자열) => 맞으면 true 리턴
				if(phone==null || phone=="") {
					alert('전화번호 필수입력사항입니다');
					$('#tel').focus();
					return false;
				} else if(phone != "") {
					let phonenumber = phone.replaceAll('-',""); //phonenumber의 값중에 - 문자를 ""로 치환
					$('#tel').val(phonenumber); //치환된 문자열을 id가 tel로 지정된 text필드에 대입. 이는 추후 DB에 올바른값을 넣기 위하여 설정
				}
				
				return true;
				
				/* javascript submit 메소드를 이용하여 submit 버튼이 아니더라도 동일한 결과를 수행하게 만들어준다
				obj.submit(); */
				
				/* 폼객체의 메소드와 액션을 별도로 지정할수도있다
				obj.method="post";
				obj.action="j_ok.jsp";*/
				
			});
			
			
			//email 선택부분 jquery로 변환
			$('#email_dd').change(function(op){
				//alert($('select[id=email_dd] option:selected').val());
				let text = $('select[id=email_dd] option:selected').val();
				$('#email_d').val(text);
			});
		
		}); //jquery의 끝
	</script>
</head>
<body>
	 
	<form action="j_ok.jsp" name="memberFRM" id="memberFRM" method="get">
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
							<select name="email_dd" id="email_dd">
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
					<td colspan="2" style="text-align: center;"><input type="submit" value="확인(submit)"/><input type="reset" value="취소"/><input type="button" value="확인(button)"/></td>
				</tr>	
		</tbody>	
		</table>
	</form>
</body>
</html>