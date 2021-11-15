<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>
	<%@include file="../../include/bs4.jsp" %>
	<style>
		a {
    color: inherit;
}

a:hover {
    text-decoration: none;
    color: inherit;
}

.main-container {
    width: 400px;
    margin: 100px auto;
}

.form-container {
    width: 80%;
    margin: 60px auto;
}

form h2 {
    margin-bottom: 30px;
}

.input-control {
    border: none;
    background: none;
    border-bottom: 1px solid rgb(184, 184, 184);
    border-radius: 0px;
}

.input-control::placeholder {
    font-weight: 900;
    color: rgb(128, 128, 128);
}

.login-status {
    color: black;
    font-weight: 900;
    font-size: 0.8em;
    margin-left: 10px;
}

.check-control {
    cursor: pointer;
    margin: 10px 0px;
}

.login-control {
    background-color: #fee500;
    border-color: #fee500;
    height: 50px;
    font-weight: 900;
    margin: 30px 0px;
}

.form-foot {
    font-size: 0.8em;
    color: gray;
    font-weight: 900;
    height: 20px;
}

footer {
    text-align: center;
    color: gray;
    font-size: 0.8em;
}
	</style>
</head>
<body>
	<!-- 헤더영역 -->
	<%@include file="../../include/header_home.jsp" %>
	<%@include file="../../include/nav.jsp" %>
	
	<div class="container mt-5">
		<div class="main-container">
        <section>
            <div class="container p-3 my-3 border">
                <div class="form-container">
                    <form action="<%=request.getContextPath() %>/memLoginOk.mem" name="loginForm">
                        <h2 class="text-center">로그인</h2>
                        <div class="form-group">
                            <input class="form-control input-control" type="text" id="mid" name="mid" placeholder="아이디" autofocus required >
                        </div>
                        <div class="form-group">
                            <input class="form-control input-control" type="password" id="pwd" name="pwd" placeholder="비밀번호" required maxlength="9" >
                        </div>
                        <div class="form-group">
                            <input class="check-control" type="checkbox" id="loginCheck"> <span class="login-status">로그인 상태 유지</span>
                        </div>
                        <div id="demo" class="demo-box"></div>
                        <div class="form-group">
                            <input class="form-control login-control" type="submit" id="login_btn" name="login_btn" value="로그인">
                        </div>
                        <div class="d-flex form-foot">
                            <div class="p-2 mr-auto"><a href="<%=request.getContextPath() %>/memJoin.mem">회원가입</a></div>
                            <div class="p-2 control-r"><a href="">계정 찾기</a></div>
                            <div class="p-2 control-r">|</div>
                            <div class="p-2 control-r"><a href="">비밀번호 찾기</a></div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <footer class="container">
            Copyright <strong>© DoubleD.</strong> All rights reserved.
        </footer>
    	</div>
	</div>
	
	<!-- 푸터 -->
	<%@include file="../../include/footer.jsp" %>
	
</body>
</html>