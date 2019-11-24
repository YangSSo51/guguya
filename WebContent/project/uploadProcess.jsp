<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.projectBean"></jsp:useBean>
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
		String write_time;
		String msg = "등록을 실패하였습니다.";
   		String id = (String)session.getAttribute("idKey"); // 현재 로그인한 회원의 id 가져오기
	
   		System.out.println(id);
   		
   		if(id == null){
			msg = "로그인이 필요합니다.";
			response.sendRedirect("/guguya/user/login.jsp");
		}	

	    user_no = account.getUserNo(id); // id에 따른 user_no 받아오기
		en_no = upload.getEnno(user_no);

	    Date date = new Date();
		write_time = date.toString();
	%>
		<jsp:setProperty name="bean" property="proj_name" />
		<jsp:setProperty name="bean" property="proj_desc"/>
	<% 
		if(en_no > 0){ // 반환 값이 제대로 들어옴
			bean.setEn_no(en_no); // 현재 user의 en_no 값을 넣기
			bean.setWrite_time(write_time);
		}
		else{ // 반환 값이 없으면
			System.out.println("권한이 없습니다.");
			// response.sendRedirect("/guguya/user/login.jsp");
		}

		// projectUpload 함수를 실행했을 때의 결과값을 확인	
		boolean result = upload.projectUpload(bean);
	
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="등록하였습니다.";	
		}
	%>
<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="/guguya/projects.jsp";
</script>
</body>
</html>