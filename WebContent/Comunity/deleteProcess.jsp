<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		boardBean bean = new boardBean();
		bean = upload.getOneContext(context_number);
		System.out.println("context_number = " + context_number);
		upload.deleteContext(context_number);
		response.sendRedirect("board.jsp");
	%>


</body>
</html>