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
  	<!-- <script src="../js/jquery-3.6.3.js"></script> -->
    <meta charset="utf-8", name="viewport" content="width=device-width", initial-scale=1.0">
    
	<title></title>
	<style></style>
	<script>
		/* Jquery 스타일 */
		
		$(function(){
		//전체체크박스 클릭시 호출
				//개별체크박스의 체크상태를 = 전체체크박스의 상태와 동일하게 만든다.
			$('#selectall_jq').click(function(){
				if($('#selectall_jq').is(':checked')){ //전체선택용 체크박스가 체크되었는지 여부 {
					$('input[name="fruits_jq"]').prop('checked',true);
				} else {
					$('input[name="fruits_jq"]').prop('checked',false);
				}	
			});
			
			
		
			//개별 체크박스 클릭시		
			$('input[name="fruits_jq"]').click(function(){
				//name이 fruits_jq인 체크박스들중에 체크된 박스의 갯수
				let checkedbox = $('input[name=fruits_jq]:checked').length;
				
				//name이 fruits_jq인 체크박스의 갯수
				let allbox = $('input[name=fruits_jq]').length;
				
				
				if(checkedbox === allbox) {
					$('input[name="selectall_jq"]').prop('checked',true);
				} else {
					$('input[name="selectall_jq"]').prop('checked',false);
				}	
			});
		});
		
			
				//$(선택자).prop(속성명) => 선택자의 지정속성값을 가져오기
				//$(선택자).prop(속성명, 값) -> 선택자의 지정속성값을 설정
				//$('#selectall_jq').prop('checked',true); checked의 속성값을 true(즉 체크되어있는 상태로 만듬)
				//alert($('#selectall_jq').is('#selectall_jq:checked'));
		
		 

		
	
	</script>
</head>
<body>
	<h1>form_checkbox</h1>
	<p>j쿼리이용</p>
	<form name="frm2" id="frm1">
		<input type="checkbox" name="selectall_jq" id="selectall_jq" name="selectall"/><label for="selectall_jq">전체선택</label><br/>
		취미:<input type="checkbox" name="fruits_jq" id="f10" class="c1" value="apple"/><label for="f10">사과</label> <!-- html5에 추가된 label -->
		<input type="checkbox" name="fruits_jq" id="f11" class="c1" value="orange" /><label for="f11">오렌지</label>	
		<input type="checkbox" name="fruits_jq" id="f12" class="c1" value="strawberry" /><label for="f12">딸기</label>	
		<input type="checkbox" name="fruits_jq" id="f13" class="c1" value="kiwii" /><label for="f13">키위</label>	
		<input type="checkbox" name="fruits_jq" id="f14" class="c1" value="banana" /><label for="f14">바나나</label>	
		<input type="checkbox" name="fruits_jq" id="f15" class="c1" value="koreamelon" /><label for="f15">참외</label><br/>
		<button type="button" id="btn1" onclick="requiredChect();">확인</button>
	</form>
	<hr/>
	<form name="frm1" id="frm1">
		<input type="checkbox" name="selectall" id="selectall" name="selectall" onclick="selectAllf(this);"/><label for="selectall">전체선택</label><br/>
		취미:<input type="checkbox" name="fruits" id="f0" class="c1" value="apple" onclick="selectAllf2();"/><label for="h0">사과</label> <!-- html5에 추가된 label -->
		<input type="checkbox" name="fruits" id="f1" class="c1" value="orange" onclick="selectAllf2();"/><label for="h1">오렌지</label>	
		<input type="checkbox" name="fruits" id="f2" class="c1" value="strawberry" onclick="selectAllf2();"/><label for="h2">딸기</label>	
		<input type="checkbox" name="fruits" id="f3" class="c1" value="kiwii" onclick="selectAllf2();"/><label for="h3">키위</label>	
		<input type="checkbox" name="fruits" id="f4" class="c1" value="banana" onclick="selectAllf2();"/><label for="h4">바나나</label>	
		<input type="checkbox" name="fruits" id="f5" class="c1" value="koreamelon" onclick="selectAllf2();"/><label for="h5">참외</label><br/>
		<button type="button" id="btn1" onclick="requiredChect();">확인</button>
	</form>
	<hr/>
	
	<!-- 체크항목 결과 출력되는영역 -->
	<div id="result"></div>
	<script type="text/javascript">
	//전체선택 버튼 클릭시 호출되는 메서드
	 
	//각체크항목(클래스로 접근)
	$(function(){
		$('.c1')
	});
	
	
	function selectAllf(Allobj){
		//Allobj에는 클릭이벤트가 발생한 전체선택의 input 전체 객체가 들어온다
		const chbox = document.querySelectorAll('input[name=fruits]');
		
		/* 참고
		document.querySelectorAll 메서드로 리턴받은 nodeList는 유사배열
		유사배열은 숫자타입의 index를 가지며 length 속성을가진다
		 */
				
		//console.log(typeof chbox); //type이 어떤 type인지 확인, chbox는 object 타입
		
		 chbox.forEach((currentElement) => {
			currentElement.checked = Allobj.checked; 
		});
	 }
	
	function selectAllf2() {
		//선택된 체크박스
		let checkedboxes = document.querySelectorAll('input[name=fruits]:checked');
		
		//체크박스 전체
		let chboxes = document.querySelectorAll('input[name=fruits]')
		
		//전체선택용 체크박스
		let all = document.getElementById('selectall');
		
		//체크박스의 갯수만큼 체크된박스가 동일하다면
		if(checkedboxes.length === chboxes.length) {
			//전체선택박스를 true
			all.checked = true;
		} else {
			all.checked = false;
		}
		

		
	}
	</script>
	
</body>
</html>