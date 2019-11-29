<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ page import="guguya.fileBean"%>
<%@ page import="guguya.fileMigrate"%>
<jsp:useBean id="upload" class="guguya.fileMigrate"></jsp:useBean>
<jsp:useBean id="bean" class="guguya.fileBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String msg = "파일 저장에 실패하였습니다";
	
	// fileupload에서 directory 넘겨줌
	String directory = (String)request.getParameter("directory");
	System.out.println("directory = " + directory);
	//MultipartRequest multi = new MultipartRequest(request, directory, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	// 경로 수정
	MultipartRequest multi = new MultipartRequest(request, "C://Users/yts02/OneDrive/바탕 화면/web_upload", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	Enumeration params = multi.getParameterNames();

	while (params.hasMoreElements()) {
		String name = (String) params.nextElement();
		String value = multi.getParameter(name);
		out.println(name + " = " + value + "<br>");
	}
	out.println("-----------------------------------<br>");

	Enumeration files = multi.getFileNames();

	while (files.hasMoreElements()) {
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
		File file = multi.getFile(name);

		out.println("요청 파라미터 이름 : " + name + "<br>");
		out.println("실제 파일 이름 : " + original + "<br>");
		out.println("저장 파일 이름 : " + filename + "<br>");
		out.println("파일 콘텐츠 유형 : " + type + "<br>");

		if (file != null) {
			out.println(" 파일 크기 : " + file.length());
			out.println("<br>");
		}
		
		// 경로 수정하기
		String fileDB = "C://Users/yts02/OneDrive/바탕 화면/web_upload/" + filename;
		bean.setfilename(fileDB);
		if(upload.fileUpload(bean) == true){
			msg = "파일 업로드 성공 ";
		};
	}
	%>
	
	<script>
	<!--메세지 출력-->
	alert("<%=msg%>");	
</script>
</body>
</html>