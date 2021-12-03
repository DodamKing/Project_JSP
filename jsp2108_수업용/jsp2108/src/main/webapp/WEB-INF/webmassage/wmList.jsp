<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<body>
	<table class="table table-hover text-center">
		<tr>
			<th>번호</th>
			<c:if test="${mSw != 3 && mSw != 4 }">
				<th>보낸사람</th>
			</c:if>
			<c:if test="${mSw == 3 || mSw == 4 }">
				<th>받은사람</th>
			</c:if>
			<th>제목</th>
			<th>보낸날짜</th>
		</tr>
		<c:set var="no" value="${fn:length(vos) }" />
		<c:forEach var="vo" items="${vos }" varStatus="st">
			<tr onclick="javascript:href='webMassage.wm?mSw=6&idx=${vo.idx}'">
				<td class="text-center">${no }</td>
				<c:if test="${mSw != 3 && mSw != 4 }">
					<td>${vo.sendId }</td>
				</c:if>
				<c:if test="${mSw == 3 || mSw == 4 }">
					<td>${vo.receiveId }</td>
				</c:if>
				<td class="text-left">
					<c:if test="${vo.sendId == sMid && mSw == 5 }"><font color="red">[보낸메일]</font></c:if>
					<a href="webMassage.wm?mSw=6&idx=${vo.idx}&send=${mSw}">
						${vo.title }
						<c:if test="${vo.receiveSw == 'n' && (mSw == 1 || mSw == 2)}">(새메일)</c:if>
						<c:if test="${vo.receiveSw == 'n' && mSw == 3}">(안읽음)</c:if>
						<c:if test="${((vo.sendId == sMid && vo.sendSw == 'g') || (vo.receiveId == sMid && vo.receiveSw == 'g')) && mSw == 5 }">
							<input type="button" value="복구" onclick="location.href='webMassage.wm?mSw=7'" class="btn btn-secondary"/>
				  		</c:if>
					</a>
				</td>
				<td>${vo.sendDate }</td>
			</tr>
			<c:set var="no" value="${no - 1 }" />
		</c:forEach>
	</table>
</body>
</html>