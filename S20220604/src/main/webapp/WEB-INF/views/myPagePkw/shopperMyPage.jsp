<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
	

			<h2>주문내역</h2>
			<a href="shopperOrderList">주문내역</a>
		
			<h2>취소요청</h2>
			<a href="shopperRefundList">취소요청</a>
		
			<h2>구매완료</h2>
			<a href="shopperPurchaseCompletedList">구매완료</a>
		
			<h2>좋아요리스트</h2>
			<a href="shopperMyCheckProductList">좋아요리스트</a>
		
			<h2>쿠폰</h2>
			<a href="shopperMyCouponList">쿠폰</a>
		
			<h2>My리뷰</h2>
			<a href="shopperMyReviewList">>My리뷰</a>
			
			<h2>My프로필(쇼퍼)</h2>
			<a href="shopperMyProfile">My프로필(쇼퍼)</a>
			

	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>