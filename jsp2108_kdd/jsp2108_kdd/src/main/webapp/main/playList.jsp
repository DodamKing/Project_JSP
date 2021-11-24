<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="play_listContainer">
	<div id="play_listImg">
		<div>
			<img id="play_listImg_img" src="img/music.png">
		</div>
	</div>
	<div id="play_listBox">
	    <div class="container mt-3">
	        <h4>이어지는 노래</h4>
	        <div id="play_list" class="pfc mt-3" >
				<c:forEach var="vo" items="${playlist }" varStatus="st">
					<c:if test="${!empty playlist }">
			        	<div class='d-flex p-1'>
			        		<div class='imgBox mr-4'>
			        			<img src='${vo.img}'>
		        			</div>
			    			<div>
			    				<div class='playlist_t'>${vo.title }</div>
			    				<div class='playlist_a'>${vo.artist }</div>
			    			</div>
			    			<div class='ml-auto'>
			    				<button name='delete_btn' type='button' class='btn' onclick='dellist(${st.index })' ><i class='fa-regular fa-trash-can'></i></button>
							</div>
						</div>
					</c:if>
				</c:forEach>
	        </div>
	    </div>
	</div>
</div>
