<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>스케줄</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>스케줄</h2>
		<div class="card-dody">
			<form action="scContentOk.sc" method="post" name="myform">
				<div class="form-group">
					<div class="input-group text-center">
						<div class="input-group-prepend btn btn-warning" style="width: 100px;">일정날짜</div>
						<input type="text" class="form-control" name="sDate" id="sDate" value="${ymd }" readonly >
					</div>
				</div>
				<div class="form-group">
					<div class="input-group text-center">
						<div class="input-group-prepend btn btn-warning" style="width: 100px;">이름</div>
						<input type="text" class="form-control" name="sDate" id="sDate" value="${sNick }" readonly >
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning" style="width: 100px;">분류</div>
						<select name="part" id="part" class="form-control">
							<option value="모임" ${vo.part == "모임" ? "selected" : "" }>모임</option>
							<option value="업무" ${vo.part == "업무" ? "selected" : "" }>업무</option>
							<option value="학습" ${vo.part == "학습" ? "selected" : "" }>학습</option>
							<option value="여행" ${vo.part == "여행" ? "selected" : "" }>여행</option>
							<option value="기타" ${vo.part == "기타" ? "selected" : "" }>기타</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning " style="width: 100px;">내용</div>
						<textarea rows="5" class="form-control" name="content" id="content"  >${vo.content }</textarea>
					</div>
				</div>
				<input type="hidden" name="idx" value="${vo.idx }">
				<div class="form-group">
					<div class="input-group">
						<c:if test="${empty vo.content }"><input type="button" value="일정등록" onclick="fCheck()" class="btn btn-warning form-control"></c:if>
						<input type="reset" value="다시쓰기" class="btn btn-warning form-control">
						<c:if test="${!empty vo.content }">
							<input type="button" value="일정수정" onclick="fCheck()" class="btn btn-warning form-control">
							<input type="button" value="일정삭제" onclick="delCheck()" class="btn btn-warning form-control">
						</c:if>
							<input type="button" value="돌아가기" onclick="location.href='schedule.sc?ymd=${ymd}'" class="btn btn-warning form-control">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function fCheck() {
			if (content.value == "") {
				myform.content.focus();
				return;
			}
			
			myform.submit();
		}
		
		function delCheck() {
			if (confirm("일정을 삭제 하시겠습니까?")) {
				location.href="scDelete.sc?idx=${vo.idx}&ymd=${ymd}"
			}
		}
	</script>
	
</body>
</html>