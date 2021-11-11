<%@page import="study.mapping2.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<UserVO> vos = (List<UserVO>) request.getAttribute("vos");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>urlMappingList</title>
	<%@include file="../../../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../../../include/header_home.jsp" %>
	<%@include file="../../../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>사용자 정보 리스트</h2>
		<div>
			<table class="table table-striped">
				<tr>
					<th>번호</th>
					<th>성명</th>
					<th>나이</th>
					<th>비고</th>
				</tr>
				<%
					for (UserVO vo : vos) {
				%>
				<tr>
					<td><%=vo.getIdx() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getAge() %></td>
					<td>
						<a href="javascript:delCheck(<%=vo.getIdx() %>)" class="btn btn-primary btn-sm">삭제</a>
						<a href="<%=request.getContextPath() %>/urlMappingUpdate.um?idx=<%=vo.getIdx() %>" class="btn btn-primary btn-sm">수정</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="mb-5">
			<button class="btn btn-secondary mr-2" type="button" onclick="location.href='<%=request.getContextPath() %>/urlMappingInput.um';">정보등록</button>
			<button class="btn btn-secondary" type="button" onclick="location.href='<%=request.getContextPath() %>/urlMapping.um';">돌아가기</button>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../../../include/footer.jsp" %>
	
	<script>
		function delCheck(idx) {
			let ans = confirm("삭제하시겠습니까?");
			if (ans) {
				location.href = "<%=request.getContextPath() %>/urlMappingDelete.um?idx=" + idx;
			}
		}
	</script>
</body>
</html>