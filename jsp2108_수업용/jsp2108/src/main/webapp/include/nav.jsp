<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int lv = -1;
	if (session.getAttribute("sLv") != null) {
	lv = (int) session.getAttribute("sLv");
	}
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="<%=request.getContextPath() %>">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath() %>/guest/gList.jsp">방명록</a>
      </li>
      <%
      	if (lv >= 0 && lv <= 4) {
      %>
      <li class="nav-item">
        <a class="nav-link" href="#">게시판</a>
      </li>
      <%
      	} if (lv == 0 || lv == 2 || lv == 3) {
      %>
      <li class="nav-item">
        <a class="nav-link" href="#">자료실</a>
      </li>
      <%
      	}
      	if (lv == 0 || lv == 3) {
      %>    
      <li class="nav-item dropdown">
        <a class="nav-link btn dropdown-toggle" data-toggle="dropdown" href="#">학습실</a>
        <!-- <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    	Dropdown button
  		</button> -->
		<div class="dropdown-menu">
		  	<a class="dropdown-item" href="<%=request.getContextPath() %>/URLMapping">URL (디렉토리) 매핑</a>
		    <a class="dropdown-item" href="<%=request.getContextPath() %>/URLMapping.url">URL (확장자) 매핑</a>
		    <a class="dropdown-item" href="<%=request.getContextPath() %>/URLMapping.url2">URL2 (확장자) 매핑</a>
		  	<a class="dropdown-item" href="<%=request.getContextPath() %>/password">비밀번호 암호화</a>
	  	</div>
      </li>
      <%
      	} 
      %>  
    </ul>
    <%
    	if (lv >= 0 && lv <= 4) {
    %>
    <div class="col"></div>
	<ul class="navbar-nav col-2" >
    	<li class="nav-item dropdown">
        	<a class="nav-link btn dropdown-toggle" data-toggle="dropdown" href="#">회원관리</a>
			<div class="dropdown-menu">
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/memMain.mem">회원방</a>
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/memUpdate.mem">회원정보변경</a>
		  		<%
		  			if (lv != 1) {
		  		%>
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/memList.mem">회원리스트</a>
		  		<%
		  			}
		  			if (lv != 0) {
		  		%>
		  		<a class="dropdown-item" href="javascript:memberDel()">회원탈퇴</a>
		  		<%
		  			} if (lv == 0) {
		  		%>
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/adMenu.ad">관리자메뉴</a>
		  		<%
		  			}
		  		%>
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/memLogOut.mem">로그아웃</a>
	  		</div>
		</li>  
	</ul>
  	<%
    	} 
    	else {
  	%>  
  	<div class="col"></div>
	<ul class="navbar-nav col-2" >
    	<li class="nav-item dropdown">
        	<a class="nav-link btn dropdown-toggle" data-toggle="dropdown" href="#">회원관리</a>
			<div class="dropdown-menu">
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/memLogin.mem">로그인</a>
		  		<a class="dropdown-item" href="<%=request.getContextPath() %>/memJoin.mem">회원가입</a>
	  		</div>
		</li>  
	</ul>
  	<%
    	}
  	%>
  	</div>	
</nav>

<script>
  function memberDel() {
	  var ans = confirm("정말 탈퇴하시겠습니까?");
	  if(ans) {
		  ans = confirm("탈퇴후 1개월간은 같은아이디로 가입하실수 없습니다.\n탈퇴 하시겠습니까?");
		  if(ans) location.href="<%=request.getContextPath()%>/memDelete.mem";
	  }
  }
</script>