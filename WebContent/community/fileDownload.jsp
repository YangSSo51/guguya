<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// ① 파일명 가져오기
		String fileName = request.getParameter("filename");

		// ② 경로 가져오기
		//String saveDir = this.getServletContext().getRealPath("/file/");

		
		String saveDir = "C://upload/"; // 경로 수정
		System.out.println("파일경로 : " + saveDir);
		File file = new File(saveDir + fileName);
		System.out.println("파일명 : " + fileName);

		// ③ MIMETYPE 설정하기
		String mimeType = getServletContext().getMimeType(file.toString());
		if (mimeType == null) {
			response.setContentType("application/octet-stream");
		}

		// ④ 다운로드용 파일명을 설정
		String downName = null;
		if (request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");
		} else {
			downName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}

		// ⑤ 무조건 다운로드하도록 설정
		response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\";");

		// ⑥ 요청된 파일을 읽어서 클라이언트쪽으로 저장한다.
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();

		byte b[] = new byte[1024];
		int data = 0;

		while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {
			servletOutputStream.write(b, 0, data);
		}

		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	%>

</body>
</html>