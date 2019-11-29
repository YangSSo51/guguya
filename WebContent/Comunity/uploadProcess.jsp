<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

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

		String msg = "게시글 등록 실패";
		String userid = (String) session.getAttribute("idKey");
		if (userid == null) {
			msg = "로그인이 필요합니다";
			response.sendRedirect("/guguya/user/login.jsp");
		} else {

			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String write_time = fm.format(date);
			
			// 경로 수정하기
			String saveDir = "C://Users/yts02/OneDrive/바탕 화면/web_upload";
			int maxSize = 1024*1024*100;
			String encType = "UTF-8";

			MultipartRequest multi
			= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String name = (String) files.nextElement();
			String original = multi.getOriginalFileName(name);
			File file = multi.getFile(name);
			
			String title = multi.getParameter("title");
			String contents = multi.getParameter("contents");
			
			System.out.println("title = " + title + " / file = " + original);
			System.out.println("lastnumber = " + upload.getLastContextNumber());
			bean.setcontext_number(upload.getLastContextNumber() + 1);
			bean.setuserid(userid);
			bean.settitle(title);
			bean.setcontents(contents);
			bean.setWrite_time(write_time);
			bean.setfile(original);
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