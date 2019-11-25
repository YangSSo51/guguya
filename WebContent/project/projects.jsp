<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>
<jsp:useBean id="project" class="guguya.projectBean"></jsp:useBean>    

<%@ page import="guguya.projectBean" %>
<%@ page import="guguya.projectMigrate" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<table style="width:100%">
<%@ include file="../navbar.jsp"%>

<%
	// 기업의 프로젝트 리스트는 로그인한 사용자만 볼 수 있음
	String msg = "에에";
	if(id == null){
		msg = "로그인이 필요합니다.";
%>
<script> // alert 메세지
	alert("<%=msg%>");
	document.location.href="/guguya/user/login.jsp";
</script>
<% 
}	
%>
	<tr>
		<th>프로젝트 명</th>
		<th>작성자</th>
		<th>작성날짜</th>
	</tr>
<%
	int user_no, en_no = -1;

	
	//userBean의 리스트형태로 프로젝트 정보를 가져옴
	ArrayList<projectBean> list = upload.projectList();
	for(int i = 0; i < list.size(); i++){	//for문
		projectBean pro = list.get(i);
		en_no = pro.getEn_no();	// 작성자의 en_no을 가지고		
%>
	<tr>
		<td><a href="/guguya/project/project.jsp?id=<%= pro.getProj_no() %>"><%= pro.getProj_name()%></a></td>
		<td><%= upload.getEnterpiseName(en_no)%></td>
		<td><%= pro.getWrite_time()%></td>
	</tr>
	
<% } %>
</table>
<div class="right-nav">
<a href="projectUpload.jsp"><button type="button" class="btn btn-light" style="background-color:#82C5E8">프로젝트 등록하기</button></a>
</div>

</div>
</body>
</html>