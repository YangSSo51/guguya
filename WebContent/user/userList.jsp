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

<table class="text-center">
<%@ include file="../navbar.jsp"%>
<%
	String str = "root";
	//root일때만 수행-이 부분은 권한으로 변경해야함
	if(id.equals("root")){
	userMigrate mgr = new userMigrate();
	
	//userBean의 리스트형태로 회원정보를 가져옴
	ArrayList<userBean> list = mgr.accountList();
		for(userBean bean:list){
	%>
		<tr>
			<td><%=bean.getId() %></td>
			<td><%=bean.getPw() %></td>
			<td><%=bean.getEmail() %></td>
			<td><%=bean.getAuth() %></td>
		</tr>
		</table>
		
	<%
		}
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