<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!-- 세션의 경우 jsp내부에서는 동작이 안되므로 주의할것 -->
<%@page import="java.util.ArrayList" %>
<%@page import="guguya.*" %>
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
	String str = "root";
	//root일때만 수행-이 부분은 권한으로 변경해야함
	if(id.equals("root")){
	userMigrate mgr = new userMigrate();
	
	//userBean의 리스트형태로 회원정보를 가져옴
	ArrayList<userBean> list = mgr.accountList();
		for(userBean bean:list){	//for문
	%>
		<tr>
			<td><%=bean.getId() %></td>
			<td><%=bean.getEmail() %></td>
		<%
		if(Integer.parseInt(bean.getAuth())==1){
		%>
			<td>개인</td>
		<%
		}
		else if(Integer.parseInt(bean.getAuth())==2){
		%>
			<td>기업</td>
		<% 
		}
		else{
		%>
			<td>관리자</td>
		<% 
		}
		%>
		<td>
		<a href="http://localhost:8080/guguya/user/deleteProcess.jsp?id=<%=bean.getId() %>"><button type="button" class="btn btn-light" id="hidden" style="background-color:#82C5E8">삭제</button></a>
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
	document.location.href="login.jsp"
</script>
<%
	}
%>
</div>

</body>
</html>