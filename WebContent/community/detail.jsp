
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>
<%@ page import="guguya.commentBean"%>
<%@ page import="guguya.commentMigrate"%>

<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<jsp:useBean id="comment" class="guguya.commentMigrate"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
	<!-- 메뉴 출력 -->
	<%@ include file="../navbar.jsp"%>

	<%
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		System.out.println("detail- context_number = " + context_number + "\n");
		boardBean boardbean = new boardBean();
		boardbean = upload.getOneContext(context_number);
		
		String now_user = (String)session.getAttribute("idKey");
		if(now_user == null)
			now_user = "비회원";

		
	%>
<div class=container>
<div>
<div class="row justify-content-center">
   <div class="col-lg-2"></div>
    <div class="col-lg-8">
      <h3 class="detail-title"> <%=boardbean.gettitle()%></h3>
    </div>
  </div>
  <div class="row justify-content-center">
      	<div class="col-lg-2"></div>
        <div class="col-lg-8">
          <span class="detail-text mr-2"><%=boardbean.getuserid()%></span>
          <span class="detail-text"><%=boardbean.getWrite_time()%></span>
       </div>
  </div>
    <div class="row justify-content-center">
      	<div class="col-lg-2"></div>
        <div class="col-lg-8">
          <span class="detail-text">
        <%
	// 경로 / null 이 아니면
		if(boardbean.getfile() != null){%>
		<label><a href="javascript:return false;" onclick="location.href='./fileDownload.jsp?filename=<%=boardbean.getfile()%>'" download><%=boardbean.getfile() %></a></label>
		<% }else{ %>
		<label for="inputName" class="col-sm-8 col-form-label">파일을 업로드하지 않았습니다</label>
	<% } %></span>
       </div>
  </div>


  <br>
    <div class="row justify-content-center">
      	<div class="col-lg-2"></div>
        <div class="col-lg-8">
          <p class="detail-text"> <%=boardbean.getcontents()%></p>
       </div>
  </div>
  <br>
</div>
<hr>
<!-- 댓글 출력 부분 -->
 					<div class="row justify-content-center">

						<%
							ArrayList<commentBean> list = comment.commentList();
							int comment_number;
							for (int i = 0; i < list.size(); i++) {
								commentBean one = list.get(i);
								comment_number = one.getcontext_number();
								if (comment_number == boardbean.getcontext_number()) {
						%>
 					<div class="col-lg-10">
          					<div class="row">
          					 <div class="col-lg-3"></div>
            				  <strong><%=one.getuserid()%> | </strong>
             					 <span class="detail-text">  <%=one.getWrite_time()%></span>
           					 </div>
           			</div>
       					 <div class="col-lg-10">
       					  <div class="row">
          					 <div class="col-lg-3"></div>
            				<div class="col-lg-8">
              				<p class="font-weight-light"><%=one.getcomment()%></p>
           					 </div>
          					</div>
          				</div>
          				<%
								if (one.getuserid().equals(now_user) || now_user.equals("admin")) {
							%>
							<a
								href="./deleteCommentProcess.jsp?context_number=<%=context_number%>&comment_number=<%=one.getcomment_number()%>">
								<button type="reset" class="btn btn-light" style="background-color:#A1A6A0">
								삭제
								</button></a>
							<%
								}
          				
								}
							}
							%>
							
          			</div>
    <br>
    	<% if(id!=null){ %>
    
		<!-- 댓글 입력 부분 -->
			<form name="comment" method="POST" action="uploadCommentProcess.jsp">
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<div class="col-sm-4">
						<input type="hidden" name="context_number" value=<%=boardbean.getcontext_number()%>>
						<input type="hidden" name="idKey" value=<%=now_user%>> 
						<input type="textarea" class="form-control" name="comment" placeholder="댓글 내용을 입력하세요">
					</div>
					<br>
					<div class="button-group text-center"
						style="margin-left: auto; margin-right: auto;">
						<button type="submit" class="btn btn-light"
							style="background-color: #82C5E8">등록하기</button>
					</div>
				</div>
			</form>
	<br>
	<br>
		<div class="button-group text-center" style="margin-left: auto; margin-right: auto;" >
	<a href="./board.jsp">
	  <button type="button" class="btn btn-light" style="background-color:#82C5E8">목록</button></a>
	<a href="./updateContext.jsp?context_number=<%=boardbean.getcontext_number()%>">
	<%
		if (boardbean.getuserid().equals(now_user) ||
					now_user.equals("admin")) {
	%>
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">수정</button></a>
	<a href="./deleteProcess.jsp?context_number=<%=boardbean.getcontext_number()%>">
	  <button type="reset" class="btn btn-light" style="background-color:#A1A6A0">삭제</button></a>
	<%} %>
	</div>
	<%} %>
	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>