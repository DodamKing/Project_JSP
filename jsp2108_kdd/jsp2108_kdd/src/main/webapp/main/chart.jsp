<%@page import="requestJson.SongVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="requestJson.HttpURLConnectionGetJson"%>
<%@page import="org.json.JSONArray"%>
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
    <title>chart</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css?ver=4">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/top10.css?ver=1">
</head>

<body>
    <div id="play_listBox">
        <div class="container mt-3">
            <h4>이어지는 노래</h4>
            <div id="play_list" class="card-body pfc">
            </div>
        </div>
    </div>
    <div id="title_search" class="row">
        <h4 class="col"><a href="main.jsp">DD Music</a></h4>
        <div class="col-1"><i class="fa-solid fa-magnifying-glass"></i></div>
    </div>
    <nav>
        <div class="card-body nav-w">
            <div>
                <div class="row">
                    <div class="col-2"><i class="fa-solid fa-user"></i></div>
                    <div class="col" id="dropMenu">사용자 <i class="fa-solid fa-caret-down"></i></div>
                </div>
                <div class="list-group my-group">
                    <ul>
                        <li class="list-group-item list-group-item-light"><a href="">로그인</a></li>
                        <li class="list-group-item list-group-item-light"><a href="">회원가입</a></li>
                        <li class="list-group-item list-group-item-light"><a href="">공지사항</a></li>
                    </ul>
                </div>
            </div>
            <div>
                <ul>
                    <li><a href="">투데이</a></li>
                    <li><a href="chart.jsp">차트</a></li>
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
    <header>
        <div id="srch_bar">
            <form class="form-inline" action="">
                <input class="form-control mr-2 col" type="text" id="" name="" placeholder="DD Music 검색" autofocus>
                <button class="btn btn-secondary col-1" type="submit">Search</button>
            </form>
        </div>
        <video style="width: 100%;" src="" autoplay muted></video>
    </header>
    <section>
        <div class="container">
            <div class="card-body">
                <h2 class="mb-5">DD Music Top 100</h2>
                <table class="table">
                    <%
                    	for (int i=0; i<10; i++) {
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
        <div>
            <p>주소 : 충청북도 청주시 서원구 사직대로 109 그린컴퓨터아트</p>
            <p>이메일 : power6120@naver.com</p>
            <p>Copyright ⓒ 2021. DoubleD. All rights reserved.</p>
        </div>
    </section>
    <footer>
        <input id="play_bar" type="range" value="0">
        <div class="d-flex ml-4">
            <div class="pt-3">
                <div class="row">
                    <div class="imgBox"><img id="controls_img" src="<%=request.getContextPath() %>/img/music.png" alt=""></div>
                    <div class="controls-song ml-2">
                        <div id="controls_title">노래제목</div>
                        <div id="controls_artist">가수</div>
                    </div>
                </div>
            </div>
            <div class="ml-3 mt-3">
                <button class="btn" type="button"><i class="fa-regular fa-heart"></i></button>
                <button style="display: none;" class="btn" type="button"><i class="fa-solid fa-heart"></i></button>
                <button class="btn" type="button"><i class="fa-solid fa-music"></i></button>
                <button class="btn" type="button"><i class="fa-solid fa-ellipsis"></i></button>
            </div>
            <div class="ml-auto mr-auto mt-2">
                <button id="suffle_btn" class="btn" type="button" title="재생 방법 변경"><i
                        class="fa-solid fa-shuffle"></i></button>
                <button id="back_btn" class="btn" type="button"><i class="fa-solid fa-backward-step fa-2x"></i></button>
                <button id="play_btn" class="btn" type="button" title="재생/일시정지 선택"><i
                        class="fa-regular fa-circle-play fa-3x"></i></button>
                <button id="pause_btn" style="display: none;" class="btn" type="button"><i
                        class="fa-regular fa-circle-pause fa-3x"></i></button>
                <button id="next_btn" class="btn" type="button"><i class="fa-solid fa-forward-step fa-2x"></i></button>
                <button id="repeat_btn" class="btn" type="button" title="반복 재생 설정"><i
                        class="fa-solid fa-repeat"></i></button>
            </div>
            <div class="ml-auto d-flex mt-4">
                <div id="controls_time" class="mt-2">00:00 / 00:00</div>
                <div id="mute_btn1" class="ml-2"><button class="btn" type="button"><i
                            class="fa-solid fa-volume-high"></i></button></div>
                <div id="mute_btn2" class="ml-2" style="display: none;"><button class="btn" type="button"><i
                            class="fa-solid fa-volume-xmark"></i></button></div>
                <div class="ml-1 mt-1"><input id="volume_bar" type="range" min="0" max="100"></div>
            </div>
            <div class="ml-3 pt-3 mr-3">
                <button id="playlistUp_btn" class="btn" type="button"><i class="fa-solid fa-arrow-down-short-wide fa-2x fa-flip-vertical"></i></button>
                <button style="display: none;" id="playlistDown_btn" class="btn" type="button"><i class="fa-solid fa-arrow-down-wide-short fa-2x"></i></i></button>
            </div>
        </div>
    </footer>

    <audio id="player" src=""></audio>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js?ver=5"></script>
    <script src="<%=request.getContextPath() %>/js/player.js?ver=5"></script>
</body>

</html>