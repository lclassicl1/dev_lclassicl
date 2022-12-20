<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>for test</title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>Javascipt 반복문(for문)</h1>
	<pre>
		for - 코드블록을 여러번 반복 	
				for(초기;조건;증감) {}
		for/in - 객체의 속성을 반복 (자바에서 향상된 for문과 비슷하다고 생각하면됨)
				for(변수 in 객체){} 
		for/of - 반복 가능한 객체의 값을 반복	
				for(변수 of 객체) {}
				-Array(배열), Dom컬렉션(HTMLcollection, NodeList) 등
		while - 지정된 조건이 참인동안 코드블럭을 반복 while(조건) {}
		do/while - 한번 무조건 수행 후 그 이후에 조건이 만족하는동안 코드블록을 반복 do{} while(조건식){}
	</pre>
	<hr/>
	<p id="demo"></p>
	<p id="demo1"></p>
	<p id="demo2"></p>
	<p id="demo3"></p>
	<p id="demo4">for of문 이용 예정</p>
	<p id="demo5">객체 for in문 이용 예정</p>
	<p id="demo6">객체 for of문은 객체타입에서 사용 불가</p>
	<hr/>
	<script>
		document.write('<pre>');
		
		const cars = [
			'hyundai',
			'chevolet',
			'kia'
		];
		
		
		
		document.writeln('cars='+cars);
		document.writeln('cars.reverse(역순정렬)='+cars.reverse()); //역순정렬
		document.writeln('cars.length='+cars.length);
		document.writeln('cars.sort(오름차순정렬)='+cars.sort()); //오름차순 정렬
		document.writeln('cars.reverse(역순정렬)='+cars.reverse()); //역순정렬
		
		document.write('<hr/>');
		
		const points = [40, 100, 1, 5, 25, 10];
		
		document.writeln('points='+points); //40,100,1,5,25,10
		document.writeln('points.reverse(역순정렬)='+points.reverse()); //역순정렬 10 25 5 1 100 40
		document.writeln('points.length='+points.length); //6
		points.sort(function(a,b){
			return a-b;	
		}); //정렬
		document.writeln('points.sort(오름차순후정렬)='+points);
		
		points.sort(function(a,b){
			return b-a;	
		}); //정렬
		
		 document.writeln('points.reverse(내림차순후정렬)='+points);
		
		document.writeln('points.sort(오름차순정렬)='+points.sort()); //오름차순 정렬 1 5 10 25 40 100 //예상답변과 틀림, 숫자로 읽은게 아니고 앞글자를 기준으로 오름차순 정렬
		
		document.writeln('points.reverse(역순정렬)='+points.reverse()); //역순정렬 100 40 25 10 5 1
		document.write('<hr/>');
		
		
		const person = {
				firstName:"jobs",
				lastName:'steve',
				age:30,
				isLikeDog:true,
				height:185.9,
				languases:['html','java','javascript','db'],
				fullInfo:function(){
					return '전체이름:'+this.firstName+","+this.lastName;
				}
			};
		
		
		/* let text5 = '<ul>--------객체 for of / 객체에서는 사용 불가';

		for(let myPerson of person) { // 
			text5 += '<li>객체타입일때는 for of 사용불가</li>';
		}
		text5 += '</ul>'
		
		document.getElementById('demo6').innerHTML = text5; */
		
				
		
		
		let text4 = '<ul>--------객체 for in';

		for(let myPerson in person) { //myPerson이 배열일때는 index 번호가 나왔는데 객체일경우 Name이 출력된다.
			text4 += '<li>'+person[myPerson]+'</li>';
		}
		text4 += '</ul>'
		
		document.getElementById('demo5').innerHTML = text4;
		
		const fruits = ['Banana','Orange','Apple','Mango'];
		
		document.write('<hr/>');
		
		document.write('---------------forin문-------------------'); //myfruit를 출력하니 index번호가 나옴. 배열의 요소가 출력되는것이 아닌 index 번호가 출력
		//배열 종류에서는 잘 사용하지 않는다.
		let text2 = '<ul>--------for in';

		for(let myFruit in fruits) {
			text2 += '<li>'+fruits[myFruit]+'</li>';
		}
		text2 += '</ul>'
		
		document.getElementById('demo2').innerHTML = text2;
		
		//----------------------------------아래는 for of 문
		
		let text3 = '<ul>--------for of';

		for(let fruit of fruits) {
			text3 += '<li>'+fruit+'</li>';
		}
		text3 += '</ul>'
		
		document.getElementById('demo4').innerHTML = text3;
		
		/* function(values){
			text2 += '<li'>+values+'</li'>;
		}
		
		
		
		
		document.write('---------------forEach문');
		
		let text = '<ul>';
		let flen = fruits.length;
		
		fruits.forEach(myfunction) {
			
		}
		
		text += '</ul>'
		
		function(values){
			text += '<li'>+values+'</li'>;
		}
		
		
		
		document.write('---------------전통 for문');
		
		
		let text = '<ul>';
		
		for(let i=0; i<fruits.length; i++) {
			
		} */
		
		
		
		
		document.write('</pre>');
	</script>
</body>
</html>