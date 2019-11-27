<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="guguya.applyBean" %>
<%@ page import="guguya.projectBean" %>
<jsp:useBean id="apply" class="guguya.applyMigrate"/>
<jsp:useBean id="port" class="guguya.portfolioMigrate"/>
<jsp:useBean id="project" class="guguya.projectMigrate"/>

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
		<th>지원 상태</th>
	</tr>
<%
	/* 개인이 자신이 지원한 프로젝트 목록을 확인할 수 있는 페이지  */
	int user_no = account.getUserNo(id);
	int in_no = port.getInno(user_no);
	ArrayList<applyBean> list = apply.myApplyList(in_no);	//만들어
		for(applyBean bean2:list){	//for문
			projectBean proj = project.getProject(bean2.getProj_no());
	%>
		<tr>
			<td><a href="/guguya/project/project.jsp?id=<%=bean2.getProj_no() %>"><%=proj.getProj_name()%></a></td>
			<td><%=bean2.getResult() %></td>
		</tr>
<%
		}//for문
	
%>
</table>
</div>

</body>
</html>