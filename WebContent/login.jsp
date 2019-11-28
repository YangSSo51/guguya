
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%@ include file="./navbar.jsp"%>
	<!-- 로그인 회원가입 -->
	<ul class="nav navber-nav">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./login.jsp">로그인</a> <a
					class="navbar-brand" href="./login.jsp">회원가입</a>
			</div>
		</div>
	</ul>
	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">

				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="loginProcess.jsp">
					<h3 style="text-align: center;">로그인화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	<%@ include file="./footer.jsp"%>

</body>

</html>



출처: https://tbbrother.tistory.com/66?category=308532 [밑끝없로그]
