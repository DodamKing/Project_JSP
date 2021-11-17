<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>adMemberList</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<div class="container mt-5">
		<h2>전체 회원 리스트</h2>
		<div class="card-body">
			<table	class="table table-hover">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>별명</th>
					<th>성명</th>
					<th>성별</th>
					<th>방문횟수</th>
					<th>최종접속일</th>
					<th>등급</th>
					<th>정보공개</th>
					<th>탈퇴유무</th>
				</tr>
				<c:forEach var="vo" items="${vos}" >
					<tr>
						<td>${vo.idx}</td>
						<td>${vo.mid}</td>
						<td>${vo.nickName}</td>
						<td>${vo.userInfor == '공개' ? vo.name : ''}</td>
						<td>${vo.gender}</td>
						<td>${vo.visitCnt}</td>
						<td>${vo.lastDate}</td>
						<td>${vo.level}</td>
						<td>${vo.userInfor}</td>
						<td>${vo.userDel == 'OK' ? '탈퇴신청' : ''}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<!-- 푸터 -->
	
</body>
</html>