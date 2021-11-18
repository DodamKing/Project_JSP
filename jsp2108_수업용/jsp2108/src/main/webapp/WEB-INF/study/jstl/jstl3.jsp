<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<%
	String atom = "Welcome to my Homepage(O:길동홍)!";
	pageContext.setAttribute("atom", atom);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>jstl3.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>함수 사용법</h2>
		<div class="card-body">
			1. 길이 함수 length(변수명) : ${fn:length(atom) } <br>
			<c:set var="atom" value="<%=atom %>"></c:set>
			2. 대문자 변환(toUpperCase) : ${fn:toUpperCase(atom)} <br>
			3. 소문자 변환(toLowerCase) : ${fn:toLowerCase(atom)} <br>
			4. (substring) : ${fn:substring(atom, 0, 3)} <br>
			5. (substring) : ${fn:substring(atom, 3, 6)} <br>
			6. (indexOf) : ${fn:indexOf(atom, "m")} <br>
			7. (indexOf) : ${fn:indexOf(atom, "M")} <br>
			8. (indexOf) : ${fn:indexOf(atom, "b")} <br>
			<c:forEach var="i" begin="0" end="${fn:length(atom)}" varStatus="st">
				<c:if test="${fn:substring(atom, i, i+1) == 'o'}" >
					<c:set var="lastStr" value="${i }"></c:set>
				</c:if>
			</c:forEach>
			9. 마지막 o 검색 : ${lastStr } <br>
			
			10. 두번째 o 뒤로 다 출력 : 
			<c:set var="temp" value="${fn:substringAfter(atom, 'o') }" />
			${fn:substringAfter(temp, 'o') } <br>
			
			11. 첫번째 o 에서 두번째 o 사이 출력 :
			${fn:substringBefore(temp, 'o') } <br>
			
			<c:set var="temp1" value="${atom }" />
			<c:forEach var="i" begin="1" end="3">
				<c:set var="temp1" value="${fn:substringAfter(temp1, 'o') }" />
			</c:forEach>
			12. 세번째 o 뒤로 : ${temp1 }<br>

			13. (split(변수, 구분자)) : 
			<c:set var="arrAtom" value="${fn:split(atom, 'o') }" />	
			<c:forEach	var="arr" items="${arrAtom }" varStatus="st">
				${arr }
			</c:forEach>
			<br>
			<c:set var="arrAtom" value="${fn:split(atom, 'o') }" />	
			<c:forEach	var="arr" items="${arrAtom }" varStatus="st">
				<c:if test="${st.count == 2 }">${arr }</c:if>
			</c:forEach>
			<br>
			
			14. 010-1234-5677 : 
			<c:forEach var="tel" items="${fn:split('010-1234-5677', '-')}" varStatus="st">
				<c:if test="${st.count == 2 }" >${tel } </c:if>
			</c:forEach>
			<br>
			
			15. (replace(변수, old, new)) :
			${fn:replace(atom, "my", "new") }; <br>
			
			16. 공백 제거 출력
			${fn:replace(atom, " ", "") }; <br>
			
			17. 특정 문자로 시작함? (startsWith(변수, 검색문자)) : 
			${fn:startsWith(atom, "o") } <br>

			18. 특정 문자로 끝남? (endsWith(변수, 검색문자)) : 
			${fn:endsWith(atom, "o") } <br>

			19. 특정 문자 포함? (contains(변수, 검색문자)) : 
			${fn:contains(atom, "o") } <br>
			<hr>
		</div>
		<%
			int won = 1234567;
			int su1 = 5504545;
			int tot = 10001434;
			
			pageContext.setAttribute("won", won);
			pageContext.setAttribute("su1", su1);
			pageContext.setAttribute("tot", tot);
			pageContext.setAttribute("su2", 23454.559);
			
		%>
		<h2>형식 문자열</h2>
		<div class="card-body">
			<h4>화폐</h4>
			1. 일단 출력 : ${won } <br>
			2. 천단위 표시 : <fmt:formatNumber value="${won }" /> <br>
			3. 화폐단위 표시 : <fmt:formatNumber value="${won }" type="currency" /> <br>
			4. 화폐단위 표시 달라 : <fmt:formatNumber value="${won }" type="currency" currencyCode="USD"/> <br>
			5. 화폐단위 표시 유로 : <fmt:formatNumber value="${won }" type="currency" currencyCode="EUR"/> <br>
			6. 화폐단위 표시 엔 : <fmt:formatNumber value="${won }" type="currency" currencyCode="JPY"/> <br>
			7-1. 소수 표현 : <fmt:formatNumber value="${su2 }" pattern=".00" /> <br>
			7-2. 소수 표현 : <fmt:formatNumber value="${su2 }" pattern=".0" /> <br>
			7-3. 소수 표현 : <fmt:formatNumber value="${su2 }" pattern="0" /> <br>
			7-3-1. 소수 표현 + 천단위 : <fmt:formatNumber value="${su2 }" pattern="0,000.0" /> <br>
			7-4. 소수 표현 버림 : <fmt:parseNumber value="${su2 }" integerOnly="true" /> <br>
			8-1. 천단위 + 소수 표현 : <fmt:formatNumber value="${won }" /> <br>
			8-2. 천단위 + 소수 표현 : <fmt:formatNumber value="${won }" /> <br>
			9. 백분율 : <fmt:formatNumber value="${su1/tot }" type="percent" /> <br>
		</div>
		<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
		<div class="card-body">
			<h4>날짜</h4>
			1. 일단 출력 : ${now } <br>
			2. 포맷 : <fmt:formatDate value="${now }"/> <br>
			3. 패턴 1 : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/> <br>
			4. 패턴 2 : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd hh:mm:ss"/> <br>
			5. 패턴 3 : <fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/> <br>
		</div>
		<div class="card-body">
			<h4>타임존</h4>
			<jsp:useBean id="today" class="java.util.Date" />
			1. 일단 출력 : ${today } <br>
			2. 포맷 : <fmt:formatDate value="${today }"/> <br>
			3. KST : <fmt:formatDate value="${today }" dateStyle="full" timeStyle="full" type="both"/> <br>
			4. 타임존 <br> 
			<fmt:timeZone value="GMT">
				Swiss GMT : <fmt:formatDate value="${today }" dateStyle="full" timeStyle="full" type="both"/> <br>
			</fmt:timeZone>
			<fmt:timeZone value="GMT-8">
				Swiss GMT-8 : <fmt:formatDate value="${today }" dateStyle="full" timeStyle="full" type="both"/> <br>
			</fmt:timeZone>
			 <br>
		</div>
		<div class="card-body">
			<h4>국가별설정</h4>
			1. 기본 : <%=response.getLocale() %> <br>
			<fmt:setLocale value="en_US"/>
			2. 미국 : <%=response.getLocale() %> <br>
			2-1. 화폐 : <fmt:formatNumber value="${won }" type="currency" /> <br>
			2-2. 날짜 : <fmt:formatDate value="${today }" dateStyle="full" timeStyle="full" type="both"/> <br>
			<fmt:setLocale value="ja_JP"/>
			3. 일본 : <%=response.getLocale() %> <br>
			2-1. 화폐 : <fmt:formatNumber value="${won }" type="currency" /> <br>
			2-2. 날짜 : <fmt:formatDate value="${today }" dateStyle="full" timeStyle="full" type="both"/> <br>
			<fmt:setLocale value="ko_KR"/>
			4. 한국 : <%=response.getLocale() %> <br>
			2-1. 화폐 : <fmt:formatNumber value="${won }" type="currency" /> <br>
			2-2. 날짜 : <fmt:formatDate value="${today }" dateStyle="full" timeStyle="full" type="both"/> <br>
		</div>
		<div class="card-body">
			<h4>이미지</h4>
			<p><img src="img/music.png"></p>
			<p>
				<c:url var="data" value="/img/music.png" />
				<img src="${data }">
			</p>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>