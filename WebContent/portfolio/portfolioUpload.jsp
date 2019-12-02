<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guguya.portfolioBean" %>
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
	request.setCharacterEncoding("UTF-8");
	String msg;
	int user_no = account.getUserNo(id); // id와 account는 navbar에 있음
	int in_no = upload.getInno(user_no); // 받아온 user_no으로 in_no 찾기
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

%>

<div class="container">
<form name="portfolioForm" method="POST" enctype="multipart/form-data" action="portProcess.jsp">
	<h2 class="text-center">포트폴리오 정보 입력</h2>
	<br>
  <div class="form-group row">
      <div class="col-sm-3"></div>      
    <label for="inputDesc" class="col-sm-1 col-form-label"> 내용</label>
    <div class="col-sm-4">
     <% if(port.getWrite_time() != null) // 작성한 적 있으면
     { %> 
     <textarea class="form-control" name="port_desc" placeholder="사용 가능한 언어 및 기술,진행한 프로젝트에 대한 설명을 적어주세요" rows="15"><%=port.getPort_desc()%></textarea>
     
     <%} 
     else{ %>
     <textarea class="form-control" name="port_desc" placeholder="사용 가능한 언어 및 기술,진행한 프로젝트에 대한 설명을 적어주세요" rows="15"></textarea>
	<%} %>
    </div>
  </div>
  <div class="form-group row">
	<div class = "col-sm-3"></div>
		<label for="inputDesc" class="col-sm-1 col-form-label">파일업로드</label>
		<div class="col-sm-4">
		<% if(port.getFile() == null){ %>
			<input type="file" class="form-control" name="file">
		<% }else{ %>
			<p>업로드 된 파일 : <%=port.getFile() %></p>
			<input type="file" class="form-control" name="file">
		<% } %>
		</div>
	</div>
	<br>
	<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8">등록하기</button>
	</div>
</form>
</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>