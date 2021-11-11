<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>title</title>
	<%@include file="../../../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../../../include/header_home.jsp" %>
	<%@include file="../../../include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>사용자 정보 등록창</h2>
		<div>
			<form name="myform" method="post" action="<%= request.getContextPath()%>/urlMappingInputOk.um">
				<table class="table">
					<tr>
						<td>
							<p>성명 : <input type="text" name="name" autofocus class="form-contrl"></p>
							<p>나이 : <input type="number" name="age" class="form-contrl"></p>
							<p class="row">
								<div class="col-1"> </div>
								<input type="submit" value="등록" class="btn btn-success col-5">
								<button class="btn btn-success col-5" type="button" onclick="location.href='<%=request.getContextPath() %>/URLMappingList';">돌아가기</button>
								<div class="col"> </div>
							</p>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../../../include/footer.jsp" %>
	
</body>
</html>