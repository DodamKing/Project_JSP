<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<%
	Calendar calToday = Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	int yy = request.getParameter("yy")==null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
	int mm = request.getParameter("mm")==null ? cal.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
	
	int startWeek;
	
	if (mm < 0) {
		mm = 11;
		yy--;
	}
	
	if (mm > 11) {
		mm = 0;
		yy++;
	}
	cal.set(yy, mm, 1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>달력</title>
	<%@include file="/include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="/include/header_home.jsp" %>
	<%@include file="/include/nav.jsp" %>
	
	<div class="container mt-5">
		<h2>달력</h2>
		<div>
    		<a href="calendar.st">오늘</a>
    		<a href="${ctp}/calendar.st?yy=<%=yy-1%>&mm=<%=mm%>">이전년도</a>
    		<a href="${ctp}/calendar.st?yy=<%=yy%>&mm=<%=mm-1%>">이전월</a>
    		<a href="${ctp}/calendar.st?yy=<%=yy%>&mm=<%=mm+1%>">다음월</a>
    		<a href="${ctp}/calendar.st?yy=<%=yy+1%>&mm=<%=mm%>">다음년도</a>
		</div>
		<div class="card-body">
			<h3 class="container"><%=yy %>년 <%=mm + 1 %>월</h3>
			<table  class="table table-bordered table-dark">
				<tr class="text-center">
					<th><font color="red">일</font></th>
			  	  	<th>월</th>
			  	  	<th>화</th>
			  	  	<th>수</th>
			  	  	<th>목</th>
			  	  	<th>금</th>
			  	  	<th><font color="blue">토</font></th>
				</tr>
				<tr>
					<%
						startWeek = cal.get(Calendar.DAY_OF_WEEK);
						cal.set(yy, mm - 1, 1);
						for (int i=startWeek - 2; i>=0; i--) {
							out.println("<td style='opacity: 0.7; color: gray;'>" + (cal.getActualMaximum(Calendar.DAY_OF_MONTH) - i) +"</td>");	
						}
						if (mm < 0) {
							mm = 11;
							yy--;
						}
						
						if (mm > 11) {
							mm = 0;
							yy++;
						}
						cal.set(yy, mm, 1);
						while (cal.get(Calendar.MONTH) == mm) {
							if (cal.get(Calendar.DAY_OF_WEEK) == 1) {
								out.println("<td class='align-top' style='height: 150px; color: red;'>" + cal.get(Calendar.DATE) + "</td>");
							}
							else if (cal.get(Calendar.DAY_OF_WEEK) == 7) {
								out.println("<td class='align-top' style='height: 150px; color: blue;'>" + cal.get(Calendar.DATE) + "</td>");
							}
							else if (cal.get(Calendar.YEAR)==calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calToday.get(Calendar.MONTH) && cal.get(Calendar.DATE)==calToday.get(Calendar.DATE)) {
								out.println("<td class='align-top' style='height: 150px; background: gray;'>" + cal.get(Calendar.DATE) + "</td>");
							}
							else {
								out.println("<td class='align-top' style='height: 150px;'>" + cal.get(Calendar.DATE) + "</td>");
							}
							if (cal.get(Calendar.DAY_OF_WEEK) == 7) {
								out.println("</tr><tr>");
							}
							cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE) + 1);
						}
						if (cal.get(Calendar.DAY_OF_WEEK) <= 7) {
							for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) {
								out.println("<td style='opacity: 0.7; color: gray;'>" + cal.get(Calendar.DATE) + "</td>");
								cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH + 1), cal.get(Calendar.DATE) + 1);
							}
						}
					%>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="/include/footer.jsp" %>
	
</body>
</html>