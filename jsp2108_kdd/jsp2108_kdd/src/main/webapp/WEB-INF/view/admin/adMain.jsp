<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
	<title>관리자</title>
	<jsp:include page="/main/bs4.jsp" />
	<style>
		nav {
			background: black;
			color: white;
			position: fixed;
		    width: 200px;
		    height: 100%;
		    left: 0px;
		    top: 0px;
		    overflow-y: auto;
		    margin-top: 0px;
		    padding-top: 0px;
		    padding-bottom: 200px;
		    z-index: 999;
		}
		
		section {
			position: absolute;
			left: 200px;
		}
		
		li {
			list-style: none;
			font-size: 20px;
			padding: 10px 0;
		}
		
		a {
		    text-decoration: none;
		    color: inherit;
		    opacity: 1;
		}
		
		a:hover {
		    text-decoration: none;
		    color: inherit;
		    opacity: 0.7;
		}
		
	</style>
</head>
<body>
<%-- <jsp:include page="/main/title.jsp" /> --%>
	<nav>
		<div class="card-body nav-w">
	        <ul>
	            <li><a href="adminMain.ad">메인</a></li>
	            <li><a href="adminMain.ad?sw=1">회원관리</a></li>
                <li><a href="adminMain.ad?sw=2">음원관리</a></li>
            </ul>
    	</div>
	</nav>
	<section>
		<c:if test="${sw == 0 }">
			<div class="container mt-5">
				<h2>관리자 페이지 만들 예정</h2>
			</div>
		</c:if>
		<c:if test="${sw == 1 }">
			<div class="container mt-5">
				<h2>회원관리</h2>
			</div>
		</c:if>
		<c:if test="${sw == 2 }">
			<div class="container mt-5">
				<h2>음원관리</h2>
				<div>
					<ul class="pagination">
					    <li class="page-item"><a class="page-link bg-dark text-warning" href="adminMain.ad?sw=2&pageNo=1">First</a></li>
					    <li class="page-item"><a class="page-link bg-dark text-warning" href="adminMain.ad?sw=2&pageNo=<c:if test="${pageNo != 1 }">${pageNo - 1 }</c:if><c:if test="${pageNo == 1 }">1</c:if> ">Previous</a></li>
					    <li class="page-item"><a class="page-link bg-secondary text-danger">${pageNo }</a></li>
					    <!-- <li class="page-item"><a class="page-link bg-dark text-warning" href="#">1</a></li>
					    <li class="page-item"><a class="page-link bg-secondary text-danger" href="#">2</a></li>
					    <li class="page-item"><a class="page-link bg-dark text-warning" href="#">3</a></li> -->
					    <li class="page-item"><a class="page-link bg-dark text-warning" href="adminMain.ad?sw=2&pageNo=<c:if test="${pageNo + 1 > lastPageNo }">${pageNo }</c:if><c:if test="${pageNo + 1 <= lastPageNo }">${pageNo + 1}</c:if>">Next</a></li>
					    <li class="page-item"><a class="page-link bg-dark text-warning" href="adminMain.ad?sw=2&pageNo=${lastPageNo }">Last</a></li>
		 	 		</ul>
				</div>
				<div>
					<table class="table table-bordered" style="width: 3000px;">
						<thead class="thead-dark">
							<tr>
								<th class="text-right">#</th>
								<th>썸네일</th>
								<th>제목</th>
								<th>가수</th>
								<th>앨범명</th>
								<th>발매일</th>
								<th>작곡</th>
								<th>장르</th>
								<th>작사</th>
								<th>편곡</th>
								<th>가사</th>
								<th>좋아요</th>
							</tr>
						</thead>
	                    <c:forEach var="vo" items="${vos }" varStatus="st">
		                    <tr>
		                        <td class="text-right align-middle">${vo.idx}</td>
		                        <td class="text-center"><div class="imgBox"><img src="${vo.img }" alt=""></div></td>
		                        <td class="align-middle">${vo.title }</td>
		                        <td class="align-middle">${vo.artist }</td>
		                        <td class="align-middle">${vo.album }</td>
		                        <td class="align-middle">${vo.releaseDate }</td>
		                        <td class="align-middle">${vo.genre }</td>
		                        <td class="align-middle">${vo.music }</td>
		                        <td class="align-middle">${vo.words }</td>
		                        <td class="align-middle">${vo.arranger }</td>
		                        <td class="align-middle text-center">
		                        	<c:if test="${empty vo.lyrics }">없음</c:if>
		                        	<c:if test="${!empty vo.lyrics }">더보기</c:if>
	                        	</td>
		                        <td class="align-middle text-center">${vo.likeCnt }</td>
		                    </tr>
	                    </c:forEach>
	                </table>
				</div>
			</div>
		</c:if>
	</section>
	
</body>
</html>