<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
    function idCheck() {
    	var mid = myform.mid.value;
    	if(mid == "") {
    		alert("아이디를 입력하세요.");
    		myform.mid.focus();
    		return false;
    	}
    	
    	var query = {
    			mid : mid
    	}
    	
    	//alert("입력된 아이디 : " + mid);
    	//$.ajax({변수1:값1,변수2:값2});
    	$.ajax({
    		type : "get",
    		url  : "${ctp}/ajax1Ok",
    		//data : {mid:'hkd1234',age:22,......}
    		data : query,
    		success : function(data) {
    			// 성공적으로 ajax(비동기식)처리 끝내고 돌아왔을경우 수행하는곳
    			alert("검색된 성명은? " + data);
    		},
    		error : function(data) {
    			// ajax(비동기식)처리 실패후 돌아왔을경우 수행하는곳
    			alert("검색시 오류발생!");
    		}
    	});
    }
    	
	function inputCheck() {
		let name = $("#name").val();
		let age = $("#age").val();
		
		if (name == "") {
			alert("입력하삼!");
			$("#name").focus();
			return;
		}
		
		let query = {
				name : name,
				age : age
		}
		
		$.ajax({
			type : "post",
			url : "userIsert",
			data : query,
			success : (data) => {
				if (data != -1) alert("등록 성공 함");
			}
		});	
	}
	
	function userCheck() {
		
		$.ajax({
			type : "post",
			url : "usergetuser",
			success : (data) => {
				if (data != -1) alert("가져 왔다 치자");
			}
		});	
	}
  </script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<jsp:include page="/include/nav.jsp"/>
<p><br></p>
<div class="container">
  <h2>Ajax연습</h2>
  <form name="myform">
    아이디 : <input type="text" name="mid" />
    <input type="button" value="아이디검색" onclick="idCheck()"/>
  </form>
  <br>
  <form name="inputForm">
  	<h3>user 가입</h3>
  	<table>
  		<tr>
  			<td>이름</td>
  			<td><input type="text" name="name" id="name" /></td>
  		</tr>
  		<tr>
  			<td>나이</td>
  			<td><input type="number" name="age" id="age" value="20" /></td>
  		</tr>
  		<tr>
  			<td><input type="button" value="등록" onclick="inputCheck()" /></td>
  			<td><input type="button" value="조회" onclick="userCheck()" /></td>
  		</tr>
  	</table>
  	<table>
  		<tr>
  			<td>번호</td>
  			<td>이름</td>
  			<td>나이</td>
  		</tr>
  		<c:forEach var="vo" items="${vos }">
  			<tr>
  				<td>${vo.idx }</td>
  				<td>${vo.name }</td>
  				<td>${vo.age }</td>
  			</tr>
  		</c:forEach>
  	</table>
  </form>
</div>
<br/>
<%@ include file="/include/footer.jsp" %>

</body>
</html>