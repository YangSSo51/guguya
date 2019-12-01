
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
<meta name="viewport" content="width=device-width" initial-scale="1">
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
	<!-- 메뉴 출력 -->
	<%@ include file="../navbar.jsp"%>
	<%@ include file="./dbconn.jsp"%>

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
    <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">제목</label>
   <%=boardbean.gettitle()%><br>
  </div>
    <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">작성자</label>
   <%=boardbean.getuserid()%><br>
  </div>
    <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">작성일</label>
   <%=boardbean.getWrite_time()%><br>
   </div>
    <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">내용</label>
   <%=boardbean.getcontents()%><br>
  </div>
  <div class="form-group row">
      <div class="col-sm-3"></div>
    <label for="inputName" class="col-sm-1 col-form-label">파일</label>
   <%
						// 경로 / null 이 아니면
						if(boardbean.getfile() != null){
					%>
						<label><a href="javascript:return false;" onclick="location.href='./fileDownload.jsp?filename=<%=boardbean.getfile()%>'" download><%=boardbean.getfile() %></a></label>
					<% }else{ %>
						<label for="inputName" class="col-sm-1 col-form-label">파일을 업로드하지 않았습니다</label>
					<% } %>
</div>
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
</div>

	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr
						style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
						<td width="5"><img src="img/table_left.gif" width="5"
							height="30" /></td>
						<td>내 용</td>
						<td width="5"><img src="img/table_right.gif" width="5"
							height="30" /></td>

					</tr>
				</table>
<!-- 댓글 출력 부분 -->
				<div class="container">
					<table style="width: 100%">
						<tr>
							<th>댓글번호</th>
							<th>작성자</th>
							<th>내용</th>
							<th>작성날짜</th>
							<th></th>
						</tr>

						<%
							ArrayList<commentBean> list = comment.commentList();
							int comment_number;
							for (int i = 0; i < list.size(); i++) {
								commentBean one = list.get(i);
								comment_number = one.getcontext_number();
								if (comment_number == boardbean.getcontext_number()) {
						%>

						<tr>
							<td><%=one.getcomment_number() %>
							<td><%=one.getuserid()%></td>
							<td><%=one.getcomment()%></td>
							<td><%=one.getWrite_time()%></td>
							<%
								if (one.getuserid().equals(now_user) || now_user.equals("admin")) {
							%>
							<td><a
								href="./deleteCommentProcess.jsp?context_number=<%=context_number%>&comment_number=<%=one.getcomment_number()%>">삭제</a></td>
							<%
								} else {
							%>
							<td></td>
							<td></td>
							<%
								}
							%>
						</tr>
						<%
							}
						%>
						<%
							}
						%>
					</table>
				</div>
		<tr height="2" bgcolor="#dddddd">
			<td colspan="4" width="407"></td>
		</tr>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="4" width="407"></td>
		</tr>
		<tr>
	</table>
	<table>
		<!-- 댓글 입력 부분 -->
		<div class="container">
			<form name="comment" method="POST" action="uploadCommentProcess.jsp">
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<div class="col-sm-4">
						<input type="hidden" name="context_number"
							value=<%=boardbean.getcontext_number()%>> <input
							type="hidden" name="idKey"
							value=<%=now_user%>> <input
							type="textarea" class="form-control" name="comment"
							placeholder="댓글 내용을 입력하세요">
					</div>
					<br>
					<div class="button-group text-center"
						style="margin-left: auto; margin-right: auto;">
						<button type="reset" class="btn btn-light"
							style="background-color: #A1A6A0">초기화</button>
						<button type="submit" class="btn btn-light"
							style="background-color: #82C5E8">등록하기</button>
					</div>
			</form>
		</div>
		</tr>

		</td>
		</tr>

	</table>
	<%@ include file="../footer.jsp"%>
</body>
</html>