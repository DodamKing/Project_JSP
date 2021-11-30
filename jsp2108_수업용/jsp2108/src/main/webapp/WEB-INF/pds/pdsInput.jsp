<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>pdsInput.jps</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>자료실 업로드</h2>
		<div class="card-body mt-5">
			<form name="myform" method="post" action="pdsInputOk.pds" enctype="multipart/form-data">
				<div class="form-group">
					<input type="button" class="form-control btn btn-warning" value="추가" onclick="fileAppend()">
				</div>
				<div class="form-group">
					<input type="file" name="fName1" id="fName1" class="form-control border" accept=".jpg,.gif,.png,.zip,.ppt,.pptx">
				</div>
				<div class="form-group" id="fileInsert"></div>
				<div class="form-group" >
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning">올린이</div> 
						<div class="form-control">${sNick }</div>
					</div>
				</div>
				<div class="form-group" >
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning">제목</div> 
						<input type="text" name="title" id="title" placeholder="제목을 입력하세요." class="form-control">
					</div>
				</div>
				<div class="form-group" >
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning">내용</div> 
						<input type="text" name="contetn" id="content" placeholder="내용을 입력하세요." class="form-control">
					</div>
				</div>
				<div class="form-group" >
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning">분류</div> 
						<select name="part" onchange="partCheck()" class="form-control">
							<option value="학습">학습</option>
							<option value="여행">여행</option>
							<option value="음식">음식</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<div class="form-group" >
					<div class="input-group">
						<div class="input-group-prepend btn btn-warning">공개여부</div>
						<div class="form-control">
							<input type="radio" name="openSw" id="openSw" value="공개" checked> 공개
							<input type="radio" name="openSw" value="비공개"> 비공개
						</div>
					</div> 
				</div>
				<div class="form-group" >
					<div class="input-group">	
						<div class="input-group-prepend btn btn-warning">비밀번호</div> 
						<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." class="form-control">
					</div>
				</div>
				<input type="hidden" name="mid" value="${sMid }">
				<input type="hidden" name="nickName" value="${sNick }">
				<input type="hidden" name="fSize" >
			</form>
		</div>
		
		<button class="btn btn-warning mb-5" onclick="fCheck()">파일업로드</button>
		<button class="btn btn-warning mb-5" onclick="location.href='pdsList.pds'">돌아가기</button>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		let cnt = 1;
		
		function fileAppend() {
			cnt++;
			fileIn = "";
			fileIn += "<div class='form-group'>"
			fileIn += '<div class="input-group" id="fBox' + cnt + '"><input type="file" name="fName' + cnt + '" id="fName' + cnt + '" class="form-control border" accept=".jpg,.gif,.png,.zip,.ppt,.pptx,.hwp">';
			fileIn += "<div class='input-group-append'><input type=button value='삭제' onclick='deletBox(" + cnt +")' class='btn btn-warning'></div></div>";
			fileIn += "</div>";
			$("#fileInsert").append(fileIn);
		}
		
		function deletBox(cnt) {
			$("#fBox" + cnt).remove();
		}
		
		function fCheck() {
			let fName = myform.fName1.value;
			let maxSize = 1024 * 1024 * 20;
			let title = myform.title.value;
			
			if (fName.trim() == "") {
				alert("파일을 선택하세요.");
				return;
			}
			
			if (title.trim() == "") {
				alert("제목을 입력하세요.");
				return;
			}
			
			let fileSize = 0;
			for (let i=1; i<=cnt; i++) {
				let fName = "fName" + i;
				if ($("#" + fName).val() != "" && $("#" + fName).val() != null) {
					fName_ = $("#" + fName).val();
					let ext = fName_.substring(fName_.lastIndexOf(".") + 1);
					let uext = ext.toLowerCase()
					
					if (uext != "jpg" && uext != "gif" && uext != "png" && uext != "zip" && uext != "ppt" && uext != "pptx" && uext != "hwp") {
						alert("업로드 가능한 파일은 'jpg/gif/png/zip/ppt/pptx/hwp' 입니다.");
						return;
					}
					
					if (fName_.indexOf(" ") != -1) {
						alert("띄어쓰기는 안돼요.");
						return;
					}
					
					/* fileSize += document.getElementById(fName).files[0].size; */
					fileSize += $("#" + fName)[0].files[0].size;
					if (fileSize > maxSize) {
						alert("업로드하는 파일의 최대용량은 20MByte 이내입니다.");
						return;
					}
					
					myform.fSize.value = fileSize;
					myform.submit();
				}
			}
		}
		
	</script>
</body>
</html>