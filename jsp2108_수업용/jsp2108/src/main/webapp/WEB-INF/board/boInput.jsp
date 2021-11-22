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
	<form name="myform" method="post" action="${ctp}/boInputOk.bo">
		<table class="table table-borderless">
		    <tr>
		      <td><h2>게시판 글쓰기</h2></td>
		    </tr>
		</table>
	  <table class="table">
	    <tr>
	      <th>글쓴이</th>
	      <td>${sNick}</td>
	    </tr>
	    <tr>
	      <th>글제목</th>
	      <td><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td><input type="text" name="email" placeholder="이메일을 입력하세요" value="${email}" class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>홈페이지</th>
	      <td><input type="text" name="homePage" placeholder="홈페이지 주소를 입력하세요" value="${homePage}" class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td><textarea rows="6" name="content" class="form-control"></textarea></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-right">
	      	<input type="button" value="글올리기" onclick="fCheck()" class="btn btn-primary" >
	      	<input type="reset" value="다시입력" class="btn btn-primary" >
	      	<input type="button" value="돌아가기" onclick="location.href='boList.bo'" class="btn btn-primary" >
	      </td>
	    </tr>
	  </table>
      <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr }" >
	</form>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>