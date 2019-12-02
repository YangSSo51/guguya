<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guguya.portfolioBean" %>
<jsp:useBean id="portfolio" class="guguya.portfolioBean"></jsp:useBean>
<jsp:useBean id="upload" class="guguya.portfolioMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
</head>
<body>
<%@ include file="../navbar.jsp"%>
<%
	/* 지원용 포트폴리오로 기업이 지원한 개인의 상세 포트폴리오를 볼 때는 여기서 봄 */
	
	request.setCharacterEncoding("UTF-8");

	String msg = "";		
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
	
	int in_no = Integer.parseInt(request.getParameter("id"));	
	portfolioBean port = upload.getPortfolio(in_no); // in_no에 해당하는 portfolio 가져옴
	
%>
<div class="container">
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label">작성날짜</label>
    <%=port.getWrite_time() %><br>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">포트폴리오 내용</label>
    <%= port.getPort_desc() %><br>
  </div>
   <div class="form-group row">
      <div class="col-sm-3"></div>
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
</body>
</html>

