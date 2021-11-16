<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String res = (String) request.getAttribute("res");
	String mid = "";
	if (session.getAttribute("sMid") != null) {
		mid = (String) session.getAttribute("sMid");
	}
%>
<script>
	if ("<%=res %>" == "loginSuccess") {
		alert("<%=mid %>님 로그인 되었습니다.");
		location.href = "userloginsuccess.user";
	}
	
	else if ("<%=res %>" == "loginFalse") {
		alert("아이디와 비밀번호를 확인 하세요.");
		location.href = "userlogin.user";
	}
</script>