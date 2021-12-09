<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music Search Result</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <%@include file="/main/bs4.jsp" %>
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
    	<%@include file="/main/modal.jsp" %>
        <div class="container">
            <div class="card-body">
                <h2 class="mt-5 mb-5">DD Music 검색결과</h2>
                <table class="table" style="width: 80%; margin: auto;">
                    <c:forEach var="vo" items="${vos }" varStatus="st">
	                    <tr>
	                        <td><div class="imgBox"><img name="top100Img" src="${vo.img }" alt=""></div></td>
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