<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>adContent.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	
	<div class="container mt-5">
		<h2>작업상황</h2>
		<hr/>
	  	<p><a href="${ctp}/adMemberList.ad?level=1">새로운 가입자(<font color="red"><b> ${newMember }</b></font> 건)</a></p>  <!-- 준회원이 있을경우 인원출력 -->
	  	<hr/>
	  	<p><a href="#">최근 게시글( <font color="red"><b> xx</b></font> 건)</a></p>	<!-- 최근 게시글 5건 보기 -->
	  	<hr/>
	  	<p><a href="#">최근 댓글( <font color="red"><b>xx</b></font> 건)</a></p>	
	  	<hr/>
	  	<p><a href="#">문의사항(<font color="red"><b> xx</b></font> 건)</a></p>
	  	<hr/>
	  	<p><a href="#">XXXXXXXX</a></p>
	  	<hr/>
	  	<p>오늘 방문 횟수 : <font color="red">xx</font></p>
	</div>
	
	<!-- 푸터 -->
</body>
</html>