<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
	<%@ include file="../navbar.jsp"%>
	<%
		// 바뀌여 할 것 : 제목 , 내용, 작성일자
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		boardBean boardbean = new boardBean();
		boardbean = upload.getOneContext(context_number);
	%>
	
	<div class="container">
		<form name="title" method="POST" enctype="multipart/form-data" action="./updateProcess.jsp">
			<h2 class="text-center">게시글 정보 입력</h2>
			<br>
			<div class = "form-group row">
				<div class = "col-sm-3"></div>
				<label for="inputName" class="col-sm-2 col-form-label">게시글 번호</label>
				<div class="col-sm-4">
					<label><%=boardbean.getcontext_number()%></label>
					<input type = "hidden" name="context_number" value="<%=boardbean.getcontext_number() %>">
				</div>
			</div>
			<div class = "form-group row">
				<div class = "col-sm-3"></div>
				<label for="inputName" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-4">
					<label><%= boardbean.getuserid() %></label>
				</div>
			</div>
			<div class = "form-group row">
				<div class = "col-sm-3"></div>
				<label for="inputName" class="col-sm-2 col-form-label">게시글 제목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="title" value="<%=boardbean.gettitle()%>">
				</div>
			</div>
			<div class="form-group row">
			<div class = "col-sm-3"></div>
				<label for="inputDesc" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-4">
					<input type="textarea" class="form-control" name="contents" value="<%=boardbean.getcontents()%>">
				</div>
			</div>
			<div class="form-group row">
				<div class = "col-sm-3"></div>
				<label for="inputDesc" class="col-sm-2 col-form-label">파일업로드</label>
				<% if(boardbean.getfile() == null){ %>
				<div class="col-sm-4">
					<input type="file" class="form-control" name="file">
				</div>
				<% }else{ %>
				<div class="col-sm-4">
					<p>업로드 된 파일 : <%=boardbean.getfile() %></p>
					<input type="file" class="form-control" name="file">
				</div>
				<% } %>
			</div>
			<br>
			<div class="button-group text-center" style="margin-left: auto; margin-right:auto;">
				<button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
				<button type="submit" class="btn btn-light" style="background-color:#82C5E8">등록하기</button>	
			</div>
		</form>
	</div>
	
		<%@ include file="../footer.jsp"%>

	<% 
		//upload.deleteContext(context_number);
		//response.sendRedirect("board.jsp");
		
	%>

</body>
</html>