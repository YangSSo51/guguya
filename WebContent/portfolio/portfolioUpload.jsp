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
</head>
<body>
<%@ include file="../navbar.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String getid = request.getParameter("id");
	int in_no = Integer.parseInt(getid);
	portfolioBean port = upload.getPortfolio(in_no); // in_no에 해당하는 portfolio 가져옴
	
%>

<div class="container">
<form name="portfolioForm" method="POST" action="portProcess.jsp">
	<h2 class="text-center">포트폴리오 정보 입력</h2>
	<br>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label">포트폴리오 내용</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="port_desc" placeholder="사용 가능한 언어 및 기술,진행한 프로젝트에 대한 설명을 적어주세요" value="<%=port.getPort_desc()%>">
    </div>
  </div>
	<br>
	<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8">등록하기</button>
	</div>
</form>
</div>
</body>
</html>