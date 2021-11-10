<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Date date = new Date();
	long time = date.getTime();
	
	String fileName = "outputFile_" + time + ".txt";
	PrintWriter writer = null;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>writeFormOk.jsp</title>
  <%@ include file="../include/bs4.jsp" %>
</head>
<body>
<%@ include file="../include/header_home.jsp" %>
<%@ include file="../include/nav.jsp" %>
<p><br></p>
<div class="container">
  <h2>파일 저장 내용 보여주기</h2>
  <%
  	try {
  		String filePath = application.getRealPath("/textFile/" + fileName);
  		writer = new PrintWriter(filePath);
  		writer.println("title " + title);
  		writer.println("");
  		writer.println("====================");
  		writer.println("");
  		writer.println("content " + content);
  		
  		out.println("<p>'" + filePath + "'<br> 에 저장되었습니다.</p>");
  		out.println("<p><a href='writeForm.jsp'>돌아가기</a></p>");
  	} catch (IOException e) {
  		out.println("ss");
  		out.println("<p><a href='writeForm.jsp'>돌아가기</a></p>");
  	} finally {
  		try {
  			writer.close();
  		} catch (Exception e) {
  			
  		}
  	}
  %>
</div>
<br>
<%@ include file="../include/footer.jsp" %>
</body>
</html>