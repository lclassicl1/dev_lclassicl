<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/first.js"></script> <!-- external 방식으로 외부 script파일 실행 -->
<script>
	alert('head 태그 안의 internal방식'); /* internal 방식의 script 선언, 가장 먼저 실행된다 */
</script>
<title>Javascript 선언</title>
</head>
<body>
	<div id="i1"></div>
	<script>
		/* 스크립트 선언부
		id가 i1인 요소(div) 내부에 text를 출력하겠다. */
		//document객체.속성명=값
		//document.getElementById("i1");
		//alert(document.getElementById("i1")); /* internal 방식의 css 선언, 가장 먼저 실행된다 */
		
		//alert(document.getElementById("i1").id 는 id가 i1인 요소의 id값을 가져온다
		//alert(document.getElementById("i1").innerText); //id가 i1인 속성 안의 text를 가져오는 innerText
		document.getElementById("i1").innerText = "중요한건 꺾이지않는 마음";
		
		/* 자바에서의 클래스는
		참조변수명.필드명; 필드의 값을 가져오고
		참조변수명.필드명 = 값; 필드에 값을 설정하는데
		만약 private 선언되어있다면 직접 값을 대입하고 가져올수없으니 get으로 가져오고 set으로 설정해준다.
		
		자바스크립트에서는 참조변수가 없으니
		객체.속성명;
		객체.속성명 = 값;
		객체.메서드명(); 인 방식으로 처리한다.
		document.getElementById("i1"); document 객체의 getElementById id가 i1인 메서드를 호출
		document.getElementById("i1").innerText; document 객체의 getElementById 메서드를 호출하여 id가 i1인 속성의 text를 가져온다
		document.getElementById("i1").innerText = 값; document 객체의 getElementById 메서드를 호출하여 id가 i1인 속성의 text를 값으로 설정한다. */
	</script>

	<hr/>
	<span style="display:inline-block;background:pink;width:300px" onmouseover="alert('중꺾마')">span요소1</span> <!-- inline방식의 선언 -->
	<span style="display:inline-block;background:olive;width:300px" onmouseout="alert('데프트')">span요소2</span>
	<form action="" target="_blank" method="get">
	<input type="button" value="클릭(btn1)" name="btn1" id="btn1" onclick="alert('짜잔')"> <!-- id가 btn1인 버튼 생성 -->
	<button value="클릭(btn1)" name="btn1" id="btn1" onclick="alert('짜잔')">클릭(btn1)</button>
	</form>


	<hr/>
	<h1>자바스크립트 선언 j_js01.jsp</h1><br/>
	<p>web 문서의 동적효과, 유효성 검사 등에 사용된다</p>
	<xmp>
            
         *internal방식:html문서안에 head요소, body요소에 에 script선언
                    문법- <head>
                 <script>
              		코드작성
              		funtion 함수명(0개이상의 매개변수가 들어올수있다(parameter)){실현코드 작성부분} /* 가장 전통적인 함수 선언 문법 */
                 </script>
               </head>
               <body>
               <script>
              		코드작성
              		funtion 함수명(0개이상의 매개변수가 들어올수있다(parameter)){실현코드 작성부분} /* 가장 전통적인 함수 선언 문법 */
                 </script>
               </body>
                
         *external방식:html 문서 밖에서 별도의 jsp 문서
                             문법-<head>
                      <link rel = "stylesheet" href = "경로\파일명.css"> <!-- css와 동시에 head에 선언되어있을경우 css문서를 우선실행 -->
                      <script src="경로/파일명.js"></script>
                  </head>
         *inline 방식: 특정 요소에 script를 적용
                    문법 - <태그명 style="css속성명:값"></태그명>
       	    예시 - <태그명 onclick="함수명(매개변수리스트);"></태그명>
    </xmp>
	
</body>
</html>