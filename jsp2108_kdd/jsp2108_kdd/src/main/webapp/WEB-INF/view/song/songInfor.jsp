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
	</style>
	
	<style>
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
		<div class="container mt-5 mb-5 pb-3 bg-dark" style="width: 70%; border-radius: 5px;">
			<div>
				<c:if test="${empty vo.idx }">	
					<h3 class="text-white pl-3 pt-4">준비중입니다.<span style="float: right;" class="text-rigth btn btn-secondary"><a href="javascript:history.back()">돌아가기</a></span></h3>
				</c:if>
				<c:if test="${!empty vo.idx }">
					<h3 class="text-white pl-3 pt-4">${vo.title }<span style="float: right;" class="text-rigth btn btn-secondary"><a href="javascript:history.back()">돌아가기</a></span></h3>
					<p class="text-white pl-3">
						노래 | ${vo.artist } | ${vo.releaseDate }
						<c:if test="${empty sMid }">
				            <button id="songlike_btn1" class="btn" type="button" title="좋아요"><i class="fa-regular fa-heart"></i></button>
				            <button id="songlike_btn2" style="display: none;" class="btn" type="button"><i class="fa-solid fa-heart text-danger"></i></button>
			        	</c:if>
			        	<c:if test="${fn:contains(vo.likeList, sMid) && !empty sMid }">
				            <button id="songlike_btn1" style="display: none;" class="btn" type="button" title="좋아요"><i class="fa-regular fa-heart"></i></button>
				            <button id="songlike_btn2" class="btn" type="button"><i class="fa-solid fa-heart text-danger"></i></button>
			        	</c:if>
			        	<c:if test="${!fn:contains(vo.likeList, sMid) && !empty sMid }">
				            <button id="songlike_btn1" class="btn" type="button" title="좋아요"><i class="fa-regular fa-heart"></i></button>
				            <button id="songlike_btn2" style="display: none;" class="btn" type="button"><i class="fa-solid fa-heart text-danger"></i></button>
			        	</c:if>
			        	<span id="songLikeCnt">${vo.likeCnt }</span>
		        	</p>
				</c:if>
				<div class="p-3 mb-3" style="border-radius: 15px; background-color: rgb(35, 35, 35);">
					<h5><b>곡정보</b></h5>
					<c:if test="${!empty vo.idx }">
						<table class="table table-borderless text-mute">
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
					</c:if>
				</div>
			</div>
			<div class="p-3" style="border-radius: 15px; background-color: rgb(35, 35, 35);">
				<h5><b>가사정보</b></h5>
				<div class="text-light text-center">
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
    	
    	$("#songlike_btn1").click(() => {
    		$("#songlike_btn1").hide();
    		$("#songlike_btn2").show();
    		
    		if (${empty sMid}) return;

    		let data = {
    			title : "${vo.title}",
    			artist : "${vo.artist}"
    		}
    		
    		$.ajax({
    			type : "post",
    			url : "solike.so",
    			data : data,
    			success : () => {
    				$("#songLikeCnt").load(window.location.href + " #songLikeCnt");
    			}
    		});
    	}); 
    	
    	$("#songlike_btn2").click(() => {
    		$("#songlike_btn2").hide();
    		$("#songlike_btn1").show();
    		
    		if (${empty sMid}) return;
 
    		let data = {
    				title : "${vo.title}",
    				artist : "${vo.artist}"
    			}
    		
			$.ajax({
				type : "post",
				url : "sounlike.so",
				data : data,
				success : () => {
    				$("#songLikeCnt").load(window.location.href + " #songLikeCnt");
    			}
			});    		
    	}); 
    		
    	
    </script>
</body>

</html>