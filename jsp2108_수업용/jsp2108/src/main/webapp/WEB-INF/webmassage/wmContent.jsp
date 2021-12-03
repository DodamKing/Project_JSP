<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="<%=request.getContextPath() %>" />
<% pageContext.setAttribute("newLine", "\n"); %>

<div class="container">
	<table class="table table-bordered">
	  <tr>
	    <th>보내는 사람</th>
	    <td>${vo.sendId }</td>
	  </tr>
	  <tr>
	    <th>받는 사람</th>
	    <td>${vo.receiveId }</td>
	  </tr>
	  <tr>
	    <th>메세지 제목</th>
	    <td>${vo.title }</td>
	  </tr>
	  <tr>
	    <th>메세지 내용</th>
	    <td>${fn:replace(vo.content, newLine, "<br>") }</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="text-center">
	      <input type="button" value="답장쓰기" onclick="location.href='webMassage.wm?mSw=0&receiveId=${vo.sendId }'" class="btn btn-secondary"/> &nbsp;
	      <input type="button" value="휴지통으로" onclick="delCheck()" class="btn btn-secondary"/>
	      <input type="button" value="돌아가기" onclick="location.href='webMassage.wm?mSw=${send}'" class="btn btn-secondary"/> &nbsp;
	    </td>
	  </tr>
	</table>
</div>

<script>
	function delCheck() {
		if (confirm("메일을 휴지통으로 보내시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "wmDelete.wm",
				data : {
					idx : ${vo.idx},
					send : ${send}
					},
				success : () => {
					location.href="webMassage.wm";
				}
			});
		}
	}
</script>
