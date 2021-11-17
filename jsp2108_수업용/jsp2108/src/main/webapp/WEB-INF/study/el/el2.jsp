<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>el2.jsp</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>el1에서 넘긴 값 받기</h2>
		<table class="table mt-5 mb-5">
			<tr>
				<th>아이디 : </th>
				<td>${param.mid }</td>
			</tr>		
			<tr>
				<th>비밀번호 : </th>
				<td>${param.pwd }</td>
			</tr>		
			<tr>
				<th>성명 : </th>
				<td>${param.name }</td>
			</tr>		
			<tr>
				<th>히든 : </th>
				<td>${param.mbc }</td>
			</tr>		
		</table>
		<div class="card-body mt-5 mb-5">
			<h3>배열 처리 하기</h3>
			<%
				int[] atom1 = new int[5];
				int atom2[] = new int[5];
				String[] atom3 = new String[] {"일", "월", "화", "수", "목", "금", "토"};
				int[] atom4 = {100, 200, 300, 400};
			%>
				스크립틀릿
			<%
				for (int i=0; i<atom3.length; i++) {
			%>
				<p>atom3[<%=i %>] : <%=atom3[i] %></p>
			<%
				}
				pageContext.setAttribute("atom4", atom4);
			%>
				<p>취미는 ${param.hobby } 이다.</p>
			<%
				ArrayList<String> arrVos = new ArrayList();
				arrVos.add("홍길동");
				arrVos.add("김말숙");
				arrVos.add("이기자");
				arrVos.add("오하늘");
				
				pageContext.setAttribute("arrVos", arrVos);
			%>
				<p>객체 출력 해보기 : ${arrVos }</p>
				<p>객체 출력 해보기 : ${arrVos[0] }</p>
				
			<%
				HashMap<Integer, String> mapVos = new HashMap<>();
				mapVos.put(1, "월요일");
				mapVos.put(2, "화요일");
				mapVos.put(3, "수요일");
				mapVos.put(4, "목요일");
				mapVos.put(5, "금요일");
				mapVos.put(6, "토요일");
				mapVos.put(7, "일요일");
				pageContext.setAttribute("mapVos", mapVos);
			%>
				<p>객체 출력 해보기(map) : ${mapVos }</p>
				<p>객체 출력 해보기(map) : ${mapVos[2+0] }</p>
				<p>객체 출력 해보기(map) : ${mapVos.get(1+0) }</p>
		</div>
		<p><a href="<%=request.getContextPath()%>/el1.st" class="btn btn-primary">돌아가기</a></p>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>