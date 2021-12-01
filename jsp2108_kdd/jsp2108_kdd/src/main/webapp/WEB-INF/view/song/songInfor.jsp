<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("enter", "\n"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${vo.title } 곡정보</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
	    <%@include file="/css/main.css" %>
	    <%@include file="/css/top100.css" %>
	    
	    #playThum:hover {
	    	cursor: pointer;
	    }
    </style>
</head>

<body>
	<%@include file="/main/playList.jsp" %>
    <%@include file="/main/searchBar.jsp" %>
    <%@include file="/main/nav.jsp" %>
    <%@include file="/main/header_NV.jsp" %>

	<section>
	    <%@include file="/main/modal.jsp" %>
		<div class="container mt-5 mb-5 bg-secondary pb-3" style="width: 70%; border-radius: 5px;">
			<div>
				<h3 class="text-white pl-3 pt-4">${vo.title }<span style="float: right;" class="text-rigth btn btn-dark"><a href="chart">돌아가기</a></span></h3>
				<p class="text-white pl-3">노래 | ${vo.artist } | ${vo.releaseDate }</p>
				<div class="bg-white p-3 mb-3" style="border-radius: 15px;">
					<h5><b>곡정보</b></h5>
					<table class="table table-borderless text-secondary">
						<tr>
							<th width="100px">아티스트</th>
							<td>${vo.artist }</td>
							<td rowspan="7"><div id="playThum" title="재생" style="width: 300px; float: right;" onclick="playThis()"><img style="border-radius: 100%" src="${vo.img }"></div></td>
						</tr>
						<tr>
							<th>앨범</th>
							<td>${vo.album }</td>
						</tr>
						<tr>
							<th>발매</th>
							<td>${vo.releaseDate }</td>
						</tr>
						<tr>
							<th>장르</th>
							<td>${vo.genre }</td>
						</tr>
						<tr>
							<th>작곡</th>
							<td>${vo.music }</td>
						</tr>
						<tr>
							<th>작사</th>
							<td>${vo.words }</td>
						</tr>
						<tr>
							<th>편곡</th>
							<td>${vo.arranger }</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="bg-white p-3" style="border-radius: 15px;">
				<h5><b>가사정보</b></h5>
				<div class="text-secondary text-center">
					${fn:replace(vo.lyrics, enter, "<br>") }
				</div>
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
    <script>
    	function playThis() {
    		let res = "<div class='d-flex p-1'><div class='imgBox mr-4'><img src='${vo.img}'></div><div><div class='playlist_t' title='${vo.title}'>${vo.title}</div><div class='playlist_a' title='${vo.artist}'>${vo.artist}</div></div><div class='ml-auto'><button name='delete_btn' type='button' class='btn' onclick='delList(${vo.idx})' ><i class='fa-regular fa-trash-can'></i></button></div></div>";
    		play_list.innerHTML = res;
    		
    		let title = "${vo.title}".replace(/[\\\/:*?\"<>|]/g, "");
    		let artist = "${vo.artist}".replace(/[\\\/:*?\"<>|]/g, "");

    		/* let hostIndex = location.href.indexOf(location.host) + location.host.length;
    		let contextPath = location.href.substring(hostIndex, location.href.indexOf("/", hostIndex + 1)); */

    	    /* songUrl = contextPath + "/music/" + title + " - " + artist + ".mp3"; */
    	    songUrl = "music/" + title + " - " + artist + ".mp3";
    		player.src = songUrl;
    	    player.load();
    	    controls_img.src = "${vo.img}";
    	    controls_title.innerHTML = "${vo.title}";
    	    controls_artist.innerHTML = "${vo.artist}";
    	    controls_title.title = "${vo.title}";
    	    controls_artist.title = "${vo.artist}";
    		play_listImg_img.src = "${vo.img}".replace("50", "600");
    		
    		thum_list.push("${vo.img}");
    		sw = 1;
    		
		 	$(play_btn).hide();
		    $(pause_btn).show();
		    player.play();
    		
		}
    </script>
</body>

</html>