<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>
<%@ page import="guguya.projectBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
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
	int user_no = account.getUserNo(id); // user_no
	String getid = request.getParameter("id");
	int proj_id = Integer.parseInt(getid); // proj_no

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
  	<th scop="row">작성자</th>
  	<td><%= upload.getEnterpiseName(pro.getEn_no())%></td>
  </tr>
  <tr>
  	<th scope="row">작성날짜</th>
  	<td>  <%= pro.getWrite_time() %><br> </td>
  </tr>
  <tr>
  	<th scope="row">내용</th>
  	<td>  <%= pro.getProj_desc() %><br> </td>
  </tr>
  <tr>
  	<th scope="row">파일</th>
	<% 
		if(pro.getFile() != null){
	%>
	<td><label><a href="javascript:return false;" onclick="location.href='/guguya/community/fileDownload.jsp?filename=<%=pro.getFile()%>'" download><%=pro.getFile() %></a></label></td>
	<% }else{ %>
	<td><label for="inputName" class="col-sm-12 col-form-label">파일을 업로드하지 않았습니다</label></td>
	<% } %>
	</th>
  </tr>
  </table>
</div>

<% if(auth == 1){ // 개인일 때만 보이도록 %>
  <a href="/guguya/apply/applyProcess.jsp?id=<%=proj_id%>"><button type="button" class="btn btn-light float-right" style="background-color:#82C5E8">지원하기</button></a>
<% }else if(auth == 2){ // 기업일 때는
	if(pro.getEn_no() == upload.getEnno(user_no)){
		%>
		<a href="/guguya/project/projectUpdate.jsp?id=<%=proj_id%>"><button type="button" class="btn btn-light float-right" style="background-color:#82C5E8">수정</button></a>
		<a href="/guguya/project/projectDelete.jsp?id=<%=proj_id%>"><button type="button" class="btn btn-light float-right" style="background-color:#82C5E8">삭제</button></a>
		<%
	}
} %>  
</div>

</body>
		<%@ include file="../footer.jsp"%>

</html>