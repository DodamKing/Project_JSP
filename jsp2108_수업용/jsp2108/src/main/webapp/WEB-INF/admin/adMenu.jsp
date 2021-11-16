<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>adMenu.jsp</title>
	<%@include file="../../include/bs4.jsp" %>
	<frameset cols="120px, *">
		<frame src="<%=request.getContextPath() %>/adLeft.ad" name="adLeft" frmeboard="0">
		<frame src="<%=request.getContextPath() %>/adContent.ad" name="adContent" frmeboard="0">
	</frameset>
</head>
<body>
	<!-- 헤더영역 -->
	
	<div class="container mt-5">
		<h2>관리자 메뉴</h2>
	</div>
	
	<!-- 푸터 -->
	
</body>
</html>