<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<jsp:useBean id="upload" class="guguya.portfolioMigrate"></jsp:useBean>
<jsp:useBean id="account" class="guguya.userMigrate"></jsp:useBean>
<jsp:useBean id="portfolio" class="guguya.portfolioBean"></jsp:useBean>
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

	%>
		<jsp:setProperty name="portfolio" property="port_desc" />
	<% 
		if(in_no > 0){ // 반환 값이 제대로 들어옴
			portfolio.setIn_no(in_no); // 현재 user의 en_no 값을 넣기		
		}
		else{ // 반환 값이 없으면
			msg="권한이 없습니다.";
		}

		// projectUpload 함수를 실행했을 때의 결과값을 확인	
		boolean result = upload.portfolioUpload(portfolio); // insert
		// (보류) 수정 시, update가 되어야한다 
		
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