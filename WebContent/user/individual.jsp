<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="guguya.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Individual</title>
<script type="text/javascript">
	
</script>
<style>
	#hidden{
		display:none;
	}
	
</style>
</head>
<body>
<%@ include file="../navbar.jsp"%>
<div class="container">
	<% 
	//기존에 있던 정보를 읽어오기 위한 동작
	userMigrate mgr = new userMigrate();
	
	//individualBean의 리스트형태로 회원정보를 가져옴
	ArrayList<individualBean> list = mgr.individualList(mgr.getUserNo(id));
		for(individualBean ibean:list){
	%>
<!-- pw는 테이블이 달라서 수정이 불가능한 상태 -->
<form name="signupForm" method="POST" action="individualProcess.jsp">
	<h2 class="text-center">개인정보 수정하기</h2>
	<br>
	<input id="hidden" type="text" class="form-control" name="user" value="<%=account.getUserNo(id)%>">
  <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="pw" value="<%=ibean.getPw()%>">
    </div>
  </div>
  <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">이름</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="name" value="<%=ibean.getName()%>">
    </div>
  </div>
    <div class="form-group row">
       <div class="col-sm-3"></div>
    <label for="inputEmail" class="col-sm-1 col-form-label">나이</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="age" value="<%=ibean.getAge()%>">
    </div>
  </div>
	<br>
		<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">초기화</button>
	  <button type="submit" class="btn btn-light" style="background-color:#82C5E8">수정하기</button>
	</div>
</form>
<% } %>
</div>
		<%@ include file="../footer.jsp"%>

</body>
</html>