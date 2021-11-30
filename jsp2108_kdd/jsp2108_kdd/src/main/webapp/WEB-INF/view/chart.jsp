<%@page import="requestJson.SongVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="requestJson.HttpURLConnectionGetJson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music Chart Top 100</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <%--  <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/top100.css"> --%>
    <style>
	    <%@include file="/css/main.css" %>
	    <%@include file="/css/top100.css" %>
    </style>
</head>

<body>
    <%@include file="/main/playList.jsp" %>
    <%@include file="/main/searchBar.jsp" %>
    <%@include file="/main/nav.jsp" %>
    <%@include file="/main/header_NV.jsp" %>
    <section>
        <div class="container">
            <div class="card-body">
                <h2 class="mt-5 mb-5">DD Music Top 100</h2>
                <table class="table">
                    <c:forEach var="vo" items="${vos }" varStatus="st">
	                    <tr>
	                        <td>${st.index + 1}</td>
	                        <td><div class="imgBox"><a href="${fn:replace(vo.img, 50, 800) }" target="_blank"><img src="${vo.img }" alt=""></a></div></td>
	                        <td>
	                            <div name="top100Title"><a href="sotrack.so?idx=${vo.idx }">${vo.title }</a></div>
	                            <div name="top100Artist">${vo.artist }</div>
	                        </td>
	                        <td><button name="add_btn" type="button" class="btn"><i title="곡 추가" class="fas fa-plus"></i></button></td>
	                    </tr>
                    </c:forEach>
                    
                </table>
            </div>
        </div>
        <%@include file="/main/sFooter.jsp" %>
    </section>
    <%@include file="/main/footer.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
   		<%@include file="/js/main.js" %>
   		<%@include file="/js/player.js" %>
    </script>
</body>

</html>