<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
		//form에서 파라미터 가져와서 넘겨줌
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String msg = "로그인에 실패하였습니다.";
		boolean result = account.login(id,pw);
		
		
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="로그인에 성공했습니다.";
			session.setAttribute("idKey",id);	//성공하면 세션에 아이디 저장
		}
	%>
<script>
	<!--메세지 출력-->
	alert("<%=msg%>");	
	document.location.href="login.jsp"
</script>
</body>
</html>