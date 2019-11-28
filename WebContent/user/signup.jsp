<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="func" class="guguya.userMigrate"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>

<script type="text/javascript">	
   function validate() {
       var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       // 이메일이 적합한지 검사할 정규식

       var id = document.getElementById("id2");
       var pw = document.getElementById("pw2");
       var pwCheck = document.getElementById("pwCheck2");

       var email = document.getElementById("email2");
       
       /*암호화*/
       //var crypto=require('crypto');
       
       //var key="12345678";
       //var cipher =crypto.createCipher('aes192',key);
       //cipher.update(pw,'utf8','base64');
       //var cipheredOutput = cipher.final('base64');
       var passphrase="1234";
       
       var encrypt = CryptoJS.AES.encrypt(pw.toString(),passphrase);
       // ------------ 이메일 까지 -----------

       if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return;
       }
       
		
		/*if(!re.test(id)){
			alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력가능합니다");
			return;
		}*/
       if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return;
       }

       if(pw.value!=pwCheck.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.checkpw.value = "";
           join.checkpw.focus();
           return;
       }else{
    	   //crypto.createHash('sha512').update(pw).digest('base64')
    	   document.getElementById("pw").value=encrypt;
       }

       if(email.value=="") {
           alert("이메일을 입력해 주세요");
           email.focus();
           return;
       }

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return;
       }
       document.getElementById("id").value=id.value;
       document.getElementById("pw").value=pw.value;
       document.getElementById("email").value=email.value;
       document.getElementById("auth").value=document.getElementById("auth2").value;

       document.signupForm.submit();

   }
   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       //return false;
   }

    
</script>



<style>
	.hidden{
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
		//session.invalidate();
	%>
<%@ include file="../navbar.jsp" %>
<div class="container">
<form method="POST">
	<h2 class="text-center">회원가입</h2>
	<br>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputId" class="col-sm-1 col-form-label">아이디</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="id2" name="id2" placeholder="ID">
    </div>
    <div class="col-sm-4">
    	<button type="button" class="btn btn-light" style="background-color:#FFC000" id="idcheck" onClick="idCheck(this.form.id.value)">id중복 확인</button>
    </div>
  </div>
  <h1 id="idCheck">아이디 중복확인 필요</h1>
  <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="pw2" name="pw2" placeholder="Password">
    </div>
  </div>
    <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">비밀번호 확인</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="pwCheck2" name="pwCheck2" placeholder="Password">
    </div>
  </div>
    <div class="form-group row">
       <div class="col-sm-3"></div>
    <label for="inputEmail" class="col-sm-1 col-form-label">이메일</label>
    <div class="col-sm-4">
      <input type="email" class="form-control" id="email2" name="email2" placeholder="aaa@naver.com">
    </div>
  </div>
  <div class="form-group row">
     <div class="col-sm-3"></div>
  <label class="col-sm-1  col-form-label">
  	이용목적
  </label>
  <div class="col-sm-6">
	<div class="form-check">
	  <input class="form-check-input" type="radio" id="auth2" name="auth2" value="1" checked>
	  <label class="form-check-label" for="exampleRadios1">
	   개인
	  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="radio" id="auth2" name="auth2" value="2">
	  <label class="form-check-label" for="exampleRadios2">
	  기업
	  </label>
	</div>
	</div>
	</div>
	<br>
</form>
<form name="signupForm" method="POST" action="signupProcess.jsp">

      <input type="text" class="hidden" id="id" name="id" placeholder="ID">
      <label for="inputPassword" class="hidden">비밀번호</label>
      <input type="password" class="hidden" id="pw" name="pw" placeholder="Password">
      <input type="password" class="hidden" id="pwCheck" name="pwCheck" placeholder="Password">
      <input type="email" class="hidden" id="email" name="email" placeholder="aaa@naver.com">

	  <input class="hidden" type="radio" id="auth" name="auth" value="1" checked>
	  <input class="hidden" type="radio" id="auth" name="auth" value="2">
		<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <button type="button" class="btn btn-light" style="background-color:#82C5E8" onclick="validate();">회원가입</button>
	  <br>
	  <br>
	  <br>
	</div>
</form>
</div>
		<%@ include file="../footer.jsp"%>

</body>
</html>