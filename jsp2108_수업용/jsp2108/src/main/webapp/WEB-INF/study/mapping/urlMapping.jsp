<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>urlmapping.jsp</title>
	<%@include file="../../../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../../../include/header_home.jsp" %>
	<%@include file="../../../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>url mapping 연습</h2>
		<hr>
		<p><a href="<%=request.getContextPath() %>/URLMappingList" class="form-control btn btn-info">directory pattern으로 정보리스트 이동</a></p>
		<p><a href="<%=request.getContextPath() %>/urlMappingList.um" class="form-control btn btn-info">extesion pattern으로 정보리스트 이동</a></p>
		<p><a href="<%=request.getContextPath() %>/urlMappingInput.um" class="form-control btn btn-info">extesion pattern으로 정보리스트 등록</a></p>
		<p><a href="/" class="form-control btn btn-info">home</a></p>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../../../include/footer.jsp" %>
	
</body>
</html>