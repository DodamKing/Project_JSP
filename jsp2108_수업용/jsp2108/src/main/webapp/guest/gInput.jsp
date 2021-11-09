<%@ page language="java" contentType="text/html; charset=UTF-8"
				pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<%@include file="../include/bs4.jsp"%>
</head>
<body>
				<!-- 헤더영역 -->
				<%@include file="../include/header_home.jsp"%>
				<%@include file="../include/nav.jsp"%>

				<div class="container mt-5">
								<form method="post"
												action="<%=request.getContextPath()%>/GInputOk">
												<div class="form-group">
																<label for="name">성명</label> <input type="text"
																				name="name" id="name" class="form-control"
																				placeholder="Enter username" required autofocus />
																<div class="valid-feedback">통과!!</div>
																<div class="invalid-feedback">성명은 필수 입력입니다.</div>
												</div>
												<div class="form-group">
																<label for="email">E-mail</label> <input type="text"
																				name="email" id="email" class="form-control"
																				placeholder="Enter Email" />
																<div class="valid-feedback">E-mail은 선택사항입니다.</div>
												</div>
												<div class="form-group">
																<label for="homepage">Homepage</label> <input
																				type="text" name="homepage" id="homepage"
																				class="form-control" placeholder="Enter Email" />
																<div class="valid-feedback">Homepage는 선택사항입니다.</div>
												</div>
												<div class="form-group">
																<label for="content">방문소감</label>
																<textarea rows="5" name="content" id="content"
																				class="form-control" required></textarea>
																<div class="valid-feedback">통과!!</div>
																<div class="invalid-feedback">방문소감은 필수 입력입니다.</div>
												</div>
												<div class="form-group">
																<button type="submit" class="btn btn-secondary">방명록
																				등록</button>
																<button type="reset" class="btn btn-secondary">방명록
																				다시입력</button>
																<button type="button" class="btn btn-secondary"
																				onclick="location.href='gList.jsp';">돌아가기</button>
												</div>
												<input type="hidden" name="hostIp"
																value="<%=request.getRemoteAddr()%>" />
								</form>
				</div>

				<!-- 푸터 -->
				<%@include file="../include/footer.jsp"%>

</body>
</html>