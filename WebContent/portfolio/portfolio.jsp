<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="portfolio" class="guguya.portfolioBean"></jsp:useBean>
<jsp:useBean id="upload" class="guguya.portfolioMigrate"></jsp:useBean>
<%@ page import="guguya.portfolioBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
<%@ include file="../navbar.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String msg = "";
	int user_no = account.getUserNo(id); // 현재 로그인한 회원의 id로 user_no 받아옴
	int in_no = upload.getInno(user_no); // user_no으로 in_no 가져옴
	portfolioBean port = upload.getPortfolio(in_no); // in_no에 해당하는 portfolio 가져옴
			
	if(id == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<% 
	}	
	else if(account.getAuth(id) == 2){ // 기업이면 접근 불가
		msg = "권한이 필요합니다.";  %>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<%	}
	else if(port.getWrite_time() == null){
		msg = "포트폴리오 등록이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/portfolio/portfolioUpload.jsp";
		</script>
		<% 
	}		
%>

<div class="container">
<a href="/guguya/portfolio/portfolioUpload.jsp?id=<%=in_no%>">
<button type="button" class="btn btn-light float-right" style="background-color:#82C5E8">포트폴리오 수정하기
</button>
</a>
<br>
<br>
  <div class="form-group row">
      <div class="col-sm-2"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label">작성날짜</label>
    <div class="col-sm-6"><%=port.getWrite_time() %></div>
    <div class="col-sm-2"></div>
  </div>
  <div class="form-group row">
      <div class="col-sm-2"></div>
    <label for="inputName" class="col-sm-1 col-form-label">내용</label>
    <div class="col-sm-6"><%= port.getPort_desc() %></div>
     <div class="col-sm-2"></div>
  </div>
  <div class="form-group row">
      <div class="col-sm-2"></div>
       <label for="inputName" class="col-sm-1 col-form-label">파일</label>
       <div class="col-sm-6">
   		<% 
		if(port.getFile() != null){
		%>
		<label><a href="javascript:return false;" onclick="location.href='/guguya/community/fileDownload.jsp?filename=<%=port.getFile()%>'" download><%=port.getFile() %></a></label>
		<% }else{ %>
		<label for="inputName" class="col-sm-12 col-form-label">파일을 업로드하지 않았습니다</label>
		<% } %>
		</div>
		<div class="col-sm-2"></div>
  </div>
  
</div>
		<%@ include file="../footer.jsp"%>
</body>