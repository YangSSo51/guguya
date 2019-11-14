<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.userBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="*" name="bean"/>
	<%
		boolean result = account.signup(bean);
		String msg = bean.getId();
		if(result){
			msg="회원가입에 성공하였습니다.";
		}
	%>
<script>
	alert("<%=msg%>");
</script>
	<% response.sendRedirect("login.jsp"); %>
</body>
</html>