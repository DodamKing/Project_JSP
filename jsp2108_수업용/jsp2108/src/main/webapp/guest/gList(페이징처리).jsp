<%@page import="guest.GuestVO"%>
<%@page import="java.util.List"%>
<%@page import="guest.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");	

	String mid = "";
	if (session.getAttribute("sAid") != null) {
		mid = (String) session.getAttribute("sAid");
	}
	
	GuestDAO dao = new GuestDAO();
	
	int pageSize = 5;
	int totRecCnt = dao.totRecCnt();
	int totPage;
	if (totRecCnt % pageSize == 0) {
		totPage = totRecCnt / pageSize;
	} else {
		totPage = totRecCnt / pageSize + 1;
	}
	int pag = 1;
	if (request.getParameter("pag") != null) {
		pag = Integer.parseInt(request.getParameter("pag"));
	}
	int startIndexNo = (pag - 1) * pageSize;
	int curScrStartNo = totRecCnt - startIndexNo;
	
	
	List<GuestVO> vos = dao.gList(startIndexNo, pageSize);
	GuestVO vo = new GuestVO();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>방명록</title>
	<%@include file="../include/bs4.jsp" %>
	<script>
		function delCheck(idx) {
			var ans = confirm("현재 방명글을 삭제 하시겠습니까?");
			if (ans) location.href="<%=request.getContextPath() %>/GDelete?idx=" + idx;
		}
	</script>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../include/header_home.jsp" %>
	<%@include file="../include/nav.jsp" %>
	
	<div class="container mt-5">
		<div class="row">
			<table class="col-3">
				<tr>
					<th colspan="2"><h2>방 명 록 리 스 트</h2></th>
				</tr>
				<tr>
				<%
					if (mid.equals("admin")) {				
				%>
					<td><a href="<%=request.getContextPath() %>/AdminLogOut" class="btn btn-secondary">관리자 로그아웃</a></td>
				<%
					}
					else {
				%>
					<td><a href="adminLogin.jsp" class="btn btn-secondary">관리자</a></td>
				<%
					}
				%>
					<td><a class="btn btn-secondary" href="<%=request.getContextPath() %>/guest/gInput.jsp">글쓰기</a></td>
				</tr>
			</table>
			
			<div class="col mt-5" style="text-align: right;">
				<% 
					if (pag != 1) {
				%>
						<a class="btn btn-primary" href="gList.jsp?pag=<%=1 %>">처음</a>
				<%
					}
					if (pag > 1) {
				%>
						<a class="btn btn-primary" href="gList.jsp?pag=<%=pag - 1 %>">이전페이지</a>
				<% 	
					}
				%>	
						<%=pag %>Page / <%=totPage %>Page		
				<%
					if (pag < totPage) {
				%>
						<a class="btn btn-primary" href="gList.jsp?pag=<%=pag + 1 %>">다음페이지</a>
				<%
					}
					if (pag != totPage) {
				%>
						<a class="btn btn-primary" href="gList.jsp?pag=<%=totPage %>">마지막</a>
				<%
					}
				%>
			</div>
		</div>
		
		<%
			for (int i=0; i<vos.size(); i++) {
				vo = vos.get(i);	
				
				String email = "-없음-";
				String homepage = "-없음-";
				
				if (vo.getEmail() != null) {
					email = vo.getEmail();
				}
				if (vo.getHomepage() != null) {
					homepage = vo.getHomepage();
				}
				
				String vDate = vo.getvDate().substring(0, vo.getvDate().length() - 3);
				String content = vo.getContent().replace("\n", "<br>");
		%>
		<table class="table table-borderless mt-5 mb-1">
			<tr>
				<td>방문번호: <%=curScrStartNo %></td>
				
				<%
					if (mid.equals("admin")) {				
				%>
				<td><a href="javascript:delCheck(<%=vo.getIdx() %>)" class="btn btn-warning">삭제</a></td>
				<%
					}
				%>
				
				<td style="text-align: right;">방문 아이피: <%=vo.getHostIp() %></td>
			</tr>
		</table>
		
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><%=vo.getName() %></td>
				<th>방문일자</th>
				<td><%=vDate %></td>
			</tr>
			<tr>
				<th>전자우편</th>
				<td colspan="3"><%=email %></td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3"><a href="<%=homepage %> " target="_blank" ><%=homepage %></a></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><%=content %></td>
			</tr>
		</table>
		<%
			curScrStartNo--;
			}
		%>
		
	</div>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>