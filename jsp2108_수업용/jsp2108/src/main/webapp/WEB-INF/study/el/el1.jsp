<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>el1.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%-- <%@include file="/include/nav.jsp" %> --%>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<div class="container mt-5 mb-5">
		<h2>EL(Expression Language)</h2>
		<div class="card-body">
			<p><b>용도</b> : 사용자가 값(변수, 객체, 수식)을 전송후에 담아줄 용도로 사용한다.</p> 
			<p><b>표기법</b> : $ { }</p>
		</div>
		<div class="card-body">
			저장소
			<ol>
		      <li>Server
		        <ul>
		          <li>Application : 전역변수...</li>
		          <li>Session : 브라우저 생성시 발생/소멸</li>
		          <li>Request : request에 의해서 전송시 유효.. 이후는 소멸..</li>
		          <li>pageContext : 현재 Page에서만 통용되는 저장소</li>
		        </ul>
		      </li>
		      <li>Client
		        <ul>
		          <li>Cookie</li>
		        </ul>
		      </li>
		    </ol>
		</div>
		<%
			String atom = "Seoul";
			String name = "홍길동";
			int su1 = 100, su2 = 200;
		%>
		<div class="">
			<hr>
			<p>스크립틀릿을 이용한 출력</p>
			atom = <%=atom %><br>
			name = <%=name %><br>
			su1 = <%=su1 %><br>
			su2 = <%=su2 %><br>
			<hr>
			<%
				/* request.setAttribute("atom", atom);
				request.setAttribute("name", name);
				request.setAttribute("su1", su1);
				request.setAttribute("su2", su2); */

				pageContext.setAttribute("atom", atom);
				pageContext.setAttribute("name", name);
				pageContext.setAttribute("su1", su1);
				pageContext.setAttribute("su2", su2);
			%>
			<h2>EL을 이용한 출력</h2>
			atom = ${atom}<br>
			name = ${name}<br>
			su1 = ${su1}<br>
			su2 = ${su2}<br>
			<br>
			<p>일반 출력</p>
			123 = ${123} <br>
			mbc = ${'Mbc'} <br>
			합 : ${su1 + su2 }<br>
			<div class="card-body mt-5">
			<h3>폼태그로 el2로 값 넘김</h3>
				<form name="myform" method="post" action="<%=request.getContextPath()%>/el2.st">
			    	<p>아이디 : <input type="text" name="mid" class="form-control"/></p>
			    	<p>비밀번호 : <input type="password" name="pwd" class="form-control"/></p>
		      		<p>성명 : <input type="text" name="name" class="form-control"/></p>
			      	<input type="hidden" name="mbc" value="MBC방송국"/>
			      	<p> 취미 : 
				      	<input class="ml-4" type="checkbox" name="hobby" value="등산"/>등산
				      	<input class="ml-4" type="checkbox" name="hobby" value="낚시"/>낚시
				      	<input class="ml-4" type="checkbox" name="hobby" value="바둑"/>바둑
				      	<input class="ml-4" type="checkbox" name="hobby" value="수영"/>수영
			      	</p>
		      		<p><input type="submit" value="값전송" class="form-control btn-secondary"/></p>
		    	</form>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>