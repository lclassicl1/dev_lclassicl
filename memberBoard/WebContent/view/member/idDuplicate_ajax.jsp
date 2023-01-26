<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	body {
		background-color: rgb(31 41 55);
		color: rgb(243 244 246);
	}
</style>
<script>
	$(function(){
		$('#ok').click(function(){ //id가 ok인걸 클릭했을때
			let idtxt = $('#search').val(); //아이디가 search인 text박스에서 value값을 가져와 변수에 담는다
			if(idtxt=="") {
				alert('아이디 입력하셔야됩니다');
				$('#search').focus(); //키보드 커서를 다시 search 텍스트박스로 이동해줌
				return false; //다음 코드로 넘어가는것을 방지하기 위한 코드
			}
			
			let queryS = {id:idtxt}; //JSON 스타일로 키:밸류값을 정해서 변수에 담는다. 이때 변수는 Object 타입
			$.ajax({
				type:"post", //데이터 전송시 방식정하는 type: get or post
				asyns:"true", //true면 비동기방식
				url:"<%=request.getContextPath()%>/idDuplicate2.do", //데이터 전송할 controller 지정, 페이지이동이 아님
				data: queryS, //서버로 전송할 데이터
				success:function(data){  // controller에서 값을 제대로 받아왔다면 호출되는 함수, data에 컨트롤러에서 반환해준 값이 담긴다
					
					if(data == "1") {
						//반환값이 1이라면 존재하는 id가 있는것
						$('#result').html("이미 존재하는 ID입니다.");
						$('#search').val(""); //search text 라인 초기화
					} else {
						//사용가능한 id일때 멘트출력과 함께 사용하기 button 생성
						$('#result').html("사용 가능한 ID 입니다.<input type='button' id='useid' name='useid' value='사용하기'/>");
					}
					
					// 사용하기 버튼을 눌렀을때
					$('#useid').click(function(){
						$('#search').val(queryS.id); //해당 Json타입의 값을 뽑아서 search 라인에 대입
						$('#result').html(""); //결과값 출력해주는 멘트를 없애준다
						
					});
				},
				error:function(xhr,status,error) {
					
				},
				complete:function() {
					console.log('끝');					
				}
			});//ajax 끝
		}); //ok 버튼 끝
		
	});
</script>
</head>
<body>
	<h2>아이디 중복검색(ajax.ver)</h2>
	"<%=request.getContextPath()%>/idDuplicate2.do"
	<form name="idDup2" id="idDup2">
	사용할ID:<input type="text" id="search" name="search"/>
			<input type="button" value="확인" id="ok" name='ok'/>
	</form>
	<!-- 결과가 출력되는 영역 -->
	<div id='result'></div>
	<p id="text" style="display: none;"><input type="button" id="idOk" name="idOk" value="사용"/></p>
	
</body>
</html>