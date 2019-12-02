<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Do Hyeon', sans-serif;
	}
</style>
</head>
<body>
<div align="center">
	<br>
	<br>
	<%
		String id = request.getParameter("id");
		boolean result = account.idCheck(id);
	%>
	<%
		if(result){
			out.println(id+"는 이미 존재하는 id입니다.");
		}else{
			out.println(id+"는 사용가능한 id입니다.");
		}
		
	%>
	<br>
	<br>
	<a href="#" onclick="self.close()"> <button type="button" class="btn btn-light" style="background-color:#FFC000" >닫기</button></a>
</div>
</body>
</html>