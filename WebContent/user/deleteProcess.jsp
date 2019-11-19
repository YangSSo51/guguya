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
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	boolean result = account.deleteUser(id);
		String msg="회원삭제에 실패하였습니다.";
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="회원삭제에 성공하였습니다.";
		}
	%>
<script>
	<!--메세지 출력-->
	alert("<%=msg%>");	
	document.location.href="userList.jsp"
</script>
</body>
</html>