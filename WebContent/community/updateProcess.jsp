<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>


<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
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
		String msg = "수정 실패";

		// 바껴야 할 것 : 제목 , 내용, 작성일자
		//int context_number = Integer.parseInt(request.getParameter("context_number"));

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String write_time = fm.format(date);
		
		// 경로 수정하기
		String saveDir = "C://Users/mayso/upload/";
		int maxSize = 1024*1024*100;
		String encType = "UTF-8";

		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
					
		Enumeration files = multi.getFileNames();
					
		String name = (String) files.nextElement();
		String original = multi.getOriginalFileName(name);
		File file = multi.getFile(name);
	
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		int context_number = Integer.parseInt(multi.getParameter("context_number"));
		
		bean.setcontext_number(context_number);
		bean.settitle(title);
		bean.setcontents(contents);
		bean.setWrite_time(write_time);
		System.out.println("update file = " + original);
		bean.setfile(original);
		boolean result = upload.updateContext(bean);

		if (result) {
			msg = "수정되었습니다.";
		}

	%>
	
		<script>
	//메세지 출력
	alert("<%=msg%>");
		document.location.href = "./board.jsp";
	</script>

</body>
</html>