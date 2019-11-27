<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션의 경우 jsp내부에서는 동작이 안되므로 주의할것 -->
<jsp:useBean id="port" class="guguya.portfolioMigrate"/>

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
		<th>아이디</th>
		<th>이메일</th>
		<th>권한</th>
	</tr>
<%
	/* 기업이 자신의 프로젝트에 지원한 지원자 목록을 확인할 수 있는 페이지	*/
	
	String str = "root";
	//root일때만 수행-이 부분은 권한으로 변경해야함
	if(id.equals("root")){
	applyMigrate mgr = new applyMigrate();
	
	// 해당 프로젝트에 지원한 지원자 목록 리스트
	ArrayList<applyBean> list = mgr.applyList();	//만들어
		for(applyBean bean2:list){	//for문
	%>
		<tr>
			<td><%=bean2.getApp_no() %></td>
			<td><%=bean2.getProj_no() %></td>
			<td><%=bean2.getIn_no() %></td>
			<td><%=bean2.getResult() %></td>
			
		<td>
		<a href="/guguya/user/deleteProcess.jsp?id=<%=bean2.getIn_no() %>">
		<button type="button" class="btn btn-light" id="hidden" style="background-color:#82C5E8">포트폴리오 보러가기</button></a>
		</td>
		</tr>
		<%
		}//for문
		%>
</table>
	
	<%	//if문
	}else{
	
%>
<script>
	<!--메세지 출력-->
	alert("권한이 없습니다");	
	document.location.href="/guguya/user/login.jsp"
</script>
<%
	}
%>
</div>

</body>
</html>