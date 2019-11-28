<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="guguya.commentBean"%>
<%@ page import="guguya.commentMigrate"%>
<jsp:useBean id="upload" class="guguya.commentMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		int comment_number = Integer.parseInt(request.getParameter("comment_number"));
		String msg = "댓글 삭제 실패";
		
		commentBean bean = new commentBean();
		if (upload.deleteComment(context_number, comment_number) == true){
			msg = "댓글을 삭제하였습니다";
		}
	%>
	
	<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="./detail.jsp?context_number=<%=context_number%>";
	</script>
	

</body>
</html>