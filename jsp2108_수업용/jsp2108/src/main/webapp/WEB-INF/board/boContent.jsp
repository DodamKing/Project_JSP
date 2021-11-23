<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<style>
	th {
		background: #ddd;
		text-align: center;
	}
	
	
</style>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2 class="text-center mb-5">게시글 개별 보기</h2>
		<table class="table table-bordered">
			<tr>
				<th>글쓴이</th>
				<td class="row">
					<div class="col">${vo.nickName }</div>
					<div class="col"><a href="boGood.bo?idx=${vo.idx }&pag=${pag}&pageSize=${pageSize}"> 👍 : ${vo.good } </a></div>
				</td>
				<th>글쓴날짜</th>
				<td>${fn:substring(vo.wDate, 0, 19) }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${vo.email }</td>
				<th>조회수</th>
				<td>${vo.readNum }</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td>
					<c:if test="${fn:length(vo.homePage) > 10 }"><a href="${vo.homePage }" target="_blank">${vo.homePage }</a></c:if>
					<c:if test="${fn:length(vo.homePage) <= 10 }">없음</c:if>
				</td>
				<th>접속IP</th>
				<td>${vo.hostIp }</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3">${vo.title }</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">글내용</th>
				<td colspan="3"style="height:200px;">
					${fn:replace(vo.content, newLine, '<br>') }
				</td>
			</tr>
			<tr>
				<td colspan="4" class="text-center">
					<c:if test="${sMid == vo.mid }">
						<input class="btn btn-primary" type="button" value="수정하기" onclick="location.href=''" />
						<input class="btn btn-primary" type="button" value="삭제하기" onclick="delCheck()" />
					</c:if>
					<input class="btn btn-primary" type="button" value="돌아가기" onclick="location.href='boList.bo?pag=${pag}&pageSize=${pageSize }'" />
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function delCheck() {
			let ans = confirm("게시글을 삭제 하시겠습니까?");
			if (ans) location.href="boDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
		}
	</script>
</body>
</html>