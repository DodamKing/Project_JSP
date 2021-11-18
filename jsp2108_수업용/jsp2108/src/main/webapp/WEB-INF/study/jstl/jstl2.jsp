<%@page import="study.mapping2.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="study.mapping2.UserDAO"%>
<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>jstl2.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>jstl2 제어문 core lib 필수</h2> 
		<h3>조건문</h3>
		문법 : < c :if test="$ {조건문 }"> < / c : if ><br>
		<c:set var="su1" value='500' />
		<c:set var="su2" value='5000' />
		is su1 > su2 : <c:if test="${su1 > su2}"> su1가 더 크다 </c:if> <br>
		${su1 lt su2 } <br>
		su1 : ${su1 } <br>
		su2 : ${su2 } <br>
		<c:choose> 
			<c:when test="${su1+0 > su2+0 }">su1이 더 크다</c:when>
			<c:when test="${su1+0 == su2+0 }">둘이 같다</c:when>
			<c:otherwise>su2가 더 크다</c:otherwise>
		</c:choose>
		<br>
		<hr>
		<h3>반복문(forEach문)</h3>
  		<p>문법1 : < c :forEach var="변수" items="$ {배열/객체}">수행할내용< /c :forEach></p>
 		<p>문법2 : < c :forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="인자">수행할내용</c :forEach></p>
 		
 		<%
 			UserDAO dao = new UserDAO();
 			
 		  	List<UserVO> vos = dao.getUserList();
 		  	request.setAttribute("vos", vos);
 			
 		%>
 		
 		<p>5.반복문예(member객체이용) - 첫번째와 마지막 자료의 '이름'과 '나이'를 출력하시오.<br/>
  			<c:forEach var="vo" items="${vos}" varStatus="st">
		    	<c:if test="${st.first }">첫번째 자료 이름: ${vo.name}, 나이: ${vo.age} <br> </c:if> 
		    	<c:if test="${st.last }">마지막 자료 이름: ${vo.name}, 나이: ${vo.age}  </c:if> 
		  	</c:forEach>
 		</p>
 		
 		<p>6.반복문예(member객체이용) - 짝수 '이름'과 '나이'를 출력하시오.<br/>
  			<c:forEach var="vo" items="${vos}" varStatus="st">
		    	<c:if test="${st.index % 2 == 0 }">짝수 자료 - ${st.index }. 이름: ${vo.name}, 나이: ${vo.age} <br> </c:if> 
		  	</c:forEach>
 		</p>
 		
 		<p>
 			<c:set var="cnt" value="0" />
 			<c:forEach var="i" begin="1" end="5">
 				<c:forEach var="j" begin="1" end="3">
					<c:set var="cnt" value="${cnt + 1 }" />
					${cnt }
 				</c:forEach>
 			</c:forEach>
 		</p>
 		<%
 			String hobbys = "등산/낚시/바둑/영화감상/수영";
 			pageContext.setAttribute("hobbys", hobbys);
 		%>
 		<p> 취미 :
 			<c:forTokens var="hobby" items="${hobbys}" delims="/">
 				<c:choose>
 					<c:when test="${hobby eq '바둑'}"><font color="red">${hobby }</font></c:when>
 					<c:when test="${hobby eq '수영'}"><font color="blue">${hobby }</font></c:when>
 					<c:otherwise>${hobby }</c:otherwise>
 				</c:choose>
 			</c:forTokens>
 		</p>
 		
 		<p>7.반복문예 1차원 배열.<br/>
			<c:forEach var="arr" items="${arr1 }" varStatus="st">
				${st.count } : ${arr } <br>
			</c:forEach>
 		</p>
 		
 		<p>8.반복문예 2차원 배열.<br/>
			<c:forEach var="arr" items="${arr2 }" varStatus="st1">
				${st1.count } :
				<c:forEach var="atom" items="${arr }" varStatus="st2">
				 ${atom }
				</c:forEach>
				<br>
			</c:forEach>
 		</p>
 		
 		<p>8.반복문예 2차원 dict<br/>
			<c:forEach var="item" items="${tel }" varStatus="st1">
				<c:forEach var="tel" items="${item }" varStatus="st2">
					 ${tel }
				</c:forEach>
				<br>
			</c:forEach>
 		</p>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>