<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	.right-nav{
		float:right;
	}
	.logo{
		width:150px;
		margin-bottom:30px;
	}
</style>
</head>
<body>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color:white!important; margin:20px;">
  <!-- 운영할때 경로 바꿔줘야함 -->
  <a class="navbar-brand" href="http://localhost:8080/guguya/home.jsp"><img class="logo" src="logo.png" width="150px"></a>

  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">기업 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">개인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">게시판</a>
      </li>
    </ul>
  </div>
  <div class="right-nav">
		<a href="user/login.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">로그인</button>
		</a>	  
		<a href="user/signup.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">회원가입</button>
		</a>
  </div>
</nav>
</div>
<hr>
<br>
<br>
</body>
</html>