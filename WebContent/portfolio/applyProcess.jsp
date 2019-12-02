<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="port" class="guguya.portfolioMigrate"/>
<%@page import="guguya.projectMigrate" %>
<%@page import="guguya.projectBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="guguya.applyMigrate" %>
<%@page import="guguya.applyBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
<% 
	applyMigrate ap=new applyMigrate();
	int id=Integer.parseInt(request.getParameter("id"));
	int	proj=Integer.parseInt(request.getParameter("proj_no"));
	boolean result=ap.updateResult(id, proj);
	%>
	<script>
	document.location.href="/guguya/apply/applyUserList.jsp?id=<%=proj%>"
	</script>
</body>
</html>