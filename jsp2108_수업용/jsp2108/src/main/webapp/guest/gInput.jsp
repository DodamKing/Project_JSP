<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../include/header_home.jsp" %>
	<%@include file="../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>방명록 글쓰기</h2>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/GInputOk" >
			<p>성명 : <input type="text" name="name" autofocus required /></p>
			<p>이메일 : <input type="text" name="email" required value="http://" /></p>
			<p>홈페이지 : <input type="text" name="homepage" /></p>
			<p>내용 : <textarea rows="5" cols="60" name="content" required ></textarea></p>
			<p>
				<button type="submit" class="btn btn-secondary">방명록 등록</button>
				<button type="reset" class="btn btn-secondary">방명록 다시입력</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='gList.jsp'">돌아가기</button>
			</p>
			<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr() %>" />
		</form>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>