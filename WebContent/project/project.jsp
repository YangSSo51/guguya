<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>
<%@ page import="guguya.projectBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../navbar.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String getid = request.getParameter("id");
	int proj_id = Integer.parseInt(getid);

	projectBean pro = upload.getProject(proj_id);		
%>
<div class="container">
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">프로젝트 명</label>
   <%= pro.getProj_name() %><br>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label">작성날짜</label>
    <%= pro.getWrite_time() %><br>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label">내용</label>
    <%= pro.getProj_desc() %><br>
  </div>
</div>
</body>
</html>