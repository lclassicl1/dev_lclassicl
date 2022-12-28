<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
div,p,span{color:white;}
div {
    background-color: #ccc;
    padding: 20px;
    display: block;
}

p {
    background-color: #aaa;
    padding: 20px;
    display: block;
}

span {
    background-color: #888;
    padding: 20px;
    display: block;
}

section {
    background-color: #4477AA;
    padding: 0 10px 30px 20px;
    margin: 50px 0 0 0;
}

section:before {
    background-color: #114477;
    padding: 5px;
    margin: 0 0 0 -20px;
    border-bottom: 2px solid #002244;
    border-bottom-right-radius: 5px;
    font-size: 12px;
    font-weight: bold;
    color: white;
    content:"결과 콘솔";
}

a {
    background-color: #888;
    padding: 20px;
    display: block;
}

</style>
<script>
$(function(){
	//DIV 영역에 클릭 이벤트 설정
	$("#div_").on("click",function(event){
	    $("#console").append("<br>DIV 클릭");
	});

	//P 영역에 클릭 이벤트 설정
	$("#p_").on("click",function(event){
	    $("#console").append("<br>P 클릭");
	});

	//SPAN 영역에 클릭 이벤트 설정
	$("#span_").on("click",function(event){
	    $("#console").append("<br>SPAN 클릭");
	});
	
	$("#a1_").on("click",function(event){
	    $("#console").append("<br>a 클릭");
	    event.preventDefault();
	});
});
</script>
</head>
<body>
<div id="div_">
    DIV영역
    <p id="p_">
        P영역
        <a href="http://www.google.com" target="_blank" id="a1_">a영역</a>
    </p>
</div>

<section id="console"><br></section>
<pre>
	*이벤트 전파
	-여기에서는 span 요소 클릭하면 부모 p요소, 부모 div 요소도 같이 click 이벤트 발생
	
	*event.stopPropagation() : 이벤트 버블링을 차단 => 상위요소로 전달을 차단한다
	event.stopPropagation()	Prevents the event from bubbling up the DOM tree, preventing any parent handlers from being notified of the event
	
	*event.preventDefault() : 기본 동작을 차단한다
	*event.preventDefault()	Prevents the default action of the event
</pre>
</body>
</html>