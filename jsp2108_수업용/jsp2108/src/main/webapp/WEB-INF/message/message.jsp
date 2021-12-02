<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String msg = (String) request.getAttribute("msg");
  String url = (String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <script> 
  	var msg = "<%=msg%>";
  	var url = "<%=url%>";
  
  	if(msg == "userDeleteOk") msg = "정보가 삭제되었습니다.";
  	else if(msg == "userDeleteNo") msg = "정보가 삭제되지 않았습니다.";
  	else if(msg == "userInputOk") msg = "정보가 입력되었습니다.";
  	else if(msg == "userInputNo") msg = "정보가 입력되지 않았습니다.";
  	else if(msg == "userUpdateOk") msg = "정보가 수정되었습니다.^.^.";
  	else if(msg == "userUpdateNo") msg = "정보가 수정되지 않았습니다.ㅜㅜ.";
  	else if(msg == "idCheckOk") msg = "중복된 아이디 입니다.";
  	else if(msg == "memJoinOk") msg = "회원 가입이 완료 되었습니다.";
  	else if(msg == "memJoinNo") msg = "데이터 베이스 오류.";
  	else if(msg == "memberLoginOk") msg = "${val}님 로그인 되었습니다.";
  	else if(msg == "memberLoginNo") msg = "아이디를 확인 하세요.";
  	else if(msg == "memberLoginPwdNo") msg = "비밀번호를 확인 하세요.";
  	else if(msg == "memberLogOutOk") msg = "${val}님 로그아웃 되었습니다.";
  	else if(msg == "memUpdateOk") msg = "회원정보가 수정되었습니다.";
  	else if(msg == "memUpdateNo") msg = "데이터 베이스 오류.";
  	else if(msg == "memberDeleteOk") msg = "회원 정보가 삭제되었습니다.";
  	else if(msg == "memberLevelChangeOk") msg = "회원 등급이 변경되었습니다.";
  	else if(msg == "memberResetOk") msg = "정상 탈퇴 처리 되었습니다.";
  	else if(msg == "loginCheck") msg = "로그인 후 사용하세요.";
  	else if(msg == "boInputOk") msg = "글이 등록 되었습니다.";
  	else if(msg == "boInputNo") msg = "데이터 베이스 오류.";
  	else if(msg == "boDeleteOk") msg = "게시글이 삭제 되었습니다.";
  	else if(msg == "boDeleteNo") msg = "데이터 베이스 오류.";
  	else if(msg == "No") msg = "데이터 베이스 오류.";
  	else if(msg == "boUpdateOk") msg = "게시글이 수정 되었습니다.";
  	else if(msg == "replyBoardInputOk") msg = "댓글이 등록 되었습니다.";
  	else if(msg == "fileOk") msg = "파일이 업로드 되었습니다.";
  	else if(msg == "pdsInputOk") msg = "파일이 업로드 되었습니다.";
  	else if(msg == "scInputOk") msg = "일정이 추가 되었습니다.";
  	else if(msg == "scUpdateOk") msg = "일정이 수정 되었습니다.";
  	else if(msg == "scDeleteOk") msg = "일정이 삭제 되었습니다.";
  	
    alert(msg);
    if(url != "") location.href = url;
  </script>
</head>
<body>

</body>
</html>