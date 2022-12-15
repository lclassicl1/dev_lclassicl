<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<style></style>
	<script></script>
</head>
<body>
	<h1>jsp에서 변수선언(variable)</h1>
		<pre>
			var 변수명; => 재선언 가능, 문제가 생길 요지가 다수
			let 변수명; => 재선언 불가
			const 변수명; => 값 재할당불가, 재선언도 불가 constant는 자바의 final 같은 상수. 초기값 할당 이후에는 재할당이 불가능하다
			(아무런 선언 없이X) 변수명;
			데이터 타입을 사용하지 않기때문에 "" 큰따옴표나 ''작은따옴표로 구별해주면 문자열 취급을 한다.
			
			<strong><참고>hoisting
			자바 스크립트에서는 인터프리터가 코드를 실행하기전 변수(함수)선언을 코드의 최상단으로 끌어올리는것과 같은 효과를 발생된다
			선언만 끌여올려지고, 할당은 끌어올려지지않는다. 실제로 코드가 끌어올려지는것은 아니다, 내부적으로 작동하는것이다.
			<em>var 변수선언</em>에서만 발생하며 let과 const에서는 발생하지 않는다.</Strong>
			
			
		</pre>
		<hr/>
		<script>
			document.write("<pre>");
			/* 변수앞에 아무런 선언 없이 변수명만 선언하는 type */
			a=10;
			b=90;
			c=a+b;
			document.writeln("c="+c);
			document.writeln("<hr/>");
			
			/* var 변수 선언 type */
			var a1=10;
			var b1;
			document.writeln("var b1="+b1); //undifined
			var c1=a1+b1; // NaN(Not a Number)
			b1 = 20; //b1이 연산식보다 늦게 선언되었으므로 undifined와 NaN이 연산식에서 발생한다 jSP에서 변수는 자동초기화되지않는다
			document.writeln("c1="+c1);
			var b1; //변수 재선언 원래는 duplicate 에러가 발생해야하지만 jsp에서는 에러없이 정상으로 판독. var 변수만 가능
			document.writeln("var b1="+b1); 
			document.writeln("<hr/>");
			/* let 변수 선언 방식 */
			
			let a2=30;
			let b2;
			document.writeln("let b2="+b2); //60
			let c2=a2+b2;
			b2=60;
			//let b2; 재선언 불가 에러 Uncaught SyntaxError: Identifier 'b2' has already been declared
			document.writeln("c2="+c2);
			document.writeln("<hr/>");
			
			/* const 방식 선언  자바의 final 변수와 같은 상수라고 이해하면 될거같다*/
			
			const a3=40;
			const b3=80;
			//b3=500; //값 재할당 불가 에러:Uncaught TypeError: Assignment to constant variable.
			//const b3; //재 선언도 불가
			const c3=a3+b3;
			document.writeln("c3="+c3);
			document.writeln("<hr/>");
			document.write("</pre>");
		</script>
		<xmp>
			공백은 &nbsp;
			> &lt;
			< &gt;
			copyright &copy;
			"" double quotation mark &quot;
			'' single quotation mark &apos;
		</xmp>
		a<10<br/>
		a%lt;10 
		같은표현
</body>
</html>