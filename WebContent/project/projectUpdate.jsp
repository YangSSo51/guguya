<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guguya.projectBean" %>
<jsp:useBean id="project" class="guguya.projectBean"></jsp:useBean>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
<%@ include file="../navbar.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String msg;
	int user_no = account.getUserNo(id); // id와 account는 navbar에 있음
	int en_no = upload.getEnno(user_no); // 받아온 user_no으로 en_no 찾기
	
	String proj_id = request.getParameter("id");
	int proj_no = Integer.parseInt(proj_id);
	projectBean proj = upload.getProject(proj_no);// project 가져옴
	
	if(id == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<% 
	}	
	else if(account.getAuth(id) == 1){ // 개인이면 접근 불가
		msg = "권한이 필요합니다.";  %>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<%	}

%>

<div class="container">
<form name="projectForm" method="POST" enctype="multipart/form-data" action="/guguya/project/updateProcess.jsp">
	<h2 class="text-center">프로젝트 정보 입력</h2>
	<br>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">제목</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="proj_name" value="<%= proj.getProj_name()%>">
    </div>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label" >내용</label>
    <div class="col-sm-4">
      <textarea class="form-control" name="proj_desc" placeholder="프로젝트에 대한 설명을 적어주세요" rows="15" ><%= proj.getProj_desc()%></textarea>
    </div>
  </div>
  <div class="form-group row">
	<div class = "col-sm-3"></div>
	<label for="inputDesc" class="col-sm-1 col-form-label">파일업로드</label>
	<% if(proj.getFile() == null){ %>
		<div class="col-sm-4">
			<input type="file" class="form-control" name="file">
		</div>
	<% }else{ %>
		<div class="col-sm-4">
			<p>업로드 된 파일 : <%=proj.getFile() %></p>
			<input type="file" class="form-control" name="file">
			</div>	
	<% } %>
	</div>
 
    <input type="text" class="form-control" name="proj_no" value="<%= proj_no%>" style="display:none;">
  
	<br>
	<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8">등록하기</button>
	</div>
</form>
</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>