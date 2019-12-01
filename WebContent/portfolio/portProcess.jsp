<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="guguya.portfolioBean" %>
<jsp:useBean id="upload" class="guguya.portfolioMigrate"></jsp:useBean>
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
		
		int user_no, in_no = -1;
		String msg = "등록을 실패하였습니다.";
   		String id = (String)session.getAttribute("idKey"); // 현재 로그인한 회원의 id 가져오기
   		boolean result;
   		
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
		in_no = upload.getInno(user_no); // user_no에 따른 in_no 받아오기
		portfolioBean port = upload.getPortfolio(in_no);
		portfolioBean bean2 = new portfolioBean(); // 등록할 bean
		
		if(in_no > 0){ // 반환 값이 제대로 들어옴
			bean2.setIn_no(in_no); // 현재 user의 en_no 값을 넣기		
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
				
		String port_desc = multi.getParameter("port_desc");
				
		System.out.println("port_desc = " + port_desc + "/ file name = " + original);
			
		bean2.setPort_desc(port_desc);	
		bean2.setFile(original);
		
		// Upload or Update 함수를 실행했을 때의 결과값을 확인	
		if(port.getWrite_time() != null){ // 기존의 portfolio가 존재하면 (쓴 적 있으면)
			result = upload.portfolioUpdate(bean2); // update
		}
		else{
			result = upload.portfolioUpload(bean2); // insert
		}
		
		//성공 여부에 따라 메세지 출력
		if(result){
			msg="등록하였습니다.";	
		}
	%>
<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="/guguya/portfolio/portfolio.jsp";
</script>
</body>
</html>