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
	<%
		// 바뀌여 할 것 : 제목 , 내용, 작성일자
		int context_number = Integer.parseInt(request.getParameter("context_number"));
		boardBean bean = new boardBean();
		bean = upload.getOneContext(context_number);
	%>

	<div class="container">
		<form name="update" method="POST" action="updateProcess.jsp">
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
							<input type="hidden" name="context_number" value=<%=bean.getcontext_number() %>>
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
							<td align="center" width="76">제목</td>
							<td width="319"></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<%
								String t = bean.gettitle();
							%>
							<td><input type="textarea" class="form-control" name="title"
								placeholder=<%=t%>></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">내용</td>
							<td width="319"></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<%
								String c = bean.getcontents();
							%>
							<td><input type="textarea" class="form-control"
								name="contents" placeholder=<%=c%>></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td width="399" colspan="2" height="200">
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4" width="407"></td>
						</tr>

						<tr align="center">
							<div class="button-group text-center"
								style="margin-left: auto; margin-right: auto;">
								<button type="reset" class="btn btn-light"
									style="background-color: #A1A6A0">초기화</button>
								<button type="submit" class="btn btn-light"
									style="background-color: #82C5E8">수정하기</button>
							</div>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</div>

	<% 
		//upload.deleteContext(context_number);
		//response.sendRedirect("board.jsp");
		
	%>

</body>
</html>