<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<style>
	th {
		background: #ddd;
		text-align: center;
	}
	
	div.container > div:hover {
		cursor: pointer;
	}
	
	#good3:hover {
		cursor: pointer;
	}
	
	
</style>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2 class="text-center mb-5">게시글 개별 보기</h2>
		<div class="text-right" onclick="goodCheck()" title="좋아요">💗(ajax로 처리) : ${vo.good } </div>
		<table class="table table-bordered">
			<tr>
				<th>글쓴이</th>
				<td class="row">
					<div class="col-6">${vo.nickName }</div>
					<div class="col"><a href="boGood.bo?idx=${vo.idx }&pag=${pag}&pageSize=${pageSize}&sw=good"> 👍(확장자패턴) : ${vo.good } </a></div>
				</td>
				<th>글쓴날짜</th>
				<td>${fn:substring(vo.wDate, 0, 19) }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${vo.email }</td>
				<th>조회수</th>
				<td>${vo.readNum }</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td>
					<c:if test="${fn:length(vo.homePage) > 10 }"><a href="${vo.homePage }" target="_blank">${vo.homePage }</a></c:if>
					<c:if test="${fn:length(vo.homePage) <= 10 }">없음</c:if>
				</td>
				<th>접속IP</th>
				<td>${vo.hostIp }</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3">
					<div class="row">
						<div class="col">${vo.title }</div>
						<div id="good3" class="col-3" onclick="goodCheck2()"> 😍(취소기능추가) : ${vo.good } </div>
					</div>
				</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">글내용</th>
				<td colspan="3"style="height:200px;">
					${fn:replace(vo.content, newLine, '<br>') }
				</td>
			</tr>
			<tr>
				<td colspan="4" >
					<div class="row">
						<div class="col">
							<c:if test="${sMid == vo.mid }">
								<input class="btn btn-primary" type="button" value="수정하기" onclick="location.href='boUpdate.bo?idx=${vo.idx}&page=${pag }&pageSize=${pageSize }'" />
								<input class="btn btn-primary" type="button" value="삭제하기" onclick="delCheck()" />
							</c:if>
						</div>
						<div class="col-4 text-right">
							<c:if test="${sw != 'srch' && sw != 'good' }">
								<c:if test="${voPrev != null }">
									<input title="${voPrev.title}" class="btn btn-primary" type="button" value="이전글" onclick="location.href='boContent.bo?idx=${voPrev.idx }&pag=${pag}&pageSize=${pageSize }'" />
								</c:if>
								<c:if test="${voNext != null }">
									<input title="${voNext.title}" class="btn btn-primary" type="button" value="다음글" onclick="location.href='boContent.bo?idx=${voNext.idx }&pag=${pag}&pageSize=${pageSize }'" />
								</c:if>
								<input class="btn btn-primary" type="button" value="돌아가기" onclick="location.href='boList.bo?pag=${pag}&pageSize=${pageSize }'" />
							</c:if>
							<c:if test="${sw == 'srch' }">
								<input class="btn btn-primary" type="button" value="돌아가기" onclick="history.back()" />
							</c:if>
							<c:if test="${sw == 'good' }">
								<input class="btn btn-primary" type="button" value="돌아가기" onclick="history.go(-2)" />
							</c:if>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function delCheck() {
			let ans = confirm("게시글을 삭제 하시겠습니까?");
			if (ans) location.href="boDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
		}
		
		function goodCheck() {
			let query = {
					idx : ${vo.idx}
			}
			
			$.ajax({
				type : "post",
				url : "bogood",
				data : query,
				success : (data) => {
					if (data == "1") {
						location.reload();
					}
					else if (data == "0") {
						alert("벌써 좋아요를 누르셨습니다.");
					}
				}
			})
		}
		
		function goodCheck2() {
			let query = {
					idx : ${vo.idx}
			}
			
			$.ajax({
				type : "post",
				url : "bogoodTwo",
				data : query,
				success : (data) => {
					if (data == "1") {
						location.reload();
					}
					else if (data == "0") {
						alert("벌써 좋아요를 누르셨습니다.");
					}
				}
			})
		}
	</script>
</body>
</html>