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
	var name = document.getElementById("name");
	var address = document.getElementById("address");
	var business_no = document.getElementById("business_no");
	
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
	ArrayList<enterpriseBean> list = mgr.enterpriseList(mgr.getUserNo(id));
		for(enterpriseBean ebean:list){
	%>
<!-- pw는 테이블이 달라서 수정이 불가능한 상태 -->
<form name="enterpriseForm" method="POST" action="enterpriseProcess.jsp">
	<h2 class="text-center">개인정보 수정하기</h2>
	<br>
	<input id="hidden" type="text" class="form-control" name="user" value="<%=account.getUserNo(id)%>">
  <div class="form-group row">
        <div class="col-sm-3"></div>
    <label for="inputPassword" class="col-sm-1 col-form-label">이름</label>
    <div class="col-sm-4">    
      <input type="text" class="form-control" id="name" name="name"  value="<%=ebean.getName()%>">
    </div>
  </div>
    <div class="form-group row">
       <div class="col-sm-3"></div>
    <label for="text" class="col-sm-1 col-form-label">주소</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="address" name="address" onload="isEmpty(this.form.address)" value="<%=ebean.getAddress()%>">
    </div>
  </div>
   <div class="form-group row">
       <div class="col-sm-3"></div>
    <label for="text" class="col-sm-1 col-form-label">사업자번호</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="business_no" name="business_no"  value="<%=ebean.getBusiness_no()%>" onfocusout="isEmpty(this.form.business_no)">
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