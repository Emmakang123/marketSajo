<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makerMyPage</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

	<c:if test="${member.m_level == 2}">
		<h2>주문내역</h2>
		<a href="makerOrderList">주문내역</a>
	
		<h2>취소요청</h2>
		<a href="makerRefundList">취소요청</a>
	
		<h2>판매내역</h2>
		<a href="makerSellCompleteList">판매내역</a>
		
		<h2>상품등록</h2>
		<a href="productBoardWriteForm">상품등록</a>
	
		<h2>나의 등록상품 조회</h2>
		<a href="myProductList">나의 등록상품 조회</a>
		
		<h2>메이커프로필</h2>
		<a href="makerMyProfile">메이커프로필</a>
	</c:if>
	
	<c:if test="${member.m_level != 2}">
		<h2>메이커프로필</h2>
		<a href="makerMyProfile">메이커프로필</a>	
	</c:if>
	
	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>