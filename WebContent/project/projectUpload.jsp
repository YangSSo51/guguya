<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
<%@ include file="../navbar.jsp"%>

<% 	String msg=null;
	if(id == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<% 
	}	
	else if(account.getAuth(id) == 1){ // 기업이면 접근 불가

		msg = "권한이 필요합니다.";  %>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/guguya/user/login.jsp";
		</script>
	<%	}
%>
>>>>>>> master
<div class="container">
<form name="projectForm" method="POST" action="/guguya/project/uploadProcess.jsp">
	<h2 class="text-center">프로젝트 정보 입력</h2>
	<br>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">제목</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="proj_name">
    </div>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputDesc" class="col-sm-1 col-form-label" >내용</label>
    <div class="col-sm-4">
      <textarea class="form-control" name="proj_desc" placeholder="프로젝트에 대한 설명을 적어주세요" rows="15"></textarea>
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
		<%@ include file="../footer.jsp"%>

</html>