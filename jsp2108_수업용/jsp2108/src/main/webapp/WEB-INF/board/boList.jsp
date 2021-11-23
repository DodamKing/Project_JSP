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
		<h2 class="text-center">게시판 글 목록</h2>
		<div class="card-body">
			<table class="table table-borderless text-right">
				<tr>
					<td>
	    				<select id="pageSize" name="pageSize" onchange="pageCheck()" class="p-0 m-0">
			          		<option value="5" ${pageSize==5 ? 'selected' : ''}>5건</option>
		          			<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
			          		<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
			          		<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
			        	</select>
			      	</td>
				</tr>
				<tr>
					<td>
						<a href="boInput.bo" class="btn btn-primary">글쓰기</a>
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
						<a href="boContent.bo?idx=${vo.idx }&pag=${pag}&pageSize=${pageSize}">${vo.title }</a>
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
		<%-- <div class="col mt-1 text-center" >
			<c:if test="${pag != 1 }">
					<a class="btn btn-primary btn-sm" href="boList.bo?pag=1">처음</a>
			</c:if>
			<c:if test="${curBlock > 0 }">
					<a class="btn btn-primary btn-sm"" href="boList.bo?pag=${(curBlock - 1) * blockSize + 1 }">이전블록</a>
			</c:if>
			<c:if test="${pag > 1 }">
					<a class="btn btn-primary" href="boList.bo?pag=${pag - 1 }">이전페이지</a>
			</c:if>
			<c:if test="${pag < totPage }">
					<a class="btn btn-primary" href="boList.bo?pag=${pag + 1 }">다음페이지</a>
			</c:if>
			<c:if test="${curBlock < lastBlock }">
					<a class="btn btn-primary btn-sm"" href="boList.bo?pag=${(curBlock + 1) * blockSize + 1 }">다음블록</a>
			</c:if>
			<c:if test="${pag != totPage }">
					<a class="btn btn-primary btn-sm"" href="boList.bo?pag=${totPage }">마지막</a>
			</c:if>
		</div>
		<div class="text-center mt-1">
			<c:forEach var="i" begin="${curBlock * blockSize + 1 }" end="${curBlock * blockSize + blockSize }">
				<c:if test="${i == pag && i <= totPage }">
					<a href="boList.bo?pag=${i }"><font color="red"><b>[${i }]</b></font></a>
				</c:if>
				<c:if test="${i != pag && i <= totPage }">
					<a href="boList.bo?pag=${i }">[${i }]</a>
				</c:if>
			</c:forEach>
			
			${pag }Page / ${totPage }Page
		</div> --%>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="boList.bo?pag=1&pageSize=${pageSize }">처음</a></li>
			<li class="page-item"><a class="page-link" href="boList.bo?pag=${(curBlock - 1) * blockSize + 1 }&pageSize=${pageSize }">Prev</a></li>
		<c:forEach var="i" begin="${curBlock * blockSize + 1 }" end="${curBlock * blockSize + blockSize }">
			<c:if test="${i == pag && i <= totPage }">
				<li class="page-item active"><a class="page-link" href="boList.bo?pag=${i }&pageSize=${pageSize }">${i }</a></li>
			</c:if>
			<c:if test="${i != pag && i <= totPage }">
				<li class="page-item"><a class="page-link" href="boList.bo?pag=${i }&pageSize=${pageSize }">${i }</a></li>
			</c:if>
		</c:forEach>
			<li class="page-item"><a class="page-link" href="boList.bo?pag=${(curBlock + 1) * blockSize + 1 }&pageSize=${pageSize }">Next</a></li>
			<li class="page-item"><a class="page-link" href="boList.bo?pag=${totPage }&pageSize=${pageSize }">마지막</a></li>
		</ul>
	</div>
	
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function pageCheck() {
			var pageSize = document.getElementById("pageSize").value;
	    	location.href = "boList.bo?page=${pag}&pageSize="+pageSize;
		}
	</script>
</body>
</html>