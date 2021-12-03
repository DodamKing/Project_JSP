<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>메일</title>
	<%@include file="/include/bs4.jsp" %>
	
	<style>
		.box {
			width: 100%;
			height: 80%;
			position: absolute;
		}
	
		.leftWindw {
			width: 25%;
			height: 500px;
			text-align: center;
			background-color: #99A799;
			float: left;
		}
		
		.rightWindw {
			left: 25%;
			width: 75%;
			height: 500px;
			text-align: left;
			background-color: #D3E4CD;
			overflow: auto;
		}
		
		footer {
			width: 100%;
			position: absolute;
			bottom: 0%;
		}
		
	</style>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5" style="position: relative;">
		<h2>내메일</h2>
		<div class="box">
			<div class="leftWindw">
				<div class="card-body">
						<div><a href="webMassage.wm?mSw=0&send=${mSw }">메세지작성</a></div>
						<div><a href="webMassage.wm?mSw=1">받은메일함</a></div>
						<div><a href="webMassage.wm?mSw=2">새메일함</a></div>
						<div><a href="webMassage.wm?mSw=3">보낸메일함</a></div>
						<div><a href="webMassage.wm?mSw=4">수신확인</a></div>
						<div><a href="webMassage.wm?mSw=5">휴지통</a></div>
						<div><a href="javascript:wmDeleteAll()">휴지통비우기</a></div>
				</div>
			</div>
			<div class="rightWindw">
				<div class="card-body">
					<div>
						<c:if test="${mSw == 0 }">
						<h3>메세지 작성</h3>
							<jsp:include page="wmInput.jsp" />
						</c:if
						>
						<c:if test="${mSw == 1 }">
						<h3>받은 메세지</h3>
							<jsp:include page="wmList.jsp" />
						</c:if>

						<c:if test="${mSw == 2 }">
						<h3>새 메세지</h3>
							<jsp:include page="wmList.jsp" />
						</c:if>

						<c:if test="${mSw == 3 }">
						<h3>보낸 메세지</h3>
							<jsp:include page="wmList.jsp" />
						</c:if>

						<c:if test="${mSw == 5 }">
						<h3>휴지통</h3>
							<jsp:include page="wmList.jsp" />
						</c:if>

						<c:if test="${mSw == 6 }">
						<h3>내용 보기</h3>
							<jsp:include page="wmContent.jsp" />
						</c:if>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<%-- 	<footer>
		<%@include file="/include/footer.jsp" %>
	</footer> --%>
	
	<script>
		function wmDeleteAll() {
			if (confirm("휴지통을 비우시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "wmDeleteAll.wm",
					success : () => {
						location.reload();
					}
				});
			}
		}
	</script>
</body>
</html>