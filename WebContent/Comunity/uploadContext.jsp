<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
	<%
		//System.out.println("글쓰기 페이지");
		String userid = (String)session.getAttribute("idKey");
		if(userid==null){
			response.sendRedirect("/guguya/user/login.jsp");
		}else{
		
	%>
	<div class="container">
		<form name="title" method="POST" enctype="multipart/form-data" action="uploadProcess.jsp">
			<h2 class="text-center">게시글 정보 입력</h2>
			<br>
			<div class = "form-group row">
				<div class = "col-sm-3"></div>
				<label for="inputName" class="col-sm-1 col-form-label">게시글 제목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="title">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputDesc" class="col-sm-1 col-form-label">내용</label>
				<div class="col-sm-4">
					<input type="textarea" class="form-control" name="contents" placeholder="게시글 내용">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputDesc" class="col-sm-1 col-form-label">파일업로드</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" name="file" placeholder="파일 올리기">
				</div>
			</div>
			<br>
			<div class="button-group text-center" style="margin-left: auto; margin-right:auto;">
				<button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
				<button type="submit" class="btn btn-light" style="background-color:#82C5E8">등록하기</button>	
			</div>
		</form>
	</div>
	<%} %>
</body>
</html>