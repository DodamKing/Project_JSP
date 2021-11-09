<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/main.css?ver=3">
    <link rel="stylesheet" href="../css/top10.css?ver=1">
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
                    <!-- <li><a href="http://127.0.0.1:5000/">차트</a></li> -->
                    <li><a href="">차트</a></li>
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
            <div class="section-row-box">
                <div class="section-row">
                    <h5><a href="">매거진 > </a></h5>
                    <div class="row">
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211028_79/1635391214685dCLaq_JPEG/1.jpeg?type=w720"
                                    alt=""></a>
                            <a href="">이주의 디깅 #121 아델</a>
                            <div>2021.10.26</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/a1.png" alt=""></a>
                            <a href="">New Release #64 : 디제이 스네이크, 홍광호</a>
                            <div>2021.10.25</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/a2.png" alt=""></a>
                            <a href="">꼭 들어야 할 여섯 장의 앨범 : 따마, 데드보이즈</a>
                            <div>2021.10.22</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/11..png" alt=""></a>
                            <a href="">이주의 디깅 #120 스트릿 우먼 파이터</a>
                            <div>2021.10.19</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/12.png" alt=""></a>
                            <a href="">New Release #63 : 아델 , 스텔라 장</a>
                            <div>2021.10.18</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/13.png" alt=""></a>
                            <a href="">무엇이든 물어보세요 : 트라이비(TRI.BE)</a>
                            <div>2021.10.14</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-row-box">
                <div class="section-row">
                    <h5><a href="">NEWS > </a></h5>
                    <div class="row">
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/1.png" alt=""></a>
                            <a href="">아델의 Easy on Me가 '빌보드 핫 100' 1위를 차지하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/2.png" alt=""></a>
                            <a href="">라잇썸의 'VAVACE'가 빌보드 월드 디지털 송 차트에서 8위를 차지하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/3.jpg" alt=""></a>
                            <a href="">온앤오프가 첫 단독 콘서트를 개최합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <dia href="" v class="section-img-box"><img class="section-img" src="../img/4.png" alt="">
                            </dia>
                            <a href="">자우림이 단독 콘서트 '영원한 사랑'을 개최 합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/5.jpg" alt=""></a>
                            <a href="">이달의 소녀가 오리콘 데일리 차트 3위에 올랐습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="../img/6.png" alt=""></a>
                            <a href="">황치열이 2년 만에 단독 콘서트를 개최합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <h2 class="mb-5">DD Music Top 10</h2>
                <table class="table">
                    <tr>
                        <td>1</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/40662/4066238.jpg?version=20211020063535.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">strawberry moon</div>
                            <div name="top10Artist">아이유(IU)</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/204243/20424398.jpg?version=20211015010640.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">Savage</div>
                            <div name="top10Artist">aespa</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/204256/20425653.jpg?version=20211020003234.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">Upper Side Dreamin’</div>
                            <div name="top10Artist">ENHYPEN</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/40666/4066688.jpg?version=20211030065545.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">낮 밤 (feat. 박재범)</div>
                            <div name="top10Artist">이영지</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/40665/4066507.jpg?version=20211027003705.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">나비효과</div>
                            <div name="top10Artist">볼빨간사춘기</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/204256/20425653.jpg?version=20211020003234.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">Attention, please!</div>
                            <div name="top10Artist">ENHYPEN</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/40665/4066507.jpg?version=20211027003705.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">너는 내 세상이었어</div>
                            <div name="top10Artist">볼빨간사춘기</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/204256/20425653.jpg?version=20211020003234.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">모 아니면 도 (Go Big or Go Home)</div>
                            <div name="top10Artist">ENHYPEN</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/204282/20428261.jpg?version=20211027010045.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">Favorite (Vampire)</div>
                            <div name="top10Artist">NCT</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td><div class="imgBox"><img src="https://image.bugsm.co.kr/album/images/50/40667/4066711.jpg?version=20211030065544.0" alt=""></div></td>
                        <td>
                            <div name="top10Title">XOXO</div>
                            <div name="top10Artist">전소미</div>
                        </td>
                        <td><button name="add_btn" type="button" class="btn"><i class="fas fa-plus"></i></button></td>
                    </tr>
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
                    <div class="imgBox"><img id="controls_img" src="../img/music.png" alt=""></div>
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
    <script src="../js/main.js?ver=2"></script>
    <script src="../js/player.js?ver=3"></script>
</body>

</html>