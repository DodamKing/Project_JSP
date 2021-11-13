<%@page import="requestJson.SongVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="requestJson.HttpURLConnectionGetJson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	HttpURLConnectionGetJson songs = new HttpURLConnectionGetJson();
	ArrayList<SongVO> vos = songs.getSong();
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music Chart Top 100</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css?ver=2">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/top100.css?ver=2">
</head>

<body>
    <%@include file="../../main/playList.jsp" %>
    <%@include file="../../main/searchBar.jsp" %>
    <%@include file="../../main/nav.jsp" %>
    <%@include file="../../main/header.jsp" %>
    
    <section>
        <div class="container">
            <div class="card-body">
                <h2 class="mt-5 mb-5">DD Music Top 100</h2>
                <table class="table">
                    <%
                    	for (int i=0; i<vos.size(); i++) {
                    %>
                    
                    <tr>
                        <td><%=i+1 %></td>
                        <td><div class="imgBox"><img src="<%=vos.get(i).getImg() %>" alt=""></div></td>
                        <td>
                            <div name="top10Title"><%=vos.get(i).getTitle() %></div>
                            <div name="top10Artist"><%=vos.get(i).getArtist() %></div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    
                    <%
                    	}
                    %>
                    
                </table>
            </div>
        </div>
        
        <%@include file="../../main/sFooter.jsp" %>
    </section>
    <%@include file="../../main/footer.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js?ver=2"></script>
    <script src="<%=request.getContextPath() %>/js/player.js?ver=3"></script>
</body>

</html>