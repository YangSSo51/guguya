<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.userBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	html, body {

		height: 100%;

	}
	body{
		font-family: 'Do Hyeon', sans-serif;
	}
	.container{
		min-height: 100%;

		height: auto !important;

		height: 100%;

		margin: 0 auto -4em;
	}
	.container2{
		width: 100%;
    	padding-right: 30px;
    	padding-left: 30px;
    	margin-right: auto; 
   		margin-left: auto;
    }
	.collapse{
		margin-top:35px;
	}
	.right-nav{
		float:right;
	}
	.nav-link{
		font-size:25px;
	}
	.logo2{
		width:150px;
	}

	a:link{color:black;}
	a:visited{color:black;}
	a:hover{color:#82C5E8;text-decoration:none;}
	a:active{color:#82C5E8;}

s</style>
</head>
<body>
<div class="container2">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color:white!important; margin:20px;">
  <!-- 운영할때 경로 바꿔줘야함 -->
  <a class="navbar-brand" href="/guguya/home.jsp"><img class="logo2" src="/guguya/logo.png" width="150px"></a>

  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/guguya/project/projects.jsp">기업 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/guguya/portfolio/portfolio.jsp">개인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/guguya/Comunity/board.jsp">게시판</a>
      </li>
    </ul>
  </div>
  <div class="right-nav">
  <%
	//로그인 한 경우(세션으로 확인)
	if(id!=null){
   %>   
	<a href="/guguya/user/logout.jsp"><button type="button" class="btn btn-light" style="background-color:#FFC000">로그아웃</button></a>
	
		<%
			int auth = account.getAuth(id);
		%>
		
		<%
				if(auth==0){
			%>
			<a href="/guguya/user/userList.jsp"><button type="button" class="btn btn-light" style="background-color:#FFC000">사용자정보 열람하기</button></a>	
			<%
				}
				else if(auth==1){
			%>
			<a href="/guguya/user/individual.jsp"><button type="button" class="btn btn-light" style="background-color:#FFC000">정보 수정하기</button></a>
			<%
				}else{
			%>
			<a href="/guguya/user/enterprise.jsp"><button type="button" class="btn btn-light" style="background-color:#FFC000">정보 수정하기</button></a>
		<%
				}
		%>
	<%
	}
	else{
	%>
	<!-- 나중에 경로 수정해줘야함 -->
	<a href="/guguya/user/login.jsp"><button type="button" class="btn btn-light" id="hidden" style="background-color:#82C5E8">로그인</button></a>	  
	<a href="/guguya/user/signup.jsp"><button type="button" class="btn btn-light" id="hidden" style="background-color:#82C5E8">회원가입</button></a>
	<% 
	}
	%>

  </div>
</nav>
<hr>

</div>
<br>
<br>
</body>
</html>