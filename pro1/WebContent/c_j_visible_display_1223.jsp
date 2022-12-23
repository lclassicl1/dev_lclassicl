<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<style>
		.imgbox {
		  float: left;
		  text-align: center;
		  width: 120px;
		  border: 1px solid gray;
		  margin: 4px;
		  padding: 6px;
		}
		
		.clear {clear:both;} /* float:left나 right 된것을 해제 */
	</style>
	<script>
	function removeElement() {
			$('#imgbox1').css('display','none');
		  /* document.getElementById("imgbox1").style.display = "none"; */
		}
		
		function changeVisibility() {
		  document.getElementById("imgbox2").style.visibility = "hidden";
		}
		
		function resetElement() {
		  document.getElementById("imgbox1").style.display = "block";
		  document.getElementById("imgbox2").style.visibility = "visible";
		}	
	
	</script>
</head>
<body>
	<h2 id="clear">display:hidden과 visibility:hidden</h2>
	
	<div class="imgbox" id="imgbox1">jquert-toggle<br>
		  <img src="./images/chunsik.jpg" alt="Italy" style="width:100%" id="jq1">
		  <button onclick="$('#jq1').toggle();">jquert-toggle</button>
		  	<!-- 선택자#('id').toggle -->
		</div>
		
	<p><hr/></p>
	
	<div class="imgbox" id="imgbox1">Display 속성제어<br>
		  <img src="./images/chunsik.jpg" alt="Italy" style="width:100%">
		  <button onclick="removeElement()">Remove</button>
		</div>
		
		<div class="imgbox" id="imgbox2">visibility 속성제어<br>
		  <img src="./images/jjal.gif" alt="Lights" style="width:100%">
		  <button onclick="changeVisibility()">Hide</button>
		</div>
		
		<div class="imgbox">Box 3<br>
		  <img src="./images/goodgood.png" alt="Forest" style="width:100%">
		  <button onclick="resetElement()">Reset All</button>
	</div>
	
	<pre>
	
	display: none = 화면에 보이지않음, 영역차지X
	display:block | inline | inline-block 으로 하면화면에보인다
	
	visibility:hidden = 화면에보이지않음. 영역차지O
	visibility:visible으로하면 화면에 보인다
	
	
	css에서는 선택자{css:속성명 값;}
	#imgbox1 {display:none;}
	#imgbox1 {display:block;}
	#imgbox2 {visibility:hidden;}
	#imgbox2 {visibility:visible;}
	
	
	javascript에서 Style은 객체로취급
	요소.style.css속성명=값;
	
	document.getElementById("imgbox2").style.display = "none";
	document.getElementById("imgbox2").style.display = "block";
	document.getElementById("imgbox2").style.visibility = "hidden";
	document.getElementById("imgbox2").style.visibility = "visible";
	
	</pre>
</body>
</html>