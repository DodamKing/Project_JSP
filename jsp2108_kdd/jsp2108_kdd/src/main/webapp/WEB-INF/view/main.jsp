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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css" >
</head>

<body>
    <%@include file="../../main/playList.jsp" %>
    <%@include file="../../main/searchBar.jsp" %>
    <%@include file="../../main/nav.jsp" %>
    <%@include file="../../main/header.jsp" %>
    
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
                            <a href="" class="section-img-box"><img class="section-img" src="img/a1.png" alt=""></a>
                            <a href="">New Release #64 : 디제이 스네이크, 홍광호</a>
                            <div>2021.10.25</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/a2.png" alt=""></a>
                            <a href="">꼭 들어야 할 여섯 장의 앨범 : 따마, 데드보이즈</a>
                            <div>2021.10.22</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/11..png" alt=""></a>
                            <a href="">이주의 디깅 #120 스트릿 우먼 파이터</a>
                            <div>2021.10.19</div>
                        </div>
                        <div class="col">
                            <a href="" class="section-img-box"><img class="section-img" src="img/12.png" alt=""></a>
                            <a href="">New Release #63 : 아델 , 스텔라 장</a>
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
                    <h5><a href="">NEWS > </a></h5>
                    <div class="row">
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
                            <dia href="" v class="section-img-box"><img class="section-img" src="img/4.png" alt="">
                            </dia>
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
    <script src="<%=request.getContextPath() %>/js/main.js?ver=2"></script>
    <script src="<%=request.getContextPath() %>/js/player.js?ver=4"></script>
</body>

</html>