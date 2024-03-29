<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션의 경우 jsp내부에서는 동작이 안되므로 주의할것 -->
<jsp:useBean id="port" class="guguya.portfolioMigrate"/>
<%@page import="guguya.projectMigrate" %>
<%@page import="guguya.projectBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="guguya.applyMigrate" %>
<%@page import="guguya.applyBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
<%@ include file="../navbar.jsp"%>

<div class="container">
<table class="table" style="width:100%">

	<% String msg=null;
		if(id == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<% 
	}	
	else if(account.getAuth(id) == 1){ // 개인이면 접근 불가
		msg = "권한이 필요합니다.";  %>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<%	}
	else{
		%>
	<tr>
		<th scope="col">프로젝트 명</th>
		<th scope="col">지원자</th>
		<th scope="col">결과</th>
		<th></th>
		<th></th>
	</tr>
	<%
	/* 기업이 자신의 프로젝트에 지원한 지원자 목록을 확인할 수 있는 페이지	*/
	
	applyMigrate mgr = new applyMigrate();
	projectMigrate pro = new projectMigrate();
	//프로젝트 번호 받아옴
	int pro_no = Integer.parseInt(request.getParameter("id"));
	// 해당 프로젝트에 지원한 지원자 목록 리스트
	ArrayList<applyBean> list = mgr.ApplyList(pro_no);	//만들어
		for(applyBean bean2:list){	//for문
			projectBean proj = pro.getProject(bean2.getProj_no());
	%>
		<tr>
			<td><%=proj.getProj_name() %></td>
			<td><%=account.get_userId(bean2.getIn_no()) %></td><!-- in_no으로 user_no가져와서 아이디 가져옴 -->
			<td><%=bean2.getResult() %></td>
			
		<td>
		<a href="/guguya/portfolio/applyPortfolio.jsp?id=<%=bean2.getIn_no()%>">
		<button type="button" class="btn btn-light" style="background-color:#82C5E8">포트폴리오 보러가기</button></a>
		</td>
		<td>
		<a href="/guguya/portfolio/applyProcess.jsp?id=<%=bean2.getIn_no()%>&proj_no=<%=bean2.getProj_no()%>">
		<button type="button" class="btn btn-light" style="background-color:#82C5E8">합격</button>
		</a>
		</td>
		</tr>
		<%
		}//for문
	}//if문
		%>
</table>
	
</div>
		<%@ include file="../footer.jsp"%>

</body>
</html>