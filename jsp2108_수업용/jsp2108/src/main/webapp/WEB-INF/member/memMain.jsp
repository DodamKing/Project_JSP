<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>memMain.jsp</title>
	<%@include file="../../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../../include/header_home.jsp" %>
	<%@include file="../../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>로그인 된 페이지</h2>
		<hr>
		<%-- <p><font color="blue"><%=nick %> </font> 님 로그인 중이 십니다.</p> --%>
		<p><font color="blue">${sNick} </font> 님 로그인 중이 십니다.</p>
		<p>현재 <font color="gold">${sGrade} </font>  입니다.</p>
		<p>최종 접속일 : ${sLastDate}</p>
		<p>총 방문횟수 : </p>
		<p>오늘 방문횟수 : </p>
		<p>포인트 합계 : </p>
		<hr>
		<div>
			<p>활동 내역</p> 
			<p class="ml-3"> 전체 게시글: 개</p> 
			<p class="ml-3"> 방명록 자료 갯수 : 개</p> 
			<p class="ml-3"> 게시판 자료 갯수 : 개</p> 
			<p class="ml-3"> 자료실 업로드 횟수 : 개</p> 
		</div>
		<hr>
		
	</div>
	
	<!-- 푸터 -->
	<%@include file="../../include/footer.jsp" %>
	
</body>
</html>