<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>ajax2</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>Ajax로 데이터 전송 연습</h2>
		<hr>
		<h3>도시를 선택 하세요</h3>
		<form action="" name="myform" method="post">
			<select name = "do" id="do">
				<option label="">지역선택</option>
				<option label="서울">서울</option>
				<option label="경기">경기</option>
				<option label="충북">충북</option>
				<option label="충남">충남</option>
			</select>
			<select name = "city" id="city">
				<option label="">도시선택</option>
			</select>
			<input type="button" value="선택" onclick="fCheck()" />
		</form>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
	<script>
		$("#do").change(() => {
			let dodo = $("#do").val();
			let query = {
					dodo : dodo
			}
			if (dodo == "") {
				alert("지역을 선택 하세요.");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "ajax2Do",
				data : query,
				success : (data) => {
					var dataStr = data.substring(1,data.length-3);
    				var dataArr = dataStr.split(",");
    				
    				var str = "";
    				str += "<option value=''>도시선택</option>";
    				for(var i=0;i<dataArr.length; i++) {
    				  str += "<option>"+dataArr[i]+"</option>";
    				}
    				$("#city").html(str);
				}
			});
		});
		
		function fCheck() {
			alert("선택한 지역 : " + $("#do").val() + ", 선택한 도시 : " + $("#city").val());
		}
	</script>
</body>
</html>