<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ page import="guguya.boardBean"%>
<%@ page import="guguya.boardMigrate"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="upload" class="guguya.boardMigrate"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>guguya</title>
<link rel="shortcut icon" type="image/x-icon" href="/guguya/logo_mini.png" />
<style type="text/css">
	.right-container{
		float:right;
	}
</style>
</head>
<body>
	<!-- 메뉴 출력 -->
	<%@ include file="../navbar.jsp"%>
<div class="container">

	<!-- 관리자 페이지 구별 부분 -->
	<%
		request.setCharacterEncoding("utf-8"); 
		String userid = (String) request.getParameter("idKey");
		String userpw = (String) request.getParameter("userPassword");

		if (session.isNew()) {
			session.setAttribute("idKey", userid);
			session.setAttribute("userPassword", userpw);
		} else {
	%>
	<!--<p>session.getAttribute("idKey") %></p> -->
	<%
		}

		String search = (String) request.getParameter("searchText");
		System.out.println("search = " + search);
		String so = (String) request.getParameter("selectBox");
		int selected_option = 0;
		if (so != null)
			selected_option = Integer.parseInt(so);
		System.out.println("option = " + selected_option);

		if (search == null)
			search = "";
	%>
	<div class="right-container">
	<!-- 검색 -->
		<!-- 글쓰기 등록 -->
		<%
			if (session.getAttribute("idKey") != null) {
		%>
		<form action="./uploadContext.jsp" name="uploadForm" method="post">
			<input class="btn btn-light" style="background-color:#82C5E8" type="submit" value="글쓰기" style="float:right" />
		</form>

		<%
			}
		%>
	</div>



	<!-- 게시글 출력 부분 -->
		<table class="table"style="width: 100%">
			<!-- 게시판 -->

			<tr>
				<th scope="col">게시글 번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성날짜</th>
			</tr>

			<%
				String pn = (String) request.getParameter("page_number");
				int page_number = 0;
				if (pn != null)
					page_number = Integer.parseInt(pn);
				ArrayList<boardBean> list = upload.contextList(selected_option, page_number, search);
				int totalsize = upload.listSize(selected_option, page_number, search);
				int context_number;
				System.out.println("list size = " + list.size());
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
		<br>
		<br>
		<div class="button-group text-center" style="margin-left: auto; margin-right: auto;">
		<form action="./board.jsp" name="searchForm" method="post">
			<input type="text" name="searchText" placeholder="검색 내용"
				class="textField" value="<%=search%>" /> <select name="selectBox"
				id="selectBox">
				<option value="0">작성자</option>
				<option value="1">글제목</option>
			</select>
			<input type="submit" value="검색" class="btn btn-light" style="background-color:#82C5E8"/>

		</form>
		<br>
		<br>
		<%
			for (int i = 0; i < (totalsize / 10) + 1; i++) {
				if(totalsize%10 == 0 && totalsize/10 != (i+1)){
					continue;
				}
		%>
		<a href="./board.jsp?page_number=<%=i%>&searchText=<%=search%>"><font size="4px">&nbsp;<%=i + 1%>&nbsp;</a></font>
		<%
			}
		%>
		</div>
</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	<%@ include file="../footer.jsp"%>
</body>

<!-- 출처: https://tbbrother.tistory.com/69?category=308532 [밑끝없로그] -->
</html>
