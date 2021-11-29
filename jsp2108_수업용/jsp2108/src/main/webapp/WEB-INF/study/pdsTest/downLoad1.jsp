<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>downLoad</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>파일 다운로드 테스트</h2>
		<p>서버에 저장 되어 있는 파일 리스트</p>
		<p>${ctp}</p>
		<hr>
		<table class="table table-hover  text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>파일명</th>
				<th>미리보기</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="file" items="${files }" varStatus="st">
				<c:set var="fNameArr" value="${fn:split(file, '.') }" />
				<c:set var="extName" value="${fNameArr[fn:length(fNameArr) - 1]}" />
				<c:set var="extName" value="${fn:toLowerCase(extName)}" />
				<tr>
					<td>${st.count }</td>
					<td><a href="data/pdsTest/${file }" download="${file }">${file }</a></td>
					<td>
						<c:if test="${extName == 'jpg' || extName  == 'gif' || extName  == 'png'}"><img width="150px" src="data/pdsTest/${file }"></c:if>
					</td>
					<td><a href="fileDelete.st" class="btn btn-primary btn-sm">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a class="btn btn-primary mb-5" href="pdsTest1.st">돌아가기</a>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>