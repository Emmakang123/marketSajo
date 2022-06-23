<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/noticeDetail.css" rel="stylesheet" type="text/css">
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
	
		<div class="col-md-10" id="main">
			<div class="col-12 col-md-2 offset-md-5" id="notice">
				<h3>공지사항</h3>
			</div>
			<div class="col-12 col-md-6 offset-md-3" id="notice2">
				<h6>마켓사조의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</h6>
			</div>
			<div class="col-12 col-md-10 offset-md-1" id="tbl">
				<input type="hidden" value="${bd.board_num}" name="board_num">
				<table class="table">
					<tr><th>글제목</th><td colspan="3">${bd.board_subject}</td></tr>
					<tr><th>작성자</th><td colspan="3">${bd.user_id }</td></tr>
					<tr><th>작성일</th>
						<td><fmt:formatDate value="${bd.board_reg_date }" pattern="yyyy-MM-dd"/></td>
						<th>조회수</th><td>${bd.board_hits }</td></tr>
					<tr><td colspan="4">${bd.board_content}</td></tr>
				</table>
			</div>
			<div class="col-12 col-md-2 offset-md-5" id="page">
				<a href="notice">목록</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>