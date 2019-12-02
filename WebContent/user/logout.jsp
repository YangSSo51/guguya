<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
	<%
		//세션에서 아이디정보 삭제
		session.removeAttribute("idKey");
		session.invalidate();
		response.sendRedirect("login.jsp");
	%>

</body>
</html>