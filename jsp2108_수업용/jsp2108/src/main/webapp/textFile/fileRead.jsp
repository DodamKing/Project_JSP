<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<div class="container mt-5">
		<h2>파일 읽기</h2>
		<%
			BufferedReader reader = null;
			try {
				String filePath = application.getRealPath("/textFile/inputFile.txt");
				reader = new BufferedReader(new FileReader(filePath));
				
				while (true) {
					String str = reader.readLine();
					if (str == null) break;
					out.println(str + "<br>");
				}
			} catch (FileNotFoundException e) {
				out.println("파일이 없습니다.");
			} catch (IOException e) {
				out.println("파일을 읽을 수 없습니다.");
			} finally {
				try {
					reader.close();
				} catch (Exception e) {}
			}
		%>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>