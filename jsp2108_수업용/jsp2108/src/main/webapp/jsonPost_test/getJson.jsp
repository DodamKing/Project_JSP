<%@page import="java.util.Map"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mysql.cj.xdevapi.JsonString"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");

	Gson gson = new Gson();
	JsonObject jsonObject = new JsonObject();
	String song_json = request.getParameter("song_json");
	Map<String, Object> map = gson.fromJson(song_json, Map.class);
	for (Map.Entry<String, Object> entry : map.entrySet()) {
		System.out.println(entry.getKey() + "=" + entry.getValue());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../include/header_home.jsp" %>
	<%@include file="../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>제목줄</h2>

	</div>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>