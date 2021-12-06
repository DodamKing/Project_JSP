<%@page import="requestJson.SongVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="requestJson.HttpURLConnectionGetJson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <%@include file="/main/bs4.jsp" %>
    <style>
	    <%@include file="/css/main.css" %>
	    <%@include file="/css/top100.css" %>
    </style>
</head>

<body>
    <%@include file="../../main/playList.jsp" %>
    <%@include file="../../main/searchBar.jsp" %>
    <%@include file="../../main/nav.jsp" %>
    <%@include file="../../main/header.jsp" %>
    
    <section>
    	<%@include file="/main/modal.jsp" %>
        <div class="container">
            <div class="section-row-box">
                <div class="section-row">
                    <h5><a href=""><b>매거진 &gt;</b> </a></h5>
                    <div class="row">
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211201_273/1638328877235nHVRM_JPEG/%C4%BF%B9%F61.jpg?type=w720"
                                    alt=""></a>
                            <a href="">장우혁,<br> 변화와 불변</a>
                            <div>2021.12.01</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211126_197/1637908989494Tbm6x_JPEG/%C4%BF%B9%F61.jpg?type=w720"
                                    alt=""></a>
                            <a href="">힙한 소리꾼들의 전쟁,<br> &lt;풍류대장&gt;  </a>
                            <div>2021.11.26</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211129_104/1638174821362S7VVq_JPEG/%C4%BF%B9%F61.jpg?type=w720"
                                    alt=""></a>
                            <a href="">New Release #69,<br> 나일 호란, 앤마리</a>
                            <div>2021.11.29</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211123_53/1637658571914Rq5LR_JPEG/%C4%BF%B9%F61.jpg?type=w720"
                                    alt=""></a>
                            <a href="">마법 그 자체인 그 영화!,<br> &lt;엔칸토&#58; 마법의 세계&gt; </a>
                            <div>2021.11.26</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211122_73/1637567368380lItzc_JPEG/%C4%BF%B9%F61.jpg?type=w720"
                                    alt=""></a>
                            <a href="">하이틴 그 자체로 돌아온<br>전소미</a>
                            <div>2021.11.24</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img"
                                    src="https://music-phinf.pstatic.net/20211028_79/1635391214685dCLaq_JPEG/1.jpeg?type=w720"
                                    alt=""></a>
                            <a href="">이주의 디깅 #121 아델</a>
                            <div>2021.10.26</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/a1.png" alt=""></a>
                            <a href="">New Release #64 : 디제이 스네이크,<br> 홍광호</a>
                            <div>2021.10.25</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/a2.png" alt=""></a>
                            <a href="">꼭 들어야 할 여섯 장의 앨범 : 따마,<br> 데드보이즈</a>
                            <div>2021.10.22</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/11..png" alt=""></a>
                            <a href="">이주의 디깅 #120 스트릿 우먼 파이터</a>
                            <div>2021.10.19</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/12.png" alt=""></a>
                            <a href="">New Release #63 : 아델,<br> 스텔라 장</a>
                            <div>2021.10.18</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/13.png" alt=""></a>
                            <a href="">무엇이든 물어보세요 : 트라이비(TRI.BE)</a>
                            <div>2021.10.14</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-row-box">
                <div class="section-row">
                    <h5><a href=""><b>NEWS</b></a></h5>
                    <div class="row">
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="https://music-phinf.pstatic.net/20211206_50/1638755421959AWsJr_JPEG/1206_txt_%B4%BA%BD%BA.jpg?type=f310_182" alt=""></a>
                            <a href="">투모로우바이투게더가 롤링스톤의 '올해의 앨범'에 선정되었습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="https://music-phinf.pstatic.net/20211203_148/1638494270842kFmBn_JPEG/1203_%C1%A4%C1%D8%C0%CF.jpg?type=f310_182" alt=""></a>
                            <a href="">정준일이 소극장 콘서트 '겨울'을 개최합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="https://music-phinf.pstatic.net/20211202_168/1638418143389ghTzR_PNG/1202_%C8%AD%BB%E7%B4%BA%BD%BA.png?type=f310_182" alt=""></a>
                            <a href="">화사가 빌보드 월드 디지털 송 세일 차트에 진입하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="https://music-phinf.pstatic.net/20211201_3/1638327364872R9kak_JPEG/1201_nct127.jpg?type=f310_182" alt=""></a>
                            <a href="">NCT 127이 '빌보드 200'에 10주 연속 진입하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="https://music-phinf.pstatic.net/20211130_161/163823852954470Gao_PNG/1130_sf9%B4%BA%BD%BA.png?type=f310_182" alt=""></a>
                            <a href="">SF9이 'RUMINATION'으로 초동 판매량 자체 최고기록을 경신하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/1.png" alt=""></a>
                            <a href="">아델의 Easy on Me가 '빌보드 핫 100' 1위를 차지하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/2.png" alt=""></a>
                            <a href="">라잇썸의 'VAVACE'가 빌보드 월드 디지털 송 차트에서 8위를 차지하였습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/3.jpg" alt=""></a>
                            <a href="">온앤오프가 첫 단독 콘서트를 개최합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/4.png" alt="">
                            </a>
                            <a href="">자우림이 단독 콘서트 '영원한 사랑'을 개최 합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/5.jpg" alt=""></a>
                            <a href="">이달의 소녀가 오리콘 데일리 차트 3위에 올랐습니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/6.png" alt=""></a>
                            <a href="">황치열이 2년 만에 단독 콘서트를 개최합니다</a>
                            <div>관련 뉴스 보기</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="../../main/sFooter.jsp" %>
    </section>
    <%@include file="../../main/footer.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
   		<%@include file="/js/main.js" %>
   		<%@include file="/js/player.js" %>
    </script>
</body>

</html>