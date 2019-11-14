<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="guguya.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<table class="text-center">
<%@ include file="../navbar.jsp"%>

<%
	userMigrate mgr = new userMigrate();
	
	ArrayList<userBean> list = mgr.accountList();
	for(userBean bean:list){
%>
	<tr>
		<td><%=bean.getId() %></td>
		<td><%=bean.getPw() %></td>
		<td><%=bean.getEmail() %></td>
		<td><%=bean.getAuth() %></td>
	</tr>
<%
	}
%>
</table>
</div>

</body>
</html>