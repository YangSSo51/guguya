<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<jsp:useBean id="bean2" class="guguya.boardBean"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<%@ include file="../navbar.jsp" %>

<title>guguya</title>
</head>
<body>

	<!-- 글쓰기 등록 -->
	<a href="uploadContext.jsp">
	<button type="button" class="btn btn-light" style="background-color:#82C5E8">글쓰기</button>
	</a>

	<!-- 게시글 출력 부분 -->
	<div class="container">
		<table style="width: 100%">
			<!-- 게시판 -->

			<tr>
				<th>게시글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</tr>

			<%
				ArrayList<boardBean> list = upload.contextList();
				int context_number;
				for (int i = 0; i < list.size(); i++) {
					boardBean one = list.get(i);
					context_number = one.getcontext_number();
			%>

			<tr>
				<td><%=one.getcontext_number()%></td>
				<td><a href="./detail.jsp?context_number=<%=context_number%>"><%=one.gettitle()%></a></td>
				<td><%=one.getuserid()%></td>
				<td><%=one.getWrite_time()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
		<%@ include file="../footer.jsp"%>


</body>

</html>
