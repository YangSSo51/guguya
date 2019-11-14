<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 자바스크립트 추가하기-check -->
<style>
	#hidden{
		display:none;
	}
</style>
</head>
<body>
	<%@ include file="../navbar.jsp"%>
<%
	if(id!=null){
%>
	<div class="text-center">
		<h4><%=id %>님 환영합니다</h4>
		<a href="logout.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">로그아웃</button>
		</a>
	</div>
<% 
	}
	else{
%>

<div class="container">
<form name="loginForm" method="POST" action="loginProcess.jsp">
	<h2 class="text-center">로그인</h2>
	<br>
  <div class="form-group row">
    <div class="col-sm-3"></div>
    <label for="inputId" class="col-sm-1 col-form-label">아이디</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="id" placeholder="ID">
    </div>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="pw" placeholder="Password">
    </div>
  </div>
  <br>
  	<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="submit" class="btn btn-light" style="background-color:#A1A6A0">로그인</button>
	  <a href="signup.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">회원가입</button>
	  </a>
	</div>
</form>
</div>
<%
	}
%>
</body>
</html>