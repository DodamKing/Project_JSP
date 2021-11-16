<%@page import="member.MemberVo"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/sessionCheck.jsp" %>
<%

	MemberDAO dao = new MemberDAO();
	MemberVo vo = dao.loginCheck(mid);
	
	long pwdValue = (long) dao.getHashTableSearch(vo.getPwdKey());
	long intPwd;
	long encPwd;
	String strPwd;
	String decPwd = "";
	
	intPwd = Long.parseLong(vo.getPwd());
	
	encPwd = intPwd ^ pwdValue;
	strPwd = String.valueOf(encPwd);
	
	for (int i=0; i<strPwd.length(); i+=2) {
		decPwd += (char) (Integer.parseInt(strPwd.substring(i, i+2)));
	}
	
	String[] email = vo.getEmail().split("@");
	String email1 = email[0];
	String email2 = email[1];
	
	String[] tel = vo.getTel().split("-");
	String tel1 = tel[0];
	/* String tel2 = tel[1];
	String tel3 = tel[2]; */
	
	String[] address = vo.getAddress().split("/");
	/* String address1 = address[0];
	String address2 = address[1];
	String address3 = address[2];
	String address4 =  address[3]; */
	
	int addressIndex = 0;
	int telIndex = 1;
	
	String[] hobbys = {"등산", "낚시", "수영", "독서", "영화감상", "바둑", "축구", "기타"};
	String[] myHobbys = vo.getHobby().split("/");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>memUpdate.jsp</title>
	<%@include file="../../include/bs4.jsp"%>
</head>
<body>
				<!-- 헤더영역 -->
				<%@include file="../../include/header_home.jsp"%>
				<%@include file="../../include/nav.jsp"%>

				<div class="container mt-5">
								<h2>회 원 가 입</h2>
								<form name="myform" method="post" action="memUpdateOk.mem"
												class="was-validated mt-5">
												<div class="form-group">
																<label for="pwd">비밀번호</label> <input type="password"
																				class="form-control" id="pwd"
																				placeholder="비밀번호를 입력하세요." name="pwd" value="<%=decPwd %>" maxlength="9"
																				required />
												</div>
												<div class="form-group">
																<label for="nickname">닉네임&nbsp; &nbsp;<input
																				type="button" value="닉네임 중복체크"
																				class="btn btn-secondary btn-sm" onclick="nickCheck()" /></label> <input
																				type="text" class="form-control" id="nickName"
																				placeholder="별명을 입력하세요." name="nickName" vlaue="<%=vo.getNickName() %>" required />
												</div>
												<div class="form-group">
																<label for="name">성명</label> <input type="text"
																				class="form-control" id="name"
																				placeholder="성명을 입력하세요." name="name" value="<%=vo.getName() %>" required />
												</div>
												<div class="form-group">
																<label for="email">Email address</label>
																<div class="input-group mb-3">
																				<input type="text" class="form-control"
																								placeholder="Email" id="email1" name="email1"
																								value="<%=email1 %>"  required />
																				<div class="input-group-append">
																								<select name="email2" class="custom-select">
																												<option value="naver.com" <%if(email2.equals("naver.com")) { %>selected <%} %>>naver.com</option>
																												<option value="hanmail.net" <%if(email2.equals("hanmail.net")) { %>selected <%} %>>hanmail.net</option>
																												<option value="hotmail.com" <%if(email2.equals("hotmail.com")) { %>selected <%} %>>hotmail.com</option>
																												<option value="gmail.com" <%if(email2.equals("gmail.com")) { %>selected <%} %>>gmail.com</option>
																												<option value="nate.com" <%if(email2.equals("nate.com")) { %>selected <%} %>>nate.com</option>
																												<option value="yahoo.com" <%if(email2.equals("yahoo.com")) { %>selected <%} %>>yahoo.com</option>
																								</select>
																				</div>
																</div>
												</div>
												<div class="form-group">
																<div class="form-check-inline">
																				<span class="input-group-text">성별</span> &nbsp;
																				&nbsp; <label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="gender" value="남자" <%if (vo.getGender().equals("남자")) { %>checked <%} %>>남자
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="gender" value="여자" <%if (vo.getGender().equals("여자")) { %>checked <%} %>>여자
																				</label>
																</div>
												</div>
												<div class="form-group">
																<label for="birthday">생일</label> <input type="date"
																				name="birthday" value="<%=vo.getBirthday().substring(0, 10) %>" class="form-control" />
												</div>
												<div class="form-group">
																<div class="input-group mb-3">
																				<div class="input-group-prepend">
																								<span class="input-group-text">전화번호</span>
																								&nbsp;&nbsp; <select name="tel1" 
																												class="custom-select">
																												<option value="010" <%if (tel1.equals("010")) { %>selected <%} %>>010</option>
																												<option value="02" <%if (tel1.equals("02")) { %>selected <%} %>>서울</option>
																												<option value="031" <%if (tel1.equals("031")) { %>selected <%} %>>경기</option>
																												<option value="032" <%if (tel1.equals("032")) { %>selected <%} %>>인천</option>
																												<option value="041" <%if (tel1.equals("041")) { %>selected <%} %>>충남</option>
																												<option value="042" <%if (tel1.equals("041")) { %>selected <%} %>>대전</option>
																												<option value="043" <%if (tel1.equals("043")) { %>selected <%} %>>충북</option>
																												<option value="051" <%if (tel1.equals("051")) { %>selected <%} %>>부산</option>
																												<option value="052" <%if (tel1.equals("052")) { %>selected <%} %>>울산</option>
																												<option value="061" <%if (tel1.equals("061")) { %>selected <%} %>>전북</option>
																												<option value="062" <%if (tel1.equals("062")) { %>selected <%} %>>광주</option>
																								</select>-
																				</div>
																				<input type="text" name="tel2" value="<%if (telIndex < tel.length) { %> <%=tel[telIndex] %> <%telIndex++;} %>" size=4 maxlength=4
																								class="form-control" />- <input type="text"
																								name="tel3" value="<%if (telIndex < tel.length) { %> <%=tel[telIndex] %> <%telIndex++;} %>" size=4 maxlength=4
																								class="form-control" />
																</div>
												</div>
												<div class="form-group">
																<label for="address">주소</label> 
																<input type="hidden" class="form-control" id="address" name="address" />
																<label for="address">우편번호</label> <input type="text" id="sample4_postcode" value="<%if (addressIndex < address.length) { %> <%=address[addressIndex] %> <%addressIndex++;} %>"  placeholder="우편번호">
																<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
																<label for="address">도로명주소</label> <input style="width: 250px" type="text" id="sample4_roadAddress" value="<%if (addressIndex < address.length) { %> <%=address[addressIndex] %> <%addressIndex++;} %>" placeholder="도로명주소">
																<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
																<span id="guide" style="color:#999;display:none"></span>
																<label for="address">상세주소</label> <input type="text" id="sample4_detailAddress" value="<%if (addressIndex < address.length) { %> <%=address[addressIndex] %> <%addressIndex++;} %>" placeholder="상세주소">
																<input type="text" id="sample4_extraAddress" value="<%if (addressIndex < address.length) { %> <%=address[addressIndex] %> <%addressIndex++;} %>" placeholder="참고항목">
												</div>
												<div class="form-group">
																<label for="homepage">Homepage address</label> <input
																				type="text" class="form-control" name="homePage"
																				value="<%=vo.getHomePage() %>" 
																				id="homePage" />
												</div>
												<div class="form-group">
																<label for="job">직업</label> <select
																				class="form-control" id="job" name="job">
																				<option <% if (vo.getJob().equals("학생")) {%>selected<%} %>>학생</option>
																				<option <% if (vo.getJob().equals("회사원")) {%>selected<%} %>>회사원</option>
																				<option <% if (vo.getJob().equals("공무원")) {%>selected<%} %>>공무원</option>
																				<option <% if (vo.getJob().equals("군인")) {%>selected<%} %>>군인</option>
																				<option <% if (vo.getJob().equals("의사")) {%>selected<%} %>>의사</option>
																				<option <% if (vo.getJob().equals("법조인")) {%>selected<%} %>>법조인</option>
																				<option <% if (vo.getJob().equals("세무인")) {%>selected<%} %>>세무인</option>
																				<option <% if (vo.getJob().equals("자영업")) {%>selected<%} %>>자영업</option>
																				<option <% if (vo.getJob().equals("기타")) {%>selected<%} %>>기타</option>
																</select>
												</div>
												<div class="form-group">
													<label for="hobby">취미&nbsp;&nbsp;</label>
																<!-- <div class="form-check-inline">
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
																								value="기타" name="hobby" />기타
																				</label>
																</div> -->
																<%
																for (int i=0; i<hobbys.length; i++) {
																%>
																	<input type="checkbox" name="hobby" value="<%=hobbys[i] %>" 
																<%
																	for (int j=0; j<myHobbys.length; j++) {
																		if (hobbys[i].equals(myHobbys[j])) {
																%>
																	checked
																<% 			
																			break;
																		}
																	}
																%>
																	> <%=hobbys[i] %>&nbsp;&nbsp;
																<%
																}
																%>	
												</div>
												<div class="form-group">
																<label for="content">자기소개</label>
																<textarea class="form-control" id="content" rows="5"
																				name="content"> <%=vo.getContent() %> </textarea>
												</div>
												<div class="form-group">
																<div class="form-check-inline">
																				<span class="input-group-text">정보공개</span> &nbsp;
																				&nbsp; <label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="userInfor" value="공개" <% if (vo.getUserInfor().equals("공개")) {%>checked<%} %> />공개
																				</label>
																</div>
																<div class="form-check-inline">
																				<label class="form-check-label"> <input
																								type="radio" class="form-check-input"
																								name="userInfor" value="비공개" <% if (vo.getUserInfor().equals("비공개")) {%>checked<%} %> />비공개
																				</label>
																</div>
												</div>
												<div class="mt-5 mb-5 text-right">
																<button type="button" class="btn btn-secondary mr-1"
																				onclick="fCheck()">정보수정</button>
																<button type="reset" class="btn btn-secondary mr-1">다시작성</button>
																<button type="button" class="btn btn-secondary"
																				onclick="location.href='<%=request.getContextPath() %>/memMain.mem';">돌아가기</button>
												</div>
												<input type="hidden" name="mid" value="${sMid }" >
								</form>
				</div>

				<!-- 푸터 -->
				<%@include file="../../include/footer.jsp"%>
				
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath() %>/js/daumApi.js"></script>
	<script>
		let idCheckOn = 0;
		let nickCheckOn = 0;
		let nickCheckSw = 0;
		
		mid.addEventListener("keyup", () => {
			idCheckOn = 0;
		});

		nickName.addEventListener("keyup", () => {
			nickCheckSw = 1;
		});
		
		function nickCheck() {
			
		}
		
		function fCheck() {
	    	var pwd = myform.pwd.value;
	    	var nickName = myform.nickName.value;
	    	var name = myform.name.value;
	    	var email1 = myform.email1.value;
	    	
	    	if(pwd == "") {
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
				if (nickCheckOn == 0) {
					myform.address.value = sample4_postcode.value.trim() + "/" + sample4_roadAddress.value.trim() + "/" + sample4_detailAddress.value.trim() + "/" + sample4_extraAddress.value.trim(); 
					myform.submit();
				}
				else {
					alert("닉네임 중복체크를 하세요.");
				}
	    	}
		}
	</script>
</body>
</html>