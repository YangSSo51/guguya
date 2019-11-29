<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guguya.applyBean" %>
<jsp:useBean id="upload" class="guguya.applyMigrate"/>
<jsp:useBean id="apply" class="guguya.applyBean"/>
<jsp:useBean id="account" class="guguya.userMigrate"/>
<jsp:useBean id="port" class="guguya.portfolioMigrate"/>
<%@ page import="guguya.portfolioBean" %>
<jsp:useBean id="upload2" class="guguya.portfolioMigrate"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("idKey"); // 현재 로그인한 회원의 id 가져오기
	int user_no, in_no;

	String msg = "으에";
	int user_no2 = account.getUserNo(id); // 현재 로그인한 회원의 id로 user_no 받아옴
	int in_no2 = upload2.getInno(user_no2); // user_no으로 in_no 가져옴
	portfolioBean port2 = upload2.getPortfolio(in_no2); // in_no에 해당하는 portfolio 가져옴

	if(id == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<% 
	}	
	else if(port2.getWrite_time() == null){
		msg = "포트폴리오 등록이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/portfolio/portfolioUpload.jsp";
		</script>
		<% 
	}		
		
	String getid = request.getParameter("id");
	int proj_id = Integer.parseInt(getid); // proj_no 받아오기

	apply.setProj_no(proj_id); // bean에 넣기
	
    user_no = account.getUserNo(id); // id에 따른 user_no 받아오기
	in_no = port.getInno(user_no); // user_no에 따른 in_no 받아오기

	if(in_no > 0){ // 반환 값이 제대로 들어옴
		apply.setIn_no(in_no); // 현재 user의 in_no 값을 넣기
	}
	else{ // 반환 값이 없으면
		msg="권한이 없습니다.";
	}
	
	if(upload.applyCheck(proj_id, in_no)){ // 사용자가 현재 프로젝트에 지원한 적이 있다면 alert
		msg="이미 지원한 프로젝트 입니다.";
	}
	else{ // 없으면 지원 등록
		apply.setResult("지원 중"); // result 설정
		boolean result = upload.applyProject(apply); // applyProject 함수를 실행했을 때의 결과값을 확인	
		
		//성공 여부에 따라 메세지 출력
		if(result)
			msg="등록하였습니다.";	
		else
			msg="등록에 실패하였습니다.";
	}
	%>
<script>
	//메세지 출력
	alert("<%=msg%>");	
	document.location.href="/guguya/project/projects.jsp";
</script>
</body>
</html>
