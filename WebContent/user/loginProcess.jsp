<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String msg = "로그인에 실패하였습니다.";
		boolean result = account.login(id,pw);
		
		if(result){
			msg="로그인에 성공했습니다.";
			session.setAttribute("idKey",id);
		}
	%>
<script>
	alert("<%=msg%>");
	document.location.href="login.jsp"
</script>
</body>
</html>