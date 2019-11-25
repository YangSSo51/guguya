<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.boardBean"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>guguya</title>
</head>
<body>
	<!-- 메뉴 출력 -->
	<%@ include file="./menu.jsp"%>
	<%@ include file="./dbconn.jsp"%>
	<!-- 관리자 페이지 구별 부분 -->
	<%
		String userid = (String)request.getParameter("userID");
		String userpw = (String)request.getParameter("userPassword");
		
		session.setAttribute("userID", userid);
		session.setAttribute("userPassword", userpw);
	%>
	
	<h2><%=(String)session.getAttribute("userID")%></h2>

	<!-- 글쓰기 등록 -->
	<a href="uploadContext.jsp" class="btn btn-primary pull-right">글쓰기</a>
	<nav>
		<div></div>
	</nav>

	<!-- 게시글 출력 부분 -->
	<div class="container">
		<table style="width: 100%">
			<!-- 게시판 -->

			<tr>
				<th>게시글 번호</th>
				<th>작성자</th>
				<th>제목</th>
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
				<td><%=one.getuserid()%></td>
				<td><a href="./detail.jsp?context_number=<%=context_number%>"><%=one.gettitle()%></td>
				<td><%=one.getWrite_time()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	<%@ include file="./footer.jsp"%>
</body>

<!-- 출처: https://tbbrother.tistory.com/69?category=308532 [밑끝없로그] -->
</html>
