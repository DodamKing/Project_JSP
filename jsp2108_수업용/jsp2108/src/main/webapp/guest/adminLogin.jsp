<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>admin</title>
	<%@include file="../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../include/header_home.jsp" %>
	<%@include file="../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>관리자 인증창</h2>
		<form name="myform" method="post" action="adminLoginOk.jsp">
			<table class="table">
				<tr>
					<th>관리자아이디</th>
					<td><input type="text" name="mid" required autofocus></td>
				</tr>
				<tr>
					<th>관리자비밀번호</th>
					<td><input type="password" name="pwd" required autofocus></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="관리자로그인" class="btn btn-secondary" >
						<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='gList.jsp'" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>