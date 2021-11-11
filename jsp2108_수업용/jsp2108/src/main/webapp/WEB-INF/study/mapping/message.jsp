<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");
%>

	<script>
		let msg = "<%=msg %>";
		let url = "<%=url %>";
		
		if (msg == "userDeleteOk") {
			msg = "정보가 삭제 되었습니다.";
		} else if (msg == "userDeleteNo") {
			msg = "시스템 오류 문의가 필요합니다.";
		} else if (msg == "userInputOk") {
			msg = "정보가 입력 되었습니다.";
		} else if (msg == "userInputNo") {
			msg = "시스템 오류 문의가 필요합니다.";
		} else if (msg == "userUpdateOk") {
			msg = "정보가 수정 되었습니다.";
		} else if (msg == "userUpdateNo") {
			msg = "시스템 오류 문의가 필요합니다.";
		}
	
		alert(msg);
		
		if (url != "") {
			location.href = url;
		}
	</script>
