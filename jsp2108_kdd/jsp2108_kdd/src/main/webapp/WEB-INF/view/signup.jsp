<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music 회원가입</title>
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css" type="text/css"> --%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <jsp:include page="/main/bs4.jsp" />
    <style>
	    <%@include file="/css/signup.css" %>
    </style>
</head>

<body>
<jsp:include page="/main/title.jsp" />
<jsp:include page="/main/findModal.jsp" />
    <section>
        <div class="main-container">
            <h5 class="text-right"><a href="today">DD Music</a></h5>
            <div class="container p-3 my-3 border">
                <div class="form-container">
                    <form action="usersignupdo.user" method="post" name="signupForm">
                        <h2>회원가입</h2>
                        <div class="form-group">
                            <div class="lbl">
                                아이디 <button type="button" id="overlapCheck_btn"
                                    class="btn btn-sm btn-warning">아이디 중복체크</button>
                            </div>
                            <input class="form-control input-control" type="text" id="userId" name="userId"
                                placeholder="아이디" autofocus required>
                            <div id="demo1" class="demo-box"></div>
                        </div>
                        <div class="form-group">
                            <div class="lbl">
                                비밀번호
                            </div>
                            <input class="form-control input-control" type="password" id="pwd" name="pwd"
                                placeholder="비밀번호" required>
                            <input type="checkbox" id="typeChange"> 비밀번호 보기
                            <div id="demo2" class="demo-box"></div>
                        </div>
                        <div class="form-group">
                            <div class="lbl">
                                이메일
                            </div>
                            <input class="form-control input-control" type="text" id="email" name="email"
                                placeholder="name@example.com" required>
                            <div id="demo3" class="demo-box"></div>
                        </div>
                        <div class="form-group">
                            <div class="lbl">
                                휴대폰 번호
                            </div>
                            <div>
                                SKT <input class="mr-3" type="radio" name="telecom" value="SKT">
                                KT <input class="mr-3" type="radio" name="telecom" value="KT">
                                LGU+ <input class="mr-3" type="radio" name="telecom" value="LGU+">
                                알뜰폰 <input class="mr-3" type="radio" name="telecom" value="알뜰폰">
                            </div>
                            <div id="demo4-2" class="demo-box"></div>
                            <input class="form-control input-control" type="text" id="phoneNb" name="phoneNb"
                                placeholder="01012345678 ( - 제외 )" required>
                            <div id="demo4" class="demo-box"></div>
                        </div>
                        <div class="form-group">
                            <div class="lbl">
                                이름
                            </div>
                            <input class="form-control input-control" type="text" id="userNm" name="userNm"
                                placeholder="이름">
                            <div id="demo5" class="demo-box"></div>
                        </div>
                        <div class="form-group">
                            <div class="lbl">
                                닉네임
                            </div>
                            <input class="form-control input-control" type="text" id="nickNm" name="nickNm"
                                placeholder="닉네임">
                            <div id="demo6" class="demo-box"></div>
                        </div>
                        <div class="form-group">
                            <input class="form-control login-control" type="button" id="signup_btn" name="signup_btn"
                                value="회원가입">
                        </div>
                        <div class="form-group">
                            <input class="form-control login-control" type="reset" id="reset_btn" name="reset_btn"
                                value="취소">
                        </div>
			            <input type="hidden" id="demo99" name="demo99">
                    </form>
                    <div class="d-flex form-foot">
                        <div class="p-2 mr-auto"><a href="userlogin.user">로그인</a></div>
                        <div class="p-2 control-r" data-toggle="modal" data-target="#myModal1">계정 찾기</div>
                        <div class="p-2">|</div>
                        <div class="p-2 control-r" data-toggle="modal" data-target="#myModal2">비밀번호 찾기</div>
                    </div>
                </div>
            </div>
        <footer class="container">
            Copyright <strong>© DoubleD.</strong> All rights reserved.
        </footer>
    	</div>
    </section>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/signup.js?v=1"></script>
</body>

</html>