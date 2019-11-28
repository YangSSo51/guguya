<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../navbar.jsp" %>

	<%
		// 바뀌여 할 것 : 제목 , 내용, 작성일자
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		boardBean bean2 = new boardBean();
		bean2 = upload.getOneContext(context_number);
	%>
	
	<div class="container">
	<form name="update" method="POST" action="updateProcess.jsp">
	<h2 class="text-center">게시물 수정</h2>
	<br>
	  <div class="form-group row">
      <div class="col-sm-3"></div>
    <div class="col-sm-4">
      <input type="hidden" class="form-control" name="context_number" value="<%=bean2.getcontext_number() %>">
    </div>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputId" class="col-sm-1 col-form-label">제목</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="title" value="<%=bean2.gettitle() %>">
    </div>
  </div>
  <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">내용</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="contents" value="<%=bean2.getcontents() %>">
    </div>
  </div>
  	<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8">수정하기</button>
	</div>
 </form>
 </div>
		<%@ include file="../footer.jsp"%>

</body>
</html>