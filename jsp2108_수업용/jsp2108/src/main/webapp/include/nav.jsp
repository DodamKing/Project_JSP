<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <li class="nav-item">
        <a class="nav-link" href="#">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">자료실</a>
      </li>    
      <li class="nav-item dropdown">
        <a class="nav-link btn dropdown-toggle" data-toggle="dropdown" href="#">학습실</a>
        <!-- <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    	Dropdown button
  		</button> -->
		<div class="dropdown-menu">
		  	<a class="dropdown-item" href="<%=request.getContextPath() %>/URLMapping">URL (디렉토리) 매핑</a>
		    <a class="dropdown-item" href="<%=request.getContextPath() %>/URLMapping.url">URL (확장자) 매핑</a>
		    <a class="dropdown-item" href="<%=request.getContextPath() %>/URLMapping.url2">URL2 (확장자) 매핑</a>
		  	<a class="dropdown-item" href="#">URL (임시) 매핑</a>
	  	</div>
      </li>    
    </ul>
  </div>  
</nav>