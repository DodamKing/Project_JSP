<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
				pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String strToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memJoin.jsp</title>
<%@include file="../../include/bs4.jsp"%>
</head>
<body>
				<!-- 헤더영역 -->
				<%@include file="../../include/header_home.jsp"%>
				<%@include file="../../include/nav.jsp"%>

				<div class="container mt-5">
								<h2>회 원 가 입</h2>
								<form name="myform" method="post" action="memJoinOk.mem"
												class="was-validated mt-5">
												<div class="form-group">
																<label for="mid">아이디 &nbsp; &nbsp;<input
																				type="button" value="아이디 중복체크"
																				class="btn btn-secondary btn-sm" onclick="idCheck()" /></label> <input
																				type="text" class="form-control" id="mid"
																				placeholder="아이디를 입력하세요." name="mid" required
																				autofocus />
												</div>
												<div class="form-group">
																<label for="pwd">비밀번호</label> <input type="password"
																				class="form-control" id="pwd"
																				placeholder="비밀번호를 입력하세요." name="pwd" maxlength="9"
																				required />
												</div>
												<div class="form-group">
																<label for="nickname">닉네임&nbsp; &nbsp;<input
																				type="button" value="닉네임 중복체크"
																				class="btn btn-secondary btn-sm" onclick="nickCheck()" /></label> <input
																				type="text" class="form-control" id="nickName"
																				placeholder="별명을 입력하세요." name="nickName" required />
												</div>
												<div class="form-group">
																<label for="name">성명</label> <input type="text"
																				class="form-control" id="name"
																				placeholder="성명을 입력하세요." name="name" required />
												</div>
												<div class="form-group">
																<label for="email">Email address</label>
																<div class="input-group mb-3">
																				<input type="text" class="form-control"
																								placeholder="Email" id="email1" name="email1"
																								required />
																				<div class="input-group-append">
																								<select name="email2" class="custom-select">
																												<option value="naver.com" selected>naver.com</option>
																												<option value="hanmail.net">hanmail.net</option>
																												<option value="hotmail.com">hotmail.com</option>
																												<option value="gmail.com">gmail.com</option>
																												<option value="nate.com">nate.com</option>
																												<option value="yahoo.com">yahoo.com</option>
																								</select>
																				</div>
																</div>
												</div>
												<div class="form-group">
																<div class="form-check-inline">
																				<span class="input-group-text">성별</span> &nbsp;
																				&nbsp; <label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="gender" value="남자" checked>남자
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="gender" value="여자">여자
																				</label>
																</div>
												</div>
												<div class="form-group">
																<label for="birthday">생일</label> <input type="date"
																				name="birthday" value="<%=strToday %>" class="form-control" />
												</div>
												<div class="form-group">
																<div class="input-group mb-3">
																				<div class="input-group-prepend">
																								<span class="input-group-text">전화번호</span>
																								&nbsp;&nbsp; <select name="tel1"
																												class="custom-select">
																												<option value="010" selected>010</option>
																												<option value="02">서울</option>
																												<option value="031">경기</option>
																												<option value="032">인천</option>
																												<option value="041">충남</option>
																												<option value="042">대전</option>
																												<option value="043">충북</option>
																												<option value="051">부산</option>
																												<option value="052">울산</option>
																												<option value="061">전북</option>
																												<option value="062">광주</option>
																								</select>-
																				</div>
																				<input type="text" name="tel2" size=4 maxlength=4
																								class="form-control" />- <input type="text"
																								name="tel3" size=4 maxlength=4
																								class="form-control" />
																</div>
												</div>
												<div class="form-group">
																<label for="address">주소</label> 
																<input type="hidden" class="form-control" id="address" name="address" />
																<label for="address">우편번호</label> <input type="text" id="sample4_postcode" placeholder="우편번호">
																<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
																<label for="address">도로명주소</label> <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
																<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
																<span id="guide" style="color:#999;display:none"></span>
																<label for="address">상세주소</label> <input type="text" id="sample4_detailAddress" placeholder="상세주소">
																<input type="text" id="sample4_extraAddress" placeholder="참고항목">
												</div>
												<div class="form-group">
																<label for="homepage">Homepage address</label> <input
																				type="text" class="form-control" name="homePage"
																				value="http://" 
																				id="homePage" />
												</div>
												<div class="form-group">
																<label for="name">직업</label> <select
																				class="form-control" id="job" name="job">
																				<option>학생</option>
																				<option>회사원</option>
																				<option>공무원</option>
																				<option>군인</option>
																				<option>의사</option>
																				<option>법조인</option>
																				<option>세무인</option>
																				<option>자영업</option>
																				<option>기타</option>
																</select>
												</div>
												<div class="form-group">
																<div class="form-check-inline">
																				<span class="input-group-text">취미</span> &nbsp;
																				&nbsp; <label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="등산" name="hobby" />등산
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="낚시" name="hobby" />낚시
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="수영" name="hobby" />수영
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="독서" name="hobby" />독서
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="영화감상" name="hobby" />영화감상
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="바둑" name="hobby" />바둑
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="축구" name="hobby" />축구
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								value="기타" name="hobby" checked />기타
																				</label>
																</div>
												</div>
												<div class="form-group">
																<label for="content">자기소개</label>
																<textarea class="form-control" id="content" rows="5"
																				name="content"> </textarea>
												</div>
												<div class="form-group">
																<div class="form-check-inline">
																				<span class="input-group-text">정보공개</span> &nbsp;
																				&nbsp; <label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="userInfor" value="공개" checked />공개
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="userInfor" value="비공개" />비공개
																				</label>
																</div>
												</div>
												<div class="mt-5 mb-5 text-right">
																<button type="button" class="btn btn-secondary mr-1"
																				onclick="fCheck()">회원가입</button>
																<button type="reset" class="btn btn-secondary mr-1">다시작성</button>
																<button type="button" class="btn btn-secondary"
																				onclick="location.href='<%=request.getContextPath() %>/memLogin.mem';">돌아가기</button>
												</div>
								</form>
				</div>

				<!-- 푸터 -->
				<%@include file="../../include/footer.jsp"%>
				
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath() %>/js/daumApi.js"></script>
	<script>
		let idCheckOn = 0;
		
		mid.addEventListener("keyup", () => {
			idCheckOn = 0;
		});
		
		function idCheck() {
			let mid = myform.mid.value;
			let url = "<%=request.getContextPath() %>/idCheck.mem?mid=" + mid;
			
			if (mid == "") {
				alert("아이디를 입력하세요.");
				myform.mid.focus();
			}
			else {
				window.open(url, "nWin", "width=500px, height=250px");
				idCheckOn = 1;
			}
		}
		
		function nickCheck() {
			
		}
		
		function fCheck() {
			var mid = myform.mid.value;
	    	var pwd = myform.pwd.value;
	    	var nickName = myform.nickName.value;
	    	var name = myform.name.value;
	    	var email1 = myform.email1.value;
	    	
	    	if(mid == "") {
	    		alert("아이디를 입력하세요");
	    		myform.mid.focus();
	    	}
	    	else if(pwd == "") {
	    		alert("비밀번호를 입력하세요");
	    		myform.pwd.focus();
	    	}
	    	else if(nickName == "") {
	    		alert("닉네임을 입력하세요");
	    		myform.nickName.focus();
	    	}
	    	else if(name == "") {
	    		alert("성명을 입력하세요");
	    		myform.name.focus();
	    	}
	    	else if(email1 == "") {
	    		alert("이메일을 입력하세요");
	    		myform.email1.focus();
	    	}
	    	else {
				if (idCheckOn == 1) {
					myform.address.value =sample4_postcode.value + "/" +sample4_roadAddress.value + "/" + sample4_detailAddress.value + "/" + sample4_extraAddress.value; 
					myform.submit();
				}
				else {
					alert("아이디 중복체크를 하세요.");
				}
	    	}
		}
	</script>
</body>
</html>