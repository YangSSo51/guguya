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
<title>UserList</title>
</head>
<body>
<div class="container">
<table style="width:100%">
<%@ include file="../navbar.jsp"%>
	<tr>
		<th>프로젝트명</th>
		<th>지원자 아이디</th>
		<th>결과</th>
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
			<td><%=account.getInno(bean2.getIn_no()) %></td><!-- 개인번호로 아이디 가져옴 -->
			<td><%=bean2.getResult() %></td>
			
		<td>
		<a href="/guguya/portfolio/portfolio.jsp?id=<%=bean2.getIn_no()%>">
		<button type="button" class="btn btn-light" style="background-color:#82C5E8">포트폴리오 보러가기</button></a>
		</td>
		<td>
		<!--updateResult(int in_no)  --> 
		<button type="button" class="btn btn-light" onclick="<%=mgr.updateResult(bean2.getIn_no())%>"style="background-color:#82C5E8">합격</button>
		</td>
		</tr>
		<%
		}//for문
		%>
</table>
	
</div>

</body>
</html>