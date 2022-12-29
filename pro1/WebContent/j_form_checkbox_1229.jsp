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
	
	</script>
</head>
<body>
	<h1>form_checkbox</h1>
	<form name="frm1" id="frm1">
		<input type="checkbox" name="selectall" id="selectall" name="selectall" onclick="selectAllf(this);"/><label for="selectall">전체선택</label><br/>
		취미:<input type="checkbox" name="hobby" id="h0" value="game" onclick="selectAllf2(this);"/><label for="h0">게임</label> <!-- html5에 추가된 label -->
		<input type="checkbox" name="hobby" id="h1" value="sport"onclick="selectAllf2(this);"/><label for="h1">운동</label>	
		<input type="checkbox" name="hobby" id="h2" value="foodtour" onclick="selectAllf2(this);"/><label for="h2">맛집탐방</label>	
		<input type="checkbox" name="hobby" id="h3" value="movie" onclick="selectAllf2(this);"/><label for="h3">영화</label>	
		<input type="checkbox" name="hobby" id="h4" value="read" onclick="selectAllf2(this);"/><label for="h4">독서</label>	
		<input type="checkbox" name="hobby" id="h5" value="travel" onclick="selectAllf2(this);"/><label for="h5">여행</label><br/>
		<button type="button" id="btn1" onclick="requiredChect();">확인</button>
	</form>
	<hr/>
	
	<!-- 체크항목 결과 출력되는영역 -->
	<div id="result"></div>
	<script type="text/javascript">
	 let resultarea;
	 let checkList = document.getElementsByName('hobby');
	 let ch = checkList.checked;
	 
	 //각각 개별 체크박스
	 function selectAllf2(checkbox) {
		 //전체체크박스
		 const all =  document.getElementsByName('selectall')[0];
		 if(checkbox.checked === false) {
			 all.checked = false;
		 }
	 }
	 
	 
	 /* css 선택자
	 input => html문서내의 모든 input 요소
	 [속성명] = html문서내의 속성을 가진 모든 요소
	 예)[name] = html문서내의 name속성을 가진 모든 요소
	 [속성명=값] = html문서내의 지정 속성의 값을 가진 모든 요소
	 예)[name=hobby] = name의 속성값이 hobby인 모든 요소 
	 [name=hobby]:checked => html문서내의 name속성이 hobby인 input 요소중 체크된 요소*/
	 
	 
	 /* document.querySelector(css선택자) = css선택자에 해당하는 첫번째 요소에 접근
	 document.querySelectorAll(css선택자) = css 선택자에 해당하는 모든 요소에 접근 */
	 
	 //전체선택 함수
	 function selectAllf(obj) {
		 
		 //매개변수 obj에는 this를 받았기때문에 해당 이벤트가 발생한 input 타입을 저장
		 
		let checkList = document.querySelectorAll('input[name=hobby]'); 
		
		/* const checkList = ['사과','애플','망고','파인애플']; */
		/*배열명.foreach((현재요소, 인덱스번호, 배열) => {
				
		});*/
		/* checkList.forEach((currentElement,index,array) =>{
			
			console.log(currentElement); //사과 애플 애플망고
			console.log(index); // 0 1 2
			console.log(array); // ['사과','애플','애플망고']
		}); */
		
		checkList.forEach((currentElement,index,array)=>{
			//각 체크박스의 체크상태 -> 전체선택 체크박스의 체크상태와 동일하게 적용
				currentElement.checked = obj.checked;
		});


		
		 
	 }
	 
	 function requiredChect(){
		 console.log(ch);	 
		/*  for(let i=0; i<checkList.length; i++) {
			 if(checkList[i].checked) {
				 ch = true;
				 f1();
			 }
			 if(ch == false) {
				 alert('1개이상');
				 return false;
			 }
		 } */
		 
		 
		 
		 /* if(checkList.length != 0) {
			 f1();
		 } else if(!checkList.checked){
			 
		 } */ 
	 }
	 
	 function f1(){
		resultarea = document.getElementById('result');
		//let hobby1 = document.getElementsByName('hobby'); //Object NodeList
		//let checkList = document.getElementsByName('hobby'); 
		let len = checkList.length; //배열로 취급하기때문에 배열의 길이 체크 항목이 6개라 6
		/* console.log(checkList);
		console.log(len); */
		
		let txt = "";
		for(let i=0; i<len; i++) { //checkbox의 모든 항목을 처음부터 끝까지 전부 살펴보겠다
			if(checkList[i].checked){ //항목이 선택되었다면. checked
				txt += checkList[i].value+"<br/>";
				resultarea.innerHTML = txt;
			}
		}
		//let hobby1 = document.getElementsByName('hobby')[0]; //Object HTMList
		//let hobby1 = document.getElementsByName('hobby')[0].name; // hobby
		//let hobby1 = document.getElementsByName('hobby')[1].id; // h1
		//let hobby1 = document.getElementsByName('hobby')[0].value; // game
		
		//defaultChecked는 기본값이 선택된 상태인지 확인, 선택이 되있는 상태면 true, 아니면 false, checked 속성이 있는지 없는지 구분
		//let hobby1 = document.getElementsByName('hobby')[0].defaultChecked; // false
		
		//check 하였다면 true, 아니면 false를 return
		//let hobby1 = document.getElementsByName('hobby')[0].checked; //true
		//resultarea.innerHTML = hobby1;
	} 
		
	/* $(function(){
		$('#btn1').click(function(){
			alert('test jqery');
		});
	}); */
	
	</script>
	
</body>
</html>