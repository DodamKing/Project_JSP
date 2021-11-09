<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");

	String mid = "";
	String pwd = "";
	
	if (request.getParameter("mid") != null) {
		mid = request.getParameter("mid");
	}
	if (request.getParameter("pwd") != null) {
		pwd = request.getParameter("pwd");
	}
	
	if (mid.equals("admin") && pwd.equals("1234")) {
		session.setAttribute("sAid", mid);
		
		out.println("<script>");
		out.println("alert('관리자 로그인 성공!');");
		out.println("location.href='gList.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('관리자 로그인 실패!');");
		out.println("location.href='gList.jsp';");
		out.println("</script>");
	}
%>