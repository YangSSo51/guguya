<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.boardBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya-uploadProcess</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		int context_number = -1;
		String msg = "게시글 등록 실패";
		String userid = (String) session.getAttribute("userID");
		if (userid == null) {
			msg = "로그인이 필요합니다";
			response.sendRedirect("login.jsp");
		} else {

			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String write_time = fm.format(date);
	%>
	<jsp:setProperty name="bean" property="title" />
	<jsp:setProperty name="bean" property="contents" />
	<%
		bean.setcontext_number(upload.getLastContextNumber() + 1);
			bean.setuserid(userid);
			bean.setWrite_time(write_time);
			boolean result = upload.boardUpload(bean);

			if (result) {
				msg = "게시글을 등록하였습니다";
			}
		}
	%>
	<script>
	//메세지 출력
	alert("<%=msg%>");
		document.location.href = "./board.jsp";
	</script>

</body>
</html>