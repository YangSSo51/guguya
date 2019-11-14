<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.userBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignupProcess</title>
</head>
<body>
	<jsp:setProperty property="*" name="bean"/>
	<%
		//signup함수를 실행했을 때의 결과값을 확인
		boolean result = account.signup(bean);
		String msg="회원가입에 실패하였습니다.";
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="회원가입에 성공하였습니다.";
		}
	%>
<script>
	//메세지 출력
	alert("<%=msg%>");
</script>
	<% response.sendRedirect("login.jsp"); %>
</body>
</html>