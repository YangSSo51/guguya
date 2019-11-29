<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--세션 가져와서 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript">
	function encrypt(){ 
	       var passphrase="1234";
	       
	       //var encrypt = CryptoJS.AES.encrypt(pw2.toString(),passphrase);
	       
    	   document.getElementById("id").value=document.getElementById("id2").value;
			
    	   var pw=document.getElementById("pw");
    	   pw.value=document.getElementById("pw2").value;

           documentloginForm.submit();

	}
</script>
<style>
	.hidden{
		display:none;
	}
</style>
</head>
<body>
	<%@ include file="../navbar.jsp"%>
<div class="container">

<%
	//로그인 한 경우(세션으로 확인)
	if(id!=null){
%>

	<div class="text-center">
		<h3>마이페이지</h3>
		<h5><%=id %>님 환영합니다</h5>
		</a>
		<%
			int auth = account.getAuth(id);
		%>
		
		<%
				if(auth==0){
			%>
			<a href="userList.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">사용자정보 열람하기</button></a>	
			<%
				}
				else if(auth==1){	//개인
			%>
			<a href="/guguya/apply/myApplyList.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">지원목록확인</button></a>
		
			<a href="individual.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">정보 수정하기</button></a>
			<%
				}else{
			%>
			<a href="/guguya/project/myProjectList.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">내 프로젝트</button></a>
		
			<a href="enterprise.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">정보 수정하기</button></a>
		<%
				}
		%>
	</div>
<% 
	}
	//로그인 안한 경우
	else{
%>

<form method="POST">
	<h2 class="text-center">로그인</h2>
	<br>
  <div class="form-group row">
    <div class="col-sm-3"></div>
    <label for="inputId" class="col-sm-1 col-form-label">아이디</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="id2" name="id2" placeholder="ID">
    </div>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="pw2" name="pw2" placeholder="Password">
    </div>
  </div>
  <br>
</form>
<form name="loginForm" method="POST" action="loginProcess.jsp">
      <input class="hidden" type="text" class="form-control" id="id" name="id" placeholder="ID">
      <input  class="hidden" type="password" class="form-control" id="pw" name="pw" placeholder="Password" value="1234">
  	<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
  	<a href="signup.jsp">아직 회원이 아니신가요?</a>
  	<br>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8" onclick="encrypt()">로그인</button>
	</div>
</form>
<%
	}
%>
</div>

		<%@ include file="../footer.jsp"%>

</body>

</html>