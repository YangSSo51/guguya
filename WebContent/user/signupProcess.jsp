<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.userBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
	<jsp:setProperty property="*" name="bean"/>
	<%
		request.setCharacterEncoding("utf-8");
		//signup함수를 실행했을 때의 결과값을 확인
		boolean result = account.signup(bean);
		String msg="회원가입에 실패하였습니다.";
		//성공 여부에 따라 메세지 출력
		if(result){
			int user_no = account.getUserNo(request.getParameter("id"));
			msg="회원가입에 성공하였습니다.";
			if(Integer.parseInt(request.getParameter("auth"))==1){	//개인으로 회원가입한 경우
				account.insertIndividual(user_no);
			}else{
				account.insertEnterprise(user_no);		//기업으로 회원가입하는 경우
			}
		}
	%>
<script>
	<!--메세지 출력-->
	alert("<%=msg%>");	
	document.location.href="login.jsp"
</script>
		<%@ include file="../footer.jsp"%>

</body>
</html>