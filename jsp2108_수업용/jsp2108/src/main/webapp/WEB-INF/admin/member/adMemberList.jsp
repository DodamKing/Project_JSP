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
			<table	class="table table-hover  text-center">
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
				<c:choose>
					<c:when test="${vo.level == 2 }"><c:set var="level" value="정회원" /></c:when>
					<c:when test="${vo.level == 3 }"><c:set var="level" value="우수회원" /></c:when>
					<c:when test="${vo.level == 0 }"><c:set var="level" value="관리자" /></c:when>
					<c:otherwise><c:set var="level" value="준회원" /></c:otherwise>
				</c:choose>
					<tr>
						<td>${curScrStartNo}</td>
						<td>${vo.mid}</td>
						<td><a href="${ctp }/adMemberInfor.ad?idx=${vo.idx}">${vo.nickName}</a></td>
						<%-- <td>${vo.userInfor == '공개' ? vo.name : ''}</td> --%>
						<td>${vo.name}</td>
						<td>${vo.gender}</td>
						<td>${vo.visitCnt}</td>
						<td>${vo.lastDate}</td>
						<td>
							<form name="levelForm" method="post" action="${ctp}/adMemberLevel.ad">
								<select name="level" onchange="levelCheck()">
									<option value="1" <c:if test="${vo.level == 1 }">selected</c:if> >준회원</option>
									<option value="2" <c:if test="${vo.level == 2 }">selected</c:if>>정회원</option>
									<option value="3" <c:if test="${vo.level == 3 }">selected</c:if>>우수회원</option>
									<option value="0" <c:if test="${vo.level == 0 }">selected</c:if>>관리자</option>
								</select>
								<input type="hidden" name="idx" value="${vo.idx}"/>
								<button name="" class="btn btn-primary mt-2">변경</button>
							</form>
						</td>
						<td>${vo.userInfor}</td>
						<td>${vo.userDel == 'OK' ? '탈퇴신청' : ''}</td>
					</tr>
					<c:set var="curScrStartNo" value="${curScrStartNo - 1 }"></c:set>
				</c:forEach>
			</table>
		</div>
		<div class="col mt-5" style="text-align: right;">
				${pag }Page / ${totPage }/Page
				<c:if test="${pag != 1 }">
						<a class="btn btn-primary" href="${ctp }/adMemberList.ad?pag=1">처음</a>
				</c:if>
				<c:if test="${pag > 1 }">
						<a class="btn btn-primary" href="adMemberList.ad?pag=${pag - 1 }">이전페이지</a>
				</c:if>
				<c:if test="${pag < totPage }">
						<a class="btn btn-primary" href="adMemberList.ad?pag=${pag + 1 }">다음페이지</a>
				</c:if>
				<c:if test="${pag != totPage }">
						<a class="btn btn-primary" href="adMemberList.ad?pag=${totPage }">마지막</a>
				</c:if>
		</div>
	</div>
	
	<script>
		function levelCheck() {
			alert("회원정보를 변경하시려면, '등급변경' 버튼을 클릭하세요.")
		}
	</script>	
</body>
</html>