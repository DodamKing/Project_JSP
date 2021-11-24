<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String res = (String) request.getAttribute("res");
	String url = (String) request.getAttribute("url");
%>
<script>
	if ("<%=res %>" == "loginSuccess") {
		alert("${sVO.nickNm}님 로그인 되었습니다.");
	}
	
	else if ("<%=res %>" == "loginFalse") {
		alert("아이디와 비밀번호를 확인 하세요.");
	}
	
	else if ("<%=res %>" == "signupFalse") {
		alert("데이터 베이스 오류.");
	}
	
	else if ("<%=res %>" == "signupSuccess") {
		alert("회원 가입이 완료 되었습니다.");
	}

	else if ("<%=res %>" == "fales") {
		alert("데이터 베이스 오류.");
	}
	
	else if ("<%=res %>" == "signOutsuccess") {
		alert("정상적으로 탈퇴 처리 되었습니다.");
	}
	
	
	location.href = "<%=url %>";
</script>