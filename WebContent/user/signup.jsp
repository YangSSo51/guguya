<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<style>
	#hidden{
		display:none;
	}
</style>
<script type="text/javascript">
	function idCheck(id){
		if(id==""){
			alert("아이디를 입력하세요");
			document.signupForm.id.focus();
			return;
		}
		var x=(window.screen.width-300)/2;
		var y=(window.screen.height-150)/2;
		url="idCheck.jsp?id="+id;
		window.open(url,"idCheck","width=300,height=150,left="+x+",top="+y)
	}
	
</script>
</head>
<body>
	<%
		//세션에서 아이디정보 삭제
		session.removeAttribute("idKey");
		session.invalidate();
	%>

<%@ include file="../navbar.jsp"%>
<div class="container">
<form name="signupForm" method="POST" action="signupProcess.jsp">
	<h2 class="text-center">회원가입</h2>
	<br>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputId" class="col-sm-1 col-form-label">아이디</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" name="id" placeholder="ID">
    </div>
    <div class="col-sm-4">
    	<button type="button" class="btn btn-light" style="background-color:#FFC000" onClick="idCheck(this.form.id.value)">id중복 확인</button>
    </div>
  </div>
  <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="pw" placeholder="Password">
    </div>
  </div>
    <div class="form-group row">
       <div class="col-sm-3"></div>
    <label for="inputEmail" class="col-sm-1 col-form-label">이메일</label>
    <div class="col-sm-4">
      <input type="email" class="form-control" name="email" placeholder="aaa@naver.com">
    </div>
  </div>
  <div class="form-group row">
     <div class="col-sm-3"></div>
  <label class="col-sm-1  col-form-label">
  	이용목적
  </label>
  <div class="col-sm-6">
	<div class="form-check">
	  <input class="form-check-input" type="radio" name="auth" value="1" checked>
	  <label class="form-check-label" for="exampleRadios1">
	   개인
	  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="radio" name="auth" value="2">
	  <label class="form-check-label" for="exampleRadios2">
	  기업
	  </label>
	</div>
	</div>
	</div>
	<br>
		<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <a href="login.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">로그인</button>
	  </a>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8">회원가입</button>
	</div>
</form>
</div>
</body>
</html>