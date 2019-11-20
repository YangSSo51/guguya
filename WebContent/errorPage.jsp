<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.container{
		text-align: center;
	}
	.error{
		width:80%;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
var change=setInterval(gogo,150); /*0.15초간격으로 호출*/
var num=$(".error").attr("src").substr(-5,1); /*이미지 속성 명 중에서 숫자부분*/
function gogo(){
	if(num>=3) {	//이미지 3개
		num=0;
		//clearInterval(change)
		} 
	else{
		num++; 
		$(".error").attr("src","/guguya/errorpage"+num+".JPG")} /*이미지명에서 숫자를 증가하여 파일명변경*/
	}
});
</script>

<body style="background-color:#82C5E8" onload="runBGSlideShow()">

<div class="container">
	<img class="error" src="/guguya/errorpage1.JPG">
	
</div>
</body>
</html>