<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/notice.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
	<div class="row">	
		<div class="col-md-2" id="sidebar">
			<a class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<svg class="bi me-2" width="30" height="32"><use xlink:href="#bootstrap"/></svg>
				<span class="fs-4">
					<h4>고객센터</h4>
				</span>
			</a>
	  		<ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="notice" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	공지사항
		        </a>
		      </li>
		      <li>
		        <a href="faq?user_id=${sessionId }" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	1:1문의
		        </a>
		    </ul>
		</div>
	
	<div class="col-md-10 p-1" id="main">
		<div class="row">
 			<div class="px-3" id="notice">
 				<h2>공지사항</h2>
 				<span>마켓사조의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span>
 				<hr>
 			</div>
 			<div id="page" class="col-12 col-md-10 offset-md-1">
				<c:set var="num" value="${paging.total - paging.start+1 }"></c:set>
				<table class="table" id="tbl">
					<tr>
						<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
					</tr>
		 			<c:forEach var="list" items="${boardList }">
		 			<tr>
		 				<c:if test= "${list.board_category == 1}"><td>공지</td></c:if>
		 				<c:if test= "${list.board_category == 2}"><td>${num }</td></c:if>
		 		    	<td><a href="noticeDetail?board_num=${list.board_num }">${list.board_subject}</a></td>
		 		 		<td>${list.user_id}</td>
		 		 		<td><fmt:formatDate value="${list.board_reg_date }" pattern="yyyy-MM-dd"/></td>
		 		 		<td>${list.board_hits }</td></tr>
		 		 	<c:set var="num" value="${num-1 }"></c:set> 
		 			</c:forEach>
				</table>
			</div>
			<div id="page" class="col-12 col-md-2 offset-md-5">
				<c:if test="${paging.startPage > paging.pageBlock}">
					<a href="notice?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a href="notice?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${paging.endPage <paging.totalPage }">
					<a href="notice?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
				</c:if>
			</div>			
		</div>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>