<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>DynamicForm</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>동적폼 업로드</h2>
		<div class="card-body">
			<div class="form-group">
				<input type="button" value="텍스트박스추가" onclick="textBoxAppend()" class="btn btn-primary form-control">
			</div>
			<div class="form-group">
				<input type="button" value="출력" onclick="textView()" class="btn btn-primary form-control">
			</div>
			<div class="form-group">
				<input type="text" name="product1" id="product1" class="form-control">
			</div>
			<div class="form-group" id="textBoxInsert"></div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		cnt = 1;

		function textBoxAppend() {
			cnt++;
			let textBox = "";
			textBox += "<div class='form-group'>"
			textBox += '<div class="input-group" id="tBox' + cnt + '"><input type="text" name="product' + cnt + '" id="product' + cnt + '" class="form-control">';
			textBox += "<div class='input-group-append'><input type=button value='삭제' onclick='deletBox(" + cnt +")' class='btn btn-primary'></div></div>";
			textBox += "</div>";
			$("#textBoxInsert").append(textBox);
		}
		
		function deletBox(cnt) {
			$("#tBox" + cnt).remove();
		}
		
		function textView() {
			str = "";
			for (let i=1; i<=cnt; i++) {
				let product = 'product' + i;
				str += document.getElementById(product).value;
			}
				alert(str);
		}
		
	</script>
	
</body>
</html>