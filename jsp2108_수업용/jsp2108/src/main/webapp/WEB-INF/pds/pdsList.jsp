<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>pdsList.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<div class="card-body">
			<h2>자료실 리스트 (${part })</h2>
			<table class="table table-dark mt-5">
				<tr>
					<td>
						<form style="width: 100px;" name="partForm">
							<select name="part" onchange="partCheck()" class="form-control">
								<option value="전체" <c:if test="${part == '전체' }">selected</c:if>>전체</option>
								<option value="학습" <c:if test="${part == '학습' }">selected</c:if>>학습</option>
								<option value="여행" <c:if test="${part == '여행' }">selected</c:if>>여행</option>
								<option value="음식" <c:if test="${part == '음식' }">selected</c:if>>음식</option>
								<option value="기타" <c:if test="${part == '기타' }">selected</c:if>>기타</option>
							</select> 
						</form>
					</td>
					<td class="text-right"><a href="pdsInput.pds" class="btn btn-warning">업로드</a></td>
				</tr>
			</table>
			<table class="table table-hover text-center">
				<tr class="table table-dark table-bordered">
					<th>번호</th>
					<th>제목</th>
					<th>올린이</th>
					<th>업로드날짜</th>
					<th>파일명</th>
					<th>다운수</th>
					<th>비고</th>
				</tr>
				<c:forEach var="vo" items="${vos }" >
					<tr>
						<td style="vertical-align: middle;">${curScrStartNo }</td>
						<td style="vertical-align: middle;" class="text-left">
							${vo.title }
							<c:if test="${vo.wNdate <= 24 }"><img src="img/new.gif"></c:if>
						</td>
						<td style="vertical-align: middle;">${vo.nickName }</td>
						<td style="vertical-align: middle;">
							<c:if test="${vo.wNdate <= 24 }">${fn:substring(vo.fDate, 11, 19) }</c:if>
							<c:if test="${vo.wNdate > 24 }">${fn:substring(vo.fDate, 0, 10) }</c:if>
						</td>
						<td class="text-left">
							<c:set var="fNames" value="${fn:split(vo.fName, '/') }" />
							<c:forEach var="fName" items="${fNames }">
								${fName }<br>
							</c:forEach>
							(<fmt:formatNumber value="${vo.fSize / 1024 }" pattern="#,###" />KByte)
						</td>
						<td style="vertical-align: middle;">${vo.downNum }</td>
						<td style="vertical-align: middle;"><a href="" class="btn btn-warning btn-sm">삭제</a></td>
					</tr>
					<c:set var="curScrStartNo" value="${curScrStartNo - 1 }" />
				</c:forEach>
			</table>
			
		</div>
		
		
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link text-warning" href="pdsList.pds?pag=1&part=${part }">처음</a></li>
			<li class="page-item"><a class="page-link text-warning" href="pdsList.pds?pag=${(curBlock - 1) * blockSize + 1 }&part=${part }">Prev</a></li>
			<c:forEach var="i" begin="${curBlock * blockSize + 1 }" end="${curBlock * blockSize + blockSize }">
				<c:if test="${i == pag && i <= totPage }">
					<li class="page-item active text-warning"><a class="page-link bg-warning" href="pdsList.pds?pag=${i }&part=${part }">${i }</a></li>
				</c:if>
				<c:if test="${i != pag && i <= totPage }">
					<li class="page-item"><a class="page-link text-warning" href="pdsList.pds?pag=${i }&part=${part }">${i }</a></li>
				</c:if>
			</c:forEach>
			<li class="page-item"><a class="page-link text-warning" href="pdsList.pds?pag=${(curBlock + 1) * blockSize + 1 }&part=${part }">Next</a></li>
			<li class="page-item"><a class="page-link text-warning" href="pdsList.pds?pag=${totPage }&part=${part }">마지막</a></li>
		</ul>
		
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function partCheck() {
			let part = partForm.part.value;
			location.href = "pdsList.pds?part=" + part + "&pag=" + ${pag};
		}
	</script>
</body>
</html>