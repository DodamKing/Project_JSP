<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>jstl1.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>jstl1</h2>
		<table class="table">
		    <tr>
		      	<th>라이브러리명</th>
		      	<th>주소(URL)</th>
		      	<th>접두어(prefix)</th>
		        <th>문법</th>
		    </tr>
		    <tr>
		      	<td>Core</td>
		      	<td>http://java.sun.com/jsp/jstl/core</td>
		      	<td>c</td>
		      	<td>< c : 태그... ></td>
		    </tr>
		    <tr>
		      	<td>Function</td>
		      	<td>http://java.sun.com/jsp/jstl/functions</td>
		      	<td>fn</td>
		      	<td>{ fn : 태그... }</td>
		    </tr>
		    <tr>
		      	<td>Formatting</td>
		      	<td>http://java.sun.com/jsp/jstl/fmt</td>
		      	<td>fmt</td>
		      	<td>&lt;fmt : 태그...></td> 
		    </tr>
		    <tr>
		      	<td>SQL</td>
		      	<td>http://java.sun.com/jsp/jstl/sql</td>
		      	<td>sql</td>
		      	<td>< sql : 태그... ></td>
		    </tr>
		</table>
		<hr>
		<h3>코어 라이브러리</h3>
		<p>변수 선언 : < c :set var="변수명" value="값" /></p> 
	  	su1변수 선언? <c:set var="su1" value="500"/><br/>
	  	<p>변수(값) 출력 : < c :out value="변수(el표기법)/값" /></p> 
	  	'100'값 출력? <c:out value="100"/><br/>
	  	su1값 출력? <c:out value="${su1}"/><br/>
	  	< c : out ... ./>대신에 바로 EL표기법으로 출력가능.....<br/>
	  	su1값 출력? ${su1}<br/>
		<% String name = "홍길동"; %>
	  	<c:set var="name" value="<%=name%>"/>
	  	name : ${name}<br/>
	  	
	  	<%
	  		MemberVo vo = new MemberVo();
		  	vo.setName("홍길동");
		  	vo.setAddress("서울");
	 	 	vo.setEmail("cjsk1126@naver.com");
	 	 	request.setAttribute("vo", vo);
	 	 	//pageContext.setAttribute("vo", vo);
		%>
		  	VO객체의 name : ${vo.name}<br/>
		  	VO객체의 address : ${vo.address}<br/>
		  	VO객체의 email : ${vo.email}<br/>
		  	VO객체의 vo : ${vo}<br/>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>