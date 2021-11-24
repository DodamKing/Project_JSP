<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>boUpdate.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<style>
	th {
		text-align: center;
	}
</style>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
	<form name="myform" method="post" action="${ctp}/boUpdateOk.bo">
		<table class="table table-borderless">
		    <tr>
		      <td><h2>게시판 글쓰기</h2></td>
		    </tr>
		</table>
	  <table class="table">
	    <tr>
	      <th style="width:150px;">글쓴이</th>
	      <td>${sNick}</td>
	    </tr>
	    <tr>
	      <th>글제목</th>
	      <td><input type="text" name="title" value="${vo.title }" class="form-control" required/></td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td><input type="text" name="email"  value="${vo.email}" class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>홈페이지</th>
	      <td><input type="text" name="homePage" value="${vo.homePage}" class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td><textarea rows="6" name="content" class="form-control"  required>${vo.content }</textarea></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-right">
	      	<input type="button" value="글수정" onclick="fCheck()" class="btn btn-primary" >
	      	<input type="reset" value="다시입력" class="btn btn-primary" >
	      	<input type="button" value="돌아가기" onclick="location.href='boList.bo'" class="btn btn-primary" >
	      </td>
	    </tr>
	  </table>
      <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr }" >
      <input type="hidden" name="idx" value="${vo.idx }" >
      <input type="hidden" name="pag" value="${pag }" >
      <input type="hidden" name="pagSize" value="${pagSize }" >
	</form>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	<script>
		function fCheck() {
			if (confirm("게시글을 수정 하시겠습니까?")) {
				myform.submit();
			}
		}
	</script>
</body>
</html>