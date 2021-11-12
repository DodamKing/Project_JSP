<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="../../../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../../../include/header_home.jsp" %>
	<%@include file="../../../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>이곳은 pass.jsp</h2>
		<p>비밀번호를 입력하세요</p>
		<form name="myform" method="post" >
			<table class="table table-bordered mt-5">
				<tr>
					<td>
						<p>아이디 <input type="text" name="mid" value="hkd1234" class="form-control"></p>
						<p>비밀번호 <input type="password" name="pwd" maxlength="9" autofocus class="form-control"></p>
					</td>
				</tr>
			</table>
		</form>
		<div class="text-right mb-5">
			<input type="button" value="확인(숫자)" onclick="fCheck(1)" class="btn btn-secondary ">
			<input type="button" value="확인(혼합)" onclick="fCheck(2)" class="btn btn-secondary ">
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../../../include/footer.jsp" %>
	
	<script>
		function fCheck(idx) {
			if (idx == 1) {
				let pwd = myform.pwd.value;
				if (pwd.trim() == "") {
					alert("비밀번호를 입력하세요.");
					myform.pwd.focus();
				}
				else {
					myform.action = "<%=request.getContextPath() %>/passwordOk";
					myform.submit();
				}
			}
			else {
				let pwd = myform.pwd.value;
				if (pwd.trim() == "") {
					alert("비밀번호를 입력하세요.");
					myform.pwd.focus();
				}
				else {
					myform.action = "<%=request.getContextPath() %>/passwordOk2";
					myform.submit();
				}
			}
		}
		
	</script>
</body>
</html>