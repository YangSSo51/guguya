<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션의 경우 jsp내부에서는 동작이 안되므로 주의할것 -->
<jsp:useBean id="port" class="guguya.portfolioMigrate"/>
<jsp:useBean id="project" class="guguya.projectMigrate"/>

<%@page import="java.util.ArrayList" %>
<%@page import="guguya.projectMigrate" %>
<%@page import="guguya.projectBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserList</title>
</head>
<body>
<div class="container">
<table style="width:100%">
<%@ include file="../navbar.jsp"%>
	<tr>
		<th>번호</th>
		<th>프로젝트</th>
	</tr>
<%
	projectMigrate mgr = new projectMigrate();
	int user_no=account.getUserNo(id);
	
	//userBean의 리스트형태로 회원정보를 가져옴
	ArrayList<projectBean> list = mgr.myProjectList(project.getEnno(user_no));	//만들어
		for(projectBean bean2:list){	//for문
	%>
		<tr>
			<td><%=bean2.getProj_no() %></td>
			<td><a href="/guguya/project/project.jsp?id=<%=bean2.getProj_no() %>"><%=bean2.getProj_name() %></a></td>
		<td>
		<a href="/guguya/apply/applyUserList.jsp?id=<%=bean2.getProj_no() %>">
		<button type="button" class="btn btn-light" id="hidden" style="background-color:#82C5E8">지원자 보러가기</button>
		</a>
		</td>
		</tr>
		<%
		}//for문
		%>
</table>
	

<script>

</script>

</div>

</body>
</html>