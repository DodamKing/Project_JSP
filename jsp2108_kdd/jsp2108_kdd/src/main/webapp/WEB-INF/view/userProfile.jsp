<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Information</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    	th {
    		width: 150px;
    		/* text-align: center; */
    	}
    </style>
</head>

<body>
	<c:if test="${sVO == null }"><script>location.href="today"</script></c:if>
	<div class="container mt-5">
		<h2>DD Music 프로필</h2>
		<table class="table table-borderless">
			<tr>
				<th>아이디</th>
				<td>${vo.userId }</td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td>${vo.email }</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>${fn:substring(vo.phoneNb, 0, 3)}-${fn:substring(vo.phoneNb, 3, 7)}-${fn:substring(vo.phoneNb, 7, 11) }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${vo.userNm }</td>
			</tr>
			<tr>
				<th>별명</th>
				<td>${vo.nickNm }</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" class="btn btn-warning" onclick="location.href='userupdate.user'" />
					<input type="button" value="탈퇴" class="btn btn-warning" onclick="cf()" />
					<input type="button" value="돌아가기" class="btn btn-warning" onclick="location.href='today'" />
				</td>
			</tr>
		</table>
	</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	function cf() {
			if (confirm("정말 탈퇴 하시겠습니까?")) {
				if (confirm("탈퇴 시 고객님의 정보는 1개월간 보관 됩니다. 그래도 탈퇴 하시겠습니까?")) {
					location.href="userdel.user";
				}
			}
		}
    </script>
</body>

</html>