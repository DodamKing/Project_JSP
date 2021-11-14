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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css?ver=1">
    
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
    <section>
	    <div class="main-container">
	   		<h5 class="text-right"><a href="<%=request.getContextPath() %>/">DD Music</a></h5>
	        <div class="container p-3 my-3 border">
                <div class="form-container">
                    <form action="userlogindo.user" name="loginForm">
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
                            <div class="p-2 mr-auto"><a href="">회원가입</a></div>
                            <div class="p-2 control-r"><a href="">계정 찾기</a></div>
                            <div class="p-2 control-r">|</div>
                            <div class="p-2 control-r"><a href="">비밀번호 찾기</a></div>
                        </div>
                    </form>
                </div>
            </div>
		    <footer class="container">
		        Copyright <strong>© DoubleD.</strong> All rights reserved.
		    </footer>
   		</div>
    </section>
</body>

</html>