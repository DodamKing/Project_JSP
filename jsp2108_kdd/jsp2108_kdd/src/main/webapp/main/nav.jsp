<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav>
	<div class="card-body nav-w">
	    <div>
            <c:if test="${sVO == null }">
	            <div class="text-center"><a href="userlogin.user">로그인</a></div>
            </c:if>
	        <div class="row">
	            <c:if test="${sVO != null }">
	           		<div class="col-2"><i class="fa-solid fa-user"></i></div>
		            <div class="col" id="dropMenu">
		            	<c:if test="${!empty sVO.nickNm }">${sVO.nickNm }</c:if>
		            	<c:if test="${empty sVO.nickNm }">${sMid}</c:if>
		            	<i class="fa-solid fa-caret-down"></i>
		            </div>
	            </c:if>
	        </div>
	        <div class="list-group my-group">
	            <ul>
                	<c:if test="${sVO != null }">
		                <li class="list-group-item list-group-item-light"><a href="">My 멤버십</a></li>
		                <li class="list-group-item list-group-item-light"><a href="">공지사항</a></li>
		                <li class="list-group-item list-group-item-light"><a href="">계정설정</a></li>
		                <li class="list-group-item list-group-item-light"><a onclick="return confirm('로그아웃 하시겠습니까?')" href="userlogout.user">로그아웃</a></li>
                	</c:if>
	            </ul>
	        </div>
	    </div>
	    <div>
	        <ul>
	            <li><a href="today">투데이</a></li>
                <li><a href="chart">차트</a></li>
                <li><a href="">최신앨범</a></li>
                <li><a href="">DJ 스테이션</a></li>
                <li><a href="">MAG</a></li>
                <li><a href="">이달의 노래</a></li>
            </ul>
            <ul>
                <div>보관함</div>
                <li><a href="">믹스테잎</a></li>
                <li><a href="">노래</a></li>
                <li><a href="">아티스트</a></li>
                <li><a href="">앨범</a></li>
                <li><a href="">플레이리스트</a></li>
                <li><a href="">받은노래</a></li>
                <li><a href="">구매한 MP3</a></li>
            </ul>
            <ul>
                <li><a>#내돈내듣</a></li>
                <li><a href="">ONSTAGE</a></li>
                <li><a href="">서비스 소개</a></li>
                <li><a href="">맴버십 구독</a></li>
                <li><a href="">사용자 리뷰</a></li>
                <li><a href="">커밍쑨</a></li>
            </ul>
        </div>
    </div>
</nav>