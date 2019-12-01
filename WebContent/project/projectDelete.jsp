<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="proj" class="guguya.projectMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String proj_id = request.getParameter("id");
	int proj_no = Integer.parseInt(proj_id);
	boolean result = proj.deleteProject(proj_no);
		String msg="프로젝트 삭제를 실패하였습니다.";
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="프로젝트가 삭제되었습니다.";
		}
	%>
<script>
	<!--메세지 출력-->
	alert("<%=msg%>");	
	document.location.href="/guguya/project/projects.jsp"
</script>
</body>
</html>