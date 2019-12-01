<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

		String msg = "댓글 등록 실패";
		String userid = (String)session.getAttribute("idKey");
		if(userid==null){
			msg = "로그인이 필요합니다";
			response.sendRedirect("/guguya/user/login.jsp");
		}else{
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String write_time = fm.format(date);
	%>
	<jsp:setProperty name="bean" property="context_number" />
	<jsp:setProperty name="bean" property="comment" />
	<%
		bean.setcomment_number(upload.getLastCommentNumber(bean.getcontext_number()) + 1);
		bean.setWrite_time(write_time);
		bean.setuserid(userid);
		boolean result = upload.commentUpload(bean);

		if (result) {
			msg = "댓글을 등록하였습니다";
		}
		}
	%>
	<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="./detail.jsp?context_number=<%=bean.getcontext_number()%>";
	</script>

</body>
</html>