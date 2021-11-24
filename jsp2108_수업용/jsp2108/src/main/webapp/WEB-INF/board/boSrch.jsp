<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<h2 class="text-center">검색 글 목록</h2>
		(<font color="blue" size="5px">${srchTitle }</font> (으)로 <font color="blue" size="5px">${srchString }</font> (을)를 검색한 결과 <font color="red" size="5px">${srchCnt }</font>건이 검색되었습니다.)
		<div class="card-body">
			<table class="table table-borderless text-right">
				<tr>
					<td>
						<div class="text-left ml-3">
							<form name="srchForm" method="post" action="boSearch.bo">
								<select name="srch" onchange="srchChange()">
									<option value="title">글제목</option>
									<option value="nickName">글쓴이</option>
									<option value="content">글내용</option>
								</select>
								<input type="text" name="srchString" >
								<input type="button" value="검색" onclick="srchCheck()" >
								<input type="hidden" name="pag" value="${pag }" >
      							<input type="hidden" name="pagSize" value="${pagSize }" >
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="boList.bo" class="btn btn-primary">돌아가기</a>
					</td>
				
				</tr>
			</table>
			<table class="table text-center">
				<tr>
					<th>번호</th>
					<th style="width: 350px;">제목</th>
					<th>글쓴이</th>
					<th>글쓴날짜</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>
				<c:forEach var="vo" items="${vos }">
				<tr>
					<td>${curScrStartNo }</td>
					<td style="text-align: left;">
						<a href="boContent.bo?idx=${vo.idx }&pag=${pag}&pageSize=${pageSize}&sw=srch">${vo.title }</a>
						<c:if test="${vo.wNdate <= 24 }"><img src="img/new.gif"></c:if>
					</td>
					<td>${vo.nickName }</td>
					<td>
						<c:if test="${vo.wNdate <= 24 }">${fn:substring(vo.wDate, 11, 19) }</c:if>
						<c:if test="${vo.wNdate > 24 }">${fn:substring(vo.wDate, 0, 10) }</c:if>
					</td>
					<td>${vo.readNum }</td>
					<td>${vo.good }</td>
				</tr>		
				<c:set var="curScrStartNo" value="${curScrStartNo -1 }" />		
				</c:forEach>
			</table>
		</div>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="boSearch.bo?pag=1&pageSize=${pageSize }&srch=${srch}&srch=${srchString}">처음</a></li>
			<li class="page-item"><a class="page-link" href="boSearch.bo?pag=${(curBlock - 1) * blockSize + 1 }&pageSize=${pageSize }&srch=${srch}&srchString=${srchString}">Prev</a></li>
		<c:forEach var="i" begin="${curBlock * blockSize + 1 }" end="${curBlock * blockSize + blockSize }">
			<c:if test="${i == pag && i <= totPage }">
				<li class="page-item active"><a class="page-link" href="boSearch.bo?pag=${i }&pageSize=${pageSize }&srch=${srch}&srchString=${srchString}">${i }</a></li>
			</c:if>
			<c:if test="${i != pag && i <= totPage }">
				<li class="page-item"><a class="page-link" href="boSearch.bo?pag=${i }&pageSize=${pageSize }&srch=${srch}&srchString=${srchString}">${i }</a></li>
			</c:if>
		</c:forEach>
			<li class="page-item"><a class="page-link" href="boSearch.bo?pag=${(curBlock + 1) * blockSize + 1 }&pageSize=${pageSize }&srch=${srch}&srchString=${srchString}">Next</a></li>
			<li class="page-item"><a class="page-link" href="boSearch.bo?pag=${totPage }&pageSize=${pageSize }&srch=${srch}&srchString=${srchString}">마지막</a></li>
		</ul>
	</div>
	
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function srchChange() {
			srchForm.srchString.focus();
		}
		
		function srchCheck() {
			let srch = $("#srchString").val();
			if (srch == "") {
				return;
			}
			srchForm.submit();
		}
		
	</script>
</body>
</html>