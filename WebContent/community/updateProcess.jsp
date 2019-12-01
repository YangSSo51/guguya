<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>

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
		String write_time;
		String msg = "등록 실패";

		// 바껴야 할 것 : 제목 , 내용, 작성일자
		//int context_number = Integer.parseInt(request.getParameter("context_number"));

		Date date = new Date();
		write_time = date.toString();
	%>
	<jsp:setProperty name="bean" property="context_number" />
	<jsp:setProperty name="bean" property="title" />
	<jsp:setProperty name="bean" property="contents" />
	<%
		bean.setWrite_time(write_time);
		System.out.println("title = "+ bean.gettitle());
		boolean result = upload.updateContext(bean);

		if (result) {
			msg = "수정되었습니다.";
		}
		response.sendRedirect("board.jsp");
	%>

</body>
</html>