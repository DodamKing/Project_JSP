<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시판</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5 mb-5">
		<h2 class="text-center">게시판 글 목록</h2>
		<div class="card-body">
			<table class="table table-borderless text-right">
				<tr>
					<td>
						<a href="boInput.bo" class="btn btn-primary">글쓰기</a>
					</td>
				</tr>
			</table>
			<table class="table text-center">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>글쓴날짜</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>		
				<c:forEach var="vo" items="${vos }">
				<tr>
					<td>${vo.idx }</td>
					<td>${vo.title }</td>
					<td>${vo.nickName }</td>
					<td>${vo.wDate }</td>
					<td>${vo.readNum }</td>
					<td>${vo.goods }</td>
				</tr>		
				</c:forEach>
			</table>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>