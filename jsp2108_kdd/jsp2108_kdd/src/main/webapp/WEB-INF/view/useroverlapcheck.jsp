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
    <title>DD Music 아이디 중복 확인</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <jsp:include page="/main/bs4.jsp" />
</head>

<body>
	<c:if test="${res == 1 }">
  		<div class="modal-header">
  			<h4 class="modal-title">DD Music 아이디 중복 검사</h4>
        	<button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
      	</div>
      	<div class="modal-body">
	      	<h4 class="modal-title">${mid }는 사용 가능한 아이디 입니다.</h4>
      	</div>
      	<div class="modal-footer">
	        <button type="button" class="btn btn-danger mt-5" data-dismiss="modal" onclick="sendCheck()">아이디 사용하기</button>
      	</div>
	</c:if>
	
	<c:if test="${res != 1 }">
  		<div class="modal-header">
  			<h4 class="modal-title">DD Music 아이디 중복 검사</h4>
        	<button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
      	</div>
      	<div class="modal-body">
      		<h4 class="modal-title mb-3">${mid }는 중복된 아이디 입니다.</h4>
      	 	<form name="childForm" method="post" action="<%=request.getContextPath() %>/useroverlapcheck.user">
				<input class="form-control" type="text" name="userId">
			</form>
      	</div>
      	<div class="modal-footer mt-3">
        	<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="idCheck()">아이디검색</button>
      	</div>
	</c:if>

		<%-- <c:if test="${res == 1 }">
			<div class="container mt-5">
				<h4>${mid }는 사용 가능한 아이디 입니다.</h4>
				<p><input type="button" value="아이디 사용하기" onclick="sendCheck()" ></p>
			</div>
		</c:if>
		<c:if test="${res != 1 }">
			<div class="container mt-5">
				<h4>${mid }는 중복된 아이디 입니다.</h4>
				<form name="childForm" method="post" action="<%=request.getContextPath() %>/useroverlapcheck.user">
					<input type="text" name="userId">
					<input type="button" value="아이디검색" onclick="idCheck()" >
				</form>
			</div>
		</c:if> --%>
	
	<script>
	function sendCheck() {
		opener.window.document.signupForm.userId.value = "${mid}";
		opener.window.document.signupForm.pwd.focus();
		opener.window.document.signupForm.demo99.value = 1;
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