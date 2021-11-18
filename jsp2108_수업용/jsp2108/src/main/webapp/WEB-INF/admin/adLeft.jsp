<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>adLeft.jsp</title>
	<%@include file="/include/bs4.jsp" %>
	<style type="text/css">
		body {
			background-color: #ddd;
		}
	</style>
</head>
<body>
	<div class="container mt-5">
		<h4>메뉴</h4>
		<hr>
		<p><a href="${ctp}/adMemberList.ad" target="adContent">회원관리</a></p>
	</div>
	
	 <p><a href="${ctp}/" target="_top">돌아가기</a></p>
	
</body>
</html>