<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="play_listContainer">
	<div id="play_listImg">
		<div>
			<img id="play_listImg_img" src="<%=request.getContextPath() %>/img/music.png">
			<!-- <img src="https://image.bugsm.co.kr/album/images/600/40662/4066238.jpg?version=20211020063535.0"> -->
		</div>
	</div>
	<div id="play_listBox">
	    <div class="container mt-3">
	        <h4>이어지는 노래</h4>
	        <div id="play_list" class="pfc mt-3">
	        </div>
	    </div>
	</div>
</div>
