<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>
<%@ page import="guguya.projectBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
</head>
<style>
	.label{
		border : 1px solid black;
	}
	.container1 {
    border: 1px solid #f0f0f0;
    border-radius: 20px;
    text-align: center;
    margin-left: 20%;
    margin-right: 20%;
    margin-top: 30px;
    padding: 20px;
}
</style>

<body>

<%@ include file="../navbar.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	int auth = account.getAuth(id); // 현재 로그인한 회원의 auth
	
	String getid = request.getParameter("id");
	int proj_id = Integer.parseInt(getid);

	projectBean pro = upload.getProject(proj_id); // 선택한 프로젝트 가져오기		
%>
<div class="container">
 <div class="container1">
 
  <table class="table" style="width:100%;">
  <tr>
  	<th scope="row">제목</th>
  	<td>  <%= pro.getProj_name() %><br> </td>
  </tr>
  <tr>
  	<th scope="row">작성날짜</th>
  	<td>  <%= pro.getWrite_time() %><br> </td>
  </tr>
  <tr>
  	<th scope="row">내용</th>
  	<td>  <%= pro.getProj_desc() %><br> </td>
  </tr>
  </table>
</div>

<% if(auth == 1){ // 개인일 때만 보이도록 %>
  <a href="/guguya/apply/applyProcess.jsp?id=<%=proj_id%>"><button type="button" class="btn btn-light float-right" style="background-color:#82C5E8">지원하기</button></a>

<% } %>  
</div>

</body>
		<%@ include file="../footer.jsp"%>

</html>