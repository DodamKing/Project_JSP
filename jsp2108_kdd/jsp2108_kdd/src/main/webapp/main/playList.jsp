<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="play_listContainer">
	<div id="play_listImg">
		<div>
			<c:if test="${empty sPlaylist }"><img id="play_listImg_img" src="img/music.png"></c:if>
			<c:if test="${!empty sPlaylist }"><img id="play_listImg_img" src="${fn: replace(sPlaylist[0].img, '50', '600') }"></c:if>
		</div>
	</div>
	<div id="play_listBox">
	    <div class="container mt-3">
	        <h4>이어지는 노래</h4>
	        <div id="play_list" class="pfc mt-3" >
				<c:forEach var="vo" items="${sPlaylist }" varStatus="st">
					<c:if test="${!empty sPlaylist }">
			        	<div class='d-flex p-1'>
			        		<div class='imgBox mr-4'>
			        			<img src='${vo.img}'>
		        			</div>
			    			<div>
			    				<div class='playlist_t' title="${vo.title }">${vo.title }</div>
			    				<div class='playlist_a' title="${vo.artist }">${vo.artist }</div>
			    			</div>
			    			<div class='ml-auto'>
			    				<button name='delete_btn' type='button' class='btn' onclick='delList(${st.index })' ><i title="플레이리스트에서 제거" class='fa-regular fa-trash-can'></i></button>
							</div>
						</div>
					</c:if>
				</c:forEach>
	        </div>
	    </div>
	</div>
</div>
