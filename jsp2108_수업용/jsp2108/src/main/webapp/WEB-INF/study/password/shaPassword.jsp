<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>시큐어리 해쉬 알고리즘 암호</h2>
		<div>
			암호화
			<input type="password" name="pwd" id="pwd" autofocus>
			<input type="button" value="암호화" onclick="passCheck()">
		</div>
		<div id="demo"></div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function passCheck() {
			let data = {
				pwd : $("#pwd").val()
			}
			
			$.ajax({
				type : "post",
				url : "shaPasswordOk.st",
				data : data,
				success : (data) => {
					let str = "비밀번호 : " + $("#pwd").val() + "<br>암호화 : " + data;
					$("#demo").html(str);
				}
			});
		}
	</script>
</body>
</html>