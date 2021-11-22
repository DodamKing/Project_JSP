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
		<form name="upDateForm">
  	<h3>user 정보 수정</h3>
	  	<table>
	  		<tr>
	  			<td>이름</td>
	  			<td><input type="text" name="name" id="name" value="${vo.name }" /></td>
	  		</tr>
	  		<tr>
	  			<td>나이</td>
	  			<td><input type="number" name="age" id="age" value="${vo.age }" /></td>
	  		</tr>
	  		<tr>
	  			<td><input type="button" value="수정" onclick="userUpdateOk()" /></td>
	  			<td><input type="button" value="돌아가기" onclick="location.href='ajax1.st'" /></td>
	  		</tr>
	  	</table>
  	</form>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function userUpdateOk() {
			if ($("#name").val() == "" || $("#age").val() == "") {
				alert("수정할 정보를 입력해 주세요.");
				return;
			} 
			
			let data = {
				idx : ${vo.idx},
				name : $("#name").val(),
				age : $("#age").val()
			}
		
			$.ajax({
				type : "post",
				url : "userUpdateOk.st",
				data : data,
				success : (data) =>  {
					alert("정보가 수정 되었습니다.");
				}
			});
		}
	</script>
</body>
</html>