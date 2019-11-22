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
	<%@ include file="./menu.jsp"%>
	<%@ include file="./dbconn.jsp"%>

	<%
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		boardBean bean = new boardBean();
		bean = upload.getOneContext(context_number);
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
						<td colspan="4" width="407"><%=bean.getcontext_number()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성자</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=bean.getuserid()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성일</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=bean.getWrite_time()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">제목</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=bean.gettitle()%></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">내용</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"><%=bean.getcontents()%></td>
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

							<!-- id 비교부분 넣어야 함  본인이면 수정, 글삭제가 보이게 --> <a type="button"
							href="./updateContext.jsp?context_number=<%=bean.getcontext_number()%>"
							class="btn">수정</a> <a type="button"
							href="./deleteProcess.jsp?context_number=<%=bean.getcontext_number()%>"
							class="btn">글삭제</a>
						<td width="0">&nbsp;</td>
					</tr>
				</table> <!-- 댓글 출력 부분 -->
				<div class="container">
					<table style="width: 100%">
						<tr>
							<th>작성자</th>
							<th>내용</th>
							<th>작성날짜</th>
						</tr>

						<%
							ArrayList<commentBean> list = comment.commentList();
							int comment_number;
							for (int i = 0; i < list.size(); i++) {
								commentBean one = list.get(i);
								comment_number = one.getcontext_number();
								if(comment_number == bean.getcontext_number()){
						%>

						<tr>
							<td>
							<%=one.getuserid()%></td><td><%=one.getcomment()%></td>
							<td><%=one.getWrite_time()%></td>
						</tr>
						<%
							} }
						%>
					</table>
				</div>
				<tr height="2" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
				<!-- 댓글 입력 부분 -->

			</td>
		</tr>
		
	</table>
	<%@ include file="./footer.jsp"%>
</body>
</html>