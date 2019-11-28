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
</head>
<body>
	<!-- 메뉴 출력 -->
	<%@ include file="./navbar.jsp"%>
	<%@ include file="./dbconn.jsp"%>
	<!-- 관리자 페이지 구별 부분 -->
	<%
		String userid = (String)request.getParameter("userID");
		String userpw = (String)request.getParameter("userPassword");
		
		if(session.isNew()){
			session.setAttribute("userID", userid);
			session.setAttribute("userPassword", userpw);
		}else{
	%>
	<!--<p><%=session.getAttribute("userID") %></p> -->
	<%
		}
		
		String search = (String)request.getParameter("searchText");
		System.out.println("search = " + search);
		String so = (String)request.getParameter("selectBox");
		int selected_option = 0;
		if(so != null)
			selected_option = Integer.parseInt(so); 
		System.out.println("option = " + selected_option);
		
		if(search==null)
			search="";
	%>

	<!-- 검색 -->
	<div class="container">
		<form action="./board.jsp" name="searchForm" method="post">
			<input type="text" name="searchText" placeholder="검색 내용"
				class="textField" value="<%=search%>"/>	
				<select name="selectBox" id="selectBox">
				<option value="0">작성자</option>
				<option value="1">글제목</option>
			</select> <input type="submit" value="검색" class="btn" />

		</form>
		<!-- 글쓰기 등록 -->
		<form action="./uploadContext.jsp" name="uploadForm" method="post">
			<input type="submit" value="글쓰기" class="btn" />
		</form>

	</div>
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
				String pn = (String)request.getParameter("page_number");
				int page_number = 0;
				if(pn != null)
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
				<td><%=one.getuserid()%></td>
				<td><a href="./detail.jsp?context_number=<%=context_number%>"><%=one.gettitle()%></a></td>
				<td><%=one.getWrite_time()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<div class="container">
		<%
			for(int i=0;i<(totalsize / 10) + 1; i++){
		%>
		<a href="./board.jsp?page_number=<%=i%>&searchText=<%=search%>"><%=i+1%></a>
		<%
			}
		%>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	<%@ include file="./footer.jsp"%>
</body>

<!-- 출처: https://tbbrother.tistory.com/69?category=308532 [밑끝없로그] -->
</html>
