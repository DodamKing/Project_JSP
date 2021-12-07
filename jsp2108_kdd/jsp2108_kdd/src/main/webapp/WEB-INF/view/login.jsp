<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD Music 로그인</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <jsp:include page="/main/bs4.jsp" />
    <style>
	    <%@include file="/css/login.css" %>
    </style>
</head>

<body>
<jsp:include page="/main/title.jsp" />

 <div class="modal" id="myModal1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">계정찾기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="input-group">
					<div class="input-group-prepend mb-3">
						<span class="input-group-text"> 이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</span>
					</div>
					<input id="userNm" name="userNm" type="text" class="form-control"/>
				</div>
				<div class="input-group">
					<div class="input-group-prepend mb-3">
						<span class="input-group-text">휴대폰 번호</span>
					</div>
					<input id="phoneNb1" name="phoneNb1" type="text" class="form-control"/>
				</div>
				<div class="input-group">
					<div class="input-group-prepend mb-3">
						<span class="input-group-text">이메일 주소</span>
					</div>
					<input id="email1" name="email1" type="text" class="form-control"/>
				</div>
				<div id="demo1" class="form-control"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" onclick="findUserId()" >확인</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

 <div class="modal" id="myModal2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 찾기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="input-group">
					<div class="input-group-prepend mb-3">
						<span class="input-group-text"> 아&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;디</span>
					</div>
					<input id="userId" name="userId" type="text" class="form-control"/>
				</div>
				<div class="input-group">
					<div class="input-group-prepend mb-3">
						<span class="input-group-text">휴대폰 번호</span>
					</div>
					<input id="phoneNb2" name="phoneNb2" type="text" class="form-control"/>
				</div>
				<div class="input-group">
					<div class="input-group-prepend mb-3">
						<span class="input-group-text">이메일 주소</span>
					</div>
					<input id="email2" name="email2" type="text" class="form-control"/>
				</div>
				<div id="demo2" class="form-control"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" onclick="findUserPwd()">확인</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

    <section>
	    <div class="main-container">
	   		<h5 class="text-right"><a href="today">DD Music</a></h5>
	        <div class="container p-3 my-3 border">
                <div class="form-container">
                    <form action="userlogindo.user" method="post" name="loginForm">
                        <h2>로그인</h2>
                        <div class="form-group">
                            <input class="form-control input-control" type="text" id="userId" name="userId"
                                placeholder="아이디" autofocus required>
                        </div>
                        <div class="form-group">
                            <input class="form-control input-control" type="password" id="pwd" name="pwd"
                                placeholder="비밀번호" required>
                        </div>
                        <div class="form-group">
                            <input class="check-control" type="checkbox" id="loginCheck"> <span class="login-status">로그인
                                상태 유지</span>
                        </div>
                        <div id="demo" class="demo-box"></div>
                        <div class="form-group">
                            <input class="form-control login-control" type="submit" id="login_btn" name="login_btn"
                                value="로그인">
                        </div>
                        <div class="d-flex form-foot">
                            <div class="p-2 mr-auto"><a href="<%=request.getContextPath() %>/usersignup.user">회원가입</a></div>
                            <div class="p-2 control-r" data-toggle="modal" data-target="#myModal1">계정 찾기</div>
                            <div class="p-2">|</div>
                            <div class="p-2 control-r" data-toggle="modal" data-target="#myModal2">비밀번호 찾기</div>
                        </div>
                    </form>
                </div>
            </div>
		    <footer class="container">
		        Copyright <strong>© DoubleD.</strong> All rights reserved.
		    </footer>
   		</div>
    </section>
    
    <script>
    	function findUserId() {
			let data = {
				userNm : userNm.value,
				phoneNb : phoneNb1.value,
				email : email1.value
			}
			
			$.ajax({
				type : "post",
				url : "finduserId.user",
				data : data,
				success : (mid) => {
					if (mid == "") {
						demo1.innerHTML = "찾는 아이디가 없습니다.";
					}
					else {
						demo1.innerHTML = "아이디는 <b>" + mid + "</b> 입니다.";	
					}
				}
			});
		}
    	
    	function findUserPwd() {
				
		}
    	
    </script>
</body>

</html>