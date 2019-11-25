<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="upload" class="guguya.commentMigrate"></jsp:useBean>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.commentBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		int context_number = -1;
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
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time = fm.format(date);
	%>
	<jsp:setProperty name="bean" property="context_number" />
	<jsp:setProperty name="bean" property="userid" />
	<jsp:setProperty name="bean" property="comment" />
	<%
		bean.setWrite_time(write_time);
		boolean result = upload.commentUpload(bean);

		if (result) {
			msg = "등록하였습니다";
			context_number = bean.getcontext_number();
		}
	%>
	<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="./detail.jsp?context_number=<%=context_number%>
		";
	</script>

</body>
</html>