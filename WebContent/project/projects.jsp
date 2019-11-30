<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="upload" class="guguya.projectMigrate"></jsp:useBean>
<jsp:useBean id="project" class="guguya.projectBean"></jsp:useBean>    

<%@ page import="guguya.projectBean" %>
<%@ page import="guguya.projectMigrate" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../navbar.jsp"%>

<div class="container">
<table class="table" style="width:100%">



<%
	// 기업의 프로젝트 리스트는 로그인한 사용자만 볼 수 있음
	String msg = "에에";
	if(id != null){
	int auth = account.getAuth(id);	

  	if(auth == 2){ // 기업일 때만 보이도록 %>
		<a href="/guguya/project/projectUpload.jsp">
		<button type="button" class="btn btn-light float-right" style="background-color:#82C5E8">프로젝트 등록하기
		</button>
		</a>
		<br><br>
<% 	} 
}%>

	<tr>
		<th scope="col">no</th>
		<th scope="col">프로젝트 명</th>
		<th scope="col">작성자</th>
		<th scope="col">작성날짜</th>
	</tr>
<%
	int user_no, en_no = -1;
	int j=1;

	//userBean의 리스트형태로 프로젝트 정보를 가져옴
	ArrayList<projectBean> list = upload.projectList();
	for(int i = 0; i < list.size(); i++){	//for문
		projectBean pro = list.get(i);
		en_no = pro.getEn_no();	// 작성자의 en_no을 가지고		
%>
	<tr>
		<th scope="row"><%=j %></th>
		<td><a href="/guguya/project/project.jsp?id=<%= pro.getProj_no() %>"><%= pro.getProj_name()%></a></td>
		<td><%= upload.getEnterpiseName(en_no)%></td>
		<td><%= pro.getWrite_time()%></td>
	</tr>
	
<%	j++; }
%>
</table>

</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>