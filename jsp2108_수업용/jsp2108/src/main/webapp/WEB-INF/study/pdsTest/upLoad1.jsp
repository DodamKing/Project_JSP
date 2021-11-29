<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>upLoad1.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>파일 업로드 테스트1</h2>
		<p>cos 라이브러리를 사용해보자</p>
		<hr>
		<br>
		<div class="card-body">
			<form name="myform" method="post" action="upLoad1Ok.st" enctype="multipart/form-data">
				<div class="input-group">
					파일명
					<input type="file" name="fName" id="file" class="form-control-file border">
					<div class="input-group-append">
			      		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-primary mt-3">
				    </div>
				</div>
			</form>
			<hr>
			<div>
				<a href="stDownLoad.st" class="btn btn-primary">다운로드 페이지로 이동</a>
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function fCheck() {
			let fName = myform.fName.value;
			let ext = fName.substring(fName.lastIndexOf(".") + 1);
			let uExt = ext.toUpperCase();
			let maxSize = 1024 * 1024 * 10;
			
			if (fName.trim() == "") {
				return;
			}
			
			if (uExt != "ZIP" && uExt != "JPG" && uExt != "PPTX" && uExt != "GIF" && uExt != "PNG" && uExt != "HWP" && uExt != "PPT") {
				alert("업로드 가능한 파일은 'zip, jpg, gif, png, hwp, ppt, pptx' 입니다.")
				return;
			}
			
			if (fName.includes(" ")) {
				alert("파일명에 공백이 포함 될 수 업습니다.");
				return;
			}
			
			let fileSize = document.getElementById("file").files[0].size;
			if (fileSize > maxSize) {
				alert("업로드 가능한 용량은 최대 10MB 입니다.");
				return;
			}
			myform.submit();
		}
	</script>
</body>
</html>