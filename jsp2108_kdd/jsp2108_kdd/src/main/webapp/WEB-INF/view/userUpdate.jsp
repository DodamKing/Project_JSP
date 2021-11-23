<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Information Update</title>
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
		<h2>DD Music 프로필 수정</h2>
		<form action="userupdatedo.user" method="post" name="form">
			<table class="table table-borderless">
				<tr>
					<th>아이디</th>
					<td>${vo.userId }</td>
					<td><input name="userId" type="hidden" value="${vo.userId }"></td>
				</tr>
				<tr>
					<th>이메일 주소</th>
					<td><input name="email" type="text" value="${vo.email }"></td>
				</tr>
				<tr>
					<th>통신사</th>
					<td>
						<select name="telecom">
							<option value="">선택</option>
							<option value="SKT" <c:if test="${vo.telecom == 'SKT' }">selected</c:if> >SKT</option>
							<option value="KT" <c:if test="${vo.telecom == 'KT' }">selected</c:if>>KT</option>
							<option value="LGU+" <c:if test="${vo.telecom == 'LGU+' }">selected</c:if>>LGU+</option>
							<option value="알뜰폰" <c:if test="${vo.telecom == '알뜰폰' }">selected</c:if>>알뜰폰</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td><input name="phoneNb" type="text" value="${vo.phoneNb }"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="userNm" type="text" value="${vo.userNm }"></td>
				</tr>
				<tr>
					<th>별명</th>
					<td><input name="nickNm" type="text" value="${vo.nickNm }"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="적용" class="btn btn-warning" onclick="smit()" />
						<input type="button" value="돌아가기" class="btn btn-warning" onclick="location.href='userprofile.user'" />
						<input type="button" value="홈으로" class="btn btn-warning" onclick="location.href='today'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	function smit() {
			if (confirm('변경 사항을 적용 할까요?')) {
				$("")
				form.submit();
			}
		}
    </script>
</body>

</html>