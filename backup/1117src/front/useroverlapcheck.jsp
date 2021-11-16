<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int res = (int) request.getAttribute("res");
	
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
	<%
		if (res == 1) {
	%>	
		<div class="container mt-5">
			<h4>${mid }는 사용 가능한 아이디 입니다.</h4>
			<p><input type="button" value="창닫기" onclick="sendCheck()" ></p>
		</div>
	<%
		} else {
	%>
		<div class="container mt-5">
			<h4>${mid }는 중복된 아이디 입니다.</h4>
			<form name="childForm" method="post" action="<%=request.getContextPath() %>/useroverlapcheck.user">
				<input type="text" name="userId">
				<input type="button" value="아이디검색" onclick="idCheck()" >
			</form>
		</div>
	<%
		}
	%>	
	
	<script>
	function sendCheck() {
		opener.window.document.signupForm.userId.value = "${mid}";
		opener.window.document.signupForm.pwd.focus();
		/* opener.window.document.overlapCheck = 1; */
		window.close();
	}
	
	function idCheck() {
		let mid = childForm.userId.value;
		
		if (mid == "") {
			alert("아이디를 입력하세요.");
			childForm.userId.focus();
		}
		else {
			childForm.submit();
		}
	}
	</script>
</body>

</html>