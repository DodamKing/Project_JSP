<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css?ver=1">
</head>

<body>
    <%@include file="/main/playList.jsp" %>
    <%@include file="/main/searchBar.jsp" %>
    <%@include file="/main/nav.jsp" %>
    <%@include file="/main/header.jsp" %>
    <section>
        
        <%@include file="/main/sFooter.jsp" %>
    </section>
    <%@include file="/main/footer.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js?ver=1"></script>
    <script src="<%=request.getContextPath() %>/js/player.js?ver=1"></script>
</body>

</html>