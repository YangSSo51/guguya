<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="proj" class="guguya.projectMigrate"></jsp:useBean>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
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
	
	
	// 금기륜씨 코드
	String saveDir = "C://upload/";// 경로 수정
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";

	MultipartRequest multi
		= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
	
	projectBean bean2 = new projectBean();
	
	Enumeration files = multi.getFileNames();					
	String name = (String) files.nextElement();
	String original = multi.getOriginalFileName(name);
	File file = multi.getFile(name);
					
	int proj_no = Integer.parseInt(multi.getParameter("proj_no")); // proj_no
	String proj_name = multi.getParameter("proj_name");
	String proj_desc = multi.getParameter("proj_desc");
					
	System.out.println("proj_no = " + proj_no + "proj_name = " + proj_name + " / proj_desc = " + proj_desc + "/ file name = " + original);
			
	bean2.setProj_no(proj_no);
	bean2.setProj_name(proj_name);
	bean2.setProj_desc(proj_desc);	
	bean2.setFile(original);	
	
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