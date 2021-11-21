<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<%
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>adMemberInfor.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<div class="container mt-5">
		<h2>회원 정보</h2>
		<div class="card-body">
			<table class="table">
				<tr><td>아이디 : ${vo.mid }</td></tr>
				<tr><td>닉네임 : ${vo.nickName }</td></tr>
				<tr><td>성명 : ${vo.name }</td></tr>
				<tr><td>성별 : ${vo.gender }</td></tr>
				<tr><td>생일 : ${fn:substring(vo.birthday, 0, 10)}</td></tr>
				<tr><td>전화번호 : ${vo.tel }</td></tr>
				<tr><td>주소 : ${vo.address }</td></tr>
				<tr><td>이메일 : ${vo.email }</td></tr>
				<tr><td>홈페이지 : ${vo.homePage }</td></tr>
				<tr><td>직업 : ${vo.job }</td></tr>
				<tr><td>취미 : ${vo.hobby }</td></tr>
				<tr><td>사진 : <img src="img/${vo.photo }" width="100px"></td></tr>
				<tr><td>자기소개 : <div style="display:inline-block;"> ${fn:replace(vo.content, newLine, "<br>")} </div> </td></tr>
				<tr><td>정보공개 : ${vo.userInfor }</td></tr>
				<tr>
					<c:if test="${vo.userDel eq 'OK'}"><td>탈퇴신청 : 탈퇴신청</td></c:if>
					<c:if test="${vo.userDel eq 'NO'}"><td>탈퇴신청 : 활동중</td></c:if>
				</tr>
				<%-- <tr><td>탈퇴여부 : ${vo.userDel }</td></tr> --%>
				<tr><td>포인트 :<fmt:formatNumber value="${vo.point }" /></td></tr>
				<tr>
					<c:choose>
						<c:when test="${vo.level == 2 }"><c:set var="level" value="정회원" /></c:when>
						<c:when test="${vo.level == 3 }"><c:set var="level" value="우수회원" /></c:when>
						<c:when test="${vo.level == 0 }"><c:set var="level" value="관리자" /></c:when>
						<c:otherwise><c:set var="level" value="준회원" /></c:otherwise>
					</c:choose>
					<td>등급 : ${level }</td>
				</tr>
				<tr><td>방문횟수 : ${vo.visitCnt }</td></tr>
				<tr><td>가입일 : ${vo.startDate }</td></tr>
				<tr><td>최종접속일 : ${vo.lastDate }</td></tr>
				<tr><td>today : ${vo.todayCnt }</td></tr>
			</table>
		</div>
		<a href="memList.ad" class="btn btn-primary">돌아가기</a>
	</div>

</body>
</html>