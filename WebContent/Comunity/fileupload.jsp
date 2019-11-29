<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guguya</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="fileuploadProcess.jsp">
		<h1>개인 포트폴리오</h1>
		<p>제목 : <input type="text" name="title"> </p>
		<p>파일 : <input type="file" name="filename"></p>
		<!--<input type="hidden" name="directory" value="C://Users/yts02/OneDrive/바탕 화면/web_upload"> -->	
		<p><input type="submit" value="파일올리기">
	</form>
	
	<form method="post" enctype="multipart/form-data" action="fileuploadProcess.jsp">
		<h1>기업</h1>
		<p>제목 : <input type="text" name="title"> </p>
		<p>파일 : <input type="file" name="filename"></p>
		<!--<input type="hidden" name="directory" value="C://Users/yts02/OneDrive/바탕 화면/web_upload"> -->	
		<p><input type="submit" value="파일올리기">
	</form>

</body>
</html>