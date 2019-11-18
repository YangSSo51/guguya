<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.enterpriseBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignupProcess</title>
</head>
<body>
	<jsp:setProperty property="*" name="bean"/>
	<%
		request.setCharacterEncoding("UTF-8");
		//signup함수를 실행했을 때의 결과값을 확인
		boolean result = account.updateEnterprise(bean);
		String msg="정보 수정에 실패하였습니다.";
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="정보 수정에 성공하였습니다.";
		}
	%>
<script>
	//메세지 출력
	alert("<%=msg%>");
</script>
	<% response.sendRedirect("login.jsp"); %>
</body>
</html>