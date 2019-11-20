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
	<tr>
		<th>프로젝트 명</th>
		<th>작성자</th>
		<th>작성날짜</th>
	</tr>
<%
	//userBean의 리스트형태로 프로젝트 정보를 가져옴
	ArrayList<projectBean> list = upload.projectList();
	int en_no;
	for(int i = 0; i < list.size(); i++){	//for문
		projectBean pro = list.get(i);
		en_no = pro.getEn_no();	// 작성자의 en_no을 가지고		
%>
	<tr>
		<td><%= pro.getProj_name()%></td>
		<td><%= upload.getEnterpiseName(en_no)%></td>
		<td><%= pro.getWrite_time()%></td>
	</tr>
	
<% } %>
</table>


</div>
</body>
</html>