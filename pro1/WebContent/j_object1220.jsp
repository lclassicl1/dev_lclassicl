<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>object</title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>object</h1>
	<hr/>
	<script >
		document.write('<pre>');
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
		
		document.writeln('firstName:'+person.firstName);
		document.writeln('person[age]:'+person["age"]);
		document.writeln('lastName:'+person.lastName);
		let full = person.fullInfo();
		document.writeln('full:'+full);
		document.writeln('lang:'+person.languases[0]+','+person.languases[1]);
		document.write('</pre>');
	</script>
	<pre>
		object 생성 문법
		const 변수명 = {
		name:value,
		name:문자열,
		name:숫자,
		name:논리형,
		name:배열,
		name:함수
		};
		
		객체 값가져오는 방법
		변수명.name;
		변수명['name'];
		변수명[name];
		
		*속성의 값이 함수라면 함수호출
		변수명.함수명();
	</pre>
	
	
</body>
</html>