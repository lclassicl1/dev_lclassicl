<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP date</title>
</head>
<body>
	<h1>JSP date</h1>
	<p id="date"></p>
		<script>
			document.write("<pre>");
			/* 파라미터가 없는 생성자를 이용한 날짜 객체 생성 */
			let today = new Date();
			document.writeln('new Date() ='+today);
			
			document.write('getFullYear=>'+today.getFullYear()+'<br/>');
			document.write('getMonth=>'+(today.getMonth()+1)+'<br/>'); /* 1월이 숫자0으로 나타냄 따라서 0~11까지가 사이의 수가 나옴 따라서 +1을 해서 처리 */
			document.write('getDate=>'+today.getDate()+'<br/>');
			
			let month = today.getDay();
			let stringmonth;
			switch(month) {
				case 0:
					stringmonth = '일요일';
					break;
				case 1:
					stringmonth = '월요일';
					break;
				case 2:
					stringmonth = '화요일';
					break;
				case 3:
					stringmonth = '수요일';
					break;
				case 4:
					stringmonth = '목요일';
					break;
				case 5:
					stringmonth = '금요일';
					break;
				case 6:
					stringmonth = '토요일';
					break;
					
			}
			document.write('getDay=>'+stringmonth+'<br/>'); /* day도 일요일부터 0으로나타냄 0~6까지의 수가 나옴 따라서 switch문으로 한글화*/
			document.write('getHours=>'+today.getHours()+'<br/>');
			document.write('getMinutes=>'+today.getMinutes()+'<br/>');
			document.write('getSeconds=>'+today.getSeconds()+'<br/>');
			document.write('getMilliseconds=>'+today.getMilliseconds()+'<br/>');
			document.write('getTime=>'+today.getTime()+'<br/>');
			
			document.write('<hr/>');
			
			/* 파라미터가 있는 생성자를 이용한 날짜 객체 생성 */
			let theDay = new Date('December 17, 2020 03:24:59');
			document.write('new Date()='+theDay+'<br/>')
			
			document.write('<hr/>');
			/* 파라미터가 있는 생성자를 이용한 날짜 객체 생성 */
			let theDay2 = new Date(99,8);
			document.writeln('new Date(99,8)='+theDay2)
			theDay2.setYear(86); /* set메소드 이용하여 년도만 95로 set */
			document.writeln('setYear(86)='+theDay2)
			theDay2.setFullYear(91); /* FullYear는 4자리 숫자를 대입해야하는데 2자리만 넣어봄 1991 or 2091이 나올것으로예상했으나 0091이출력*/
			document.writeln('setFullYear(91)='+theDay2)
			document.write("</pre>");
		</script>
</body>
</html>