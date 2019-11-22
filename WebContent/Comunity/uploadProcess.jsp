<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.boardBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		int user_no, context_number = -1;
		String write_time;
		String msg = "등록 실패";
		String userid = "kkr";
		/*
		(String)session.getAttribute("idKey");
		if(userid==null){
			msg = "로그인이 필요합니다";
			response.sendRedirect("login.jsp");
		}else{
			*/
			Date date = new Date();
			write_time = date.toString();
			
		%>
	<jsp:setProperty name="bean" property="title" />
	<jsp:setProperty name="bean" property="contents" />
	<%
			bean.setcontext_number(upload.getLastContextNumber()+1);
			bean.setuserid(userid);
			bean.setWrite_time(write_time);
			boolean result = upload.boardUpload(bean);
			
			if(result){
				msg="등록하였습니다";
			}
		
		%>
	<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="./welcome.jsp";
</script>

</body>
</html>