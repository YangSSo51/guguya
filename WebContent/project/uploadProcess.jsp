<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="guguya.projectBean" %>
<jsp:useBean id="proj" class="guguya.projectMigrate"></jsp:useBean>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		
		int user_no, en_no = -1;
		// String write_time;
		String msg = "등록을 실패하였습니다.";
   		String id = (String)session.getAttribute("idKey"); // 현재 로그인한 회원의 id 가져오기
   		
   		if(id == null){
			msg = "로그인이 필요합니다.";
	%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<% 
		}	
	    user_no = account.getUserNo(id); // id에 따른 user_no 받아오기
		en_no = proj.getEnno(user_no);
		projectBean bean2 = new projectBean();

		if(en_no > 0){ // 반환 값이 제대로 들어옴
			bean2.setEn_no(en_no); // 현재 user의 en_no 값을 넣기
		}
		else{ // 반환 값이 없으면
			msg="권한이 없습니다.";
		}
		
				
		// 금기륜씨 코드
		String saveDir = "C://upload/";// 경로 수정
		int maxSize = 1024*1024*100;
		String encType = "UTF-8";

		MultipartRequest multi
			= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
				
		Enumeration files = multi.getFileNames();
				
		String name = (String) files.nextElement();
		String original = multi.getOriginalFileName(name);
		File file = multi.getFile(name);
				
		String proj_name = multi.getParameter("proj_name");
		String proj_desc = multi.getParameter("proj_desc");
				
		System.out.println("proj_name = " + proj_name + " / proj_desc = " + proj_desc + "/ file name = " + original);
			
		bean2.setProj_name(proj_name);
		bean2.setProj_desc(proj_desc);	
		bean2.setFile(original);
				
		boolean result = proj.projectUpload(bean2);

		//성공 여부에 따라 메세지 출력
		if(result){
			msg="등록하였습니다.";	
		}
	%>
<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="/guguya/project/projects.jsp";
</script>
</body>
</html>