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
	<%@ include file="./navbar.jsp"%>
	<%@ include file="./dbconn.jsp"%>

	<%
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		System.out.println("detail- context_number = " + context_number + "\n");
		boardBean boardbean = new boardBean();
		boardbean = upload.getOneContext(context_number);
	%>


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
				<table width="413">
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">글번호</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=boardbean.getcontext_number()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성자</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=boardbean.getuserid()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성일</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=boardbean.getWrite_time()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">제목</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=boardbean.gettitle()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">내용</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=boardbean.getcontents()%></td>
					</tr>
					<tr height="2" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>

					<tr align="center">
						<td width="0">&nbsp;</td>
						<td colspan="2" width="399">
							<button type="button"
								onclick="location.href='./uploadContext.jsp'">글쓰기</button>
							<button type="button" onclick="location.href='./board.jsp'">목록</button>
							<%
								if (boardbean.getuserid().equals((String)session.getAttribute("userID")) ||
										session.getAttribute("userID").equals("admin")) {
							%> <!-- id 비교부분 넣어야 함  본인이면 수정, 글삭제가 보이게 --> <a type="button"
							href="./updateContext.jsp?context_number=<%=boardbean.getcontext_number()%>"
							class="btn">수정</a> <a type="button"
							href="./deleteProcess.jsp?context_number=<%=boardbean.getcontext_number()%>"
							class="btn">글삭제</a> <%
 	}
 %>
						
						<td width="0">&nbsp;</td>
					</tr>
				</table> <!-- 댓글 출력 부분 -->
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
								if (one.getuserid().equals(session.getAttribute("userID")) || session.getAttribute("userID").equals("admin")) {
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
							type="hidden" name="userid"
							value=<%=session.getAttribute("userID")%>> <input
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
	<%@ include file="./footer.jsp"%>
</body>
</html>