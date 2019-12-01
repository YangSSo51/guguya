<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="proj" class="guguya.projectMigrate"></jsp:useBean>
<%@ page import="guguya.projectBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//String proj_id = request.getParameter("id");
	int proj_no = Integer.parseInt(request.getParameter("proj_no"));
	
	projectBean bean2 = new projectBean();
	bean2.setProj_no(proj_no);
	bean2.setProj_name(request.getParameter("proj_name"));
	bean2.setProj_desc(request.getParameter("proj_desc"));
	
	boolean result = proj.updateProject(bean2);
	
		String msg="수정을 실패하였습니다.";
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="수정하였습니다.";
		}
	%>
<script>
	<!--메세지 출력-->
	alert("<%=msg%>");	
	document.location.href="/guguya/project/projects.jsp"
</script>
</body>
</body>
</html>