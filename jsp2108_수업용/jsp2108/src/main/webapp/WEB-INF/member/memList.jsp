<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>memList.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<div class="container mt-5">
	<div style="padding:10px 0px;">
		<form name="myForm">
      		<table class="table table-borderless" style="width:100%;margin:0px;padding:0px;">
		        <tr>
		          <td style="text-align:left">
		            <input type="text" name="mid" placeholder="검색할아이디입력"/>
		            <input type="button" value="개별검색" onclick="midSearch()"/>
		            <input type="button" value="전체검색" onclick="javascript:location.href='memList.ad';"/>
		          </td>
			      </tr>
	    	</table>
		</form>
	</div>
		<h2>회원 리스트</h2>
		<div class="card-body">
			<table	class="table table-hover  text-center">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>별명</th>
					<th>성명</th>
					<th>성별</th>
				</tr>
				<c:forEach var="vo" items="${vos}" >
					<tr>
						<td>${curScrStartNo}</td>
						<td><a href="memInfor.ad?idx=${vo.idx }">${vo.mid}</a></td>
						<%-- <td><a href="${ctp }/adMemberInfor.ad?idx=${vo.idx}">${vo.nickName}</a></td> --%>
						<td>${vo.nickName}</td>
						<td>
							<c:if test="${vo.userInfor == '공개' }">${vo.name}</c:if>
							<c:if test="${vo.userInfor == '비공개' }">비공개</c:if>
						</td>
						<td>
							<c:if test="${vo.userInfor == '공개' }">${vo.gender}</c:if>
							<c:if test="${vo.userInfor == '비공개' }">비공개</c:if>
						</td>
					</tr>
					<c:set var="curScrStartNo" value="${curScrStartNo - 1 }"></c:set>
				</c:forEach>
			</table>
		</div>
		<div class="col mt-5" style="text-align: right;">
				${pag }Page / ${totPage }Page
				<c:if test="${pag != 1 }">
						<a class="btn btn-primary" href="memList.ad?pag=1&mid=${mid}">처음</a>
				</c:if>
				<c:if test="${pag > 1 }">
						<a class="btn btn-primary" href="memList.ad?pag=${pag - 1 }&mid=${mid}">이전페이지</a>
				</c:if>
				<c:if test="${pag < totPage }">
						<a class="btn btn-primary" href="memList.ad?pag=${pag + 1 }&mid=${mid}">다음페이지</a>
				</c:if>
				<c:if test="${pag != totPage }">
						<a class="btn btn-primary" href="memList.ad?pag=${totPage }&mid=${mid}">마지막</a>
				</c:if>
		</div>
	</div>
	
	<script>
		 function midSearch() {
		    	var mid = myForm.mid.value;
		    	if(mid == "") {
		    		alert("아이디를 입력하세요.");
		    		myForm.mid.focus();
		    	}
		    	else {
		    		location.href="memList.ad?mid="+mid;
		    	}
		    }
	</script>	
</body>
</html>