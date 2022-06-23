<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopperMyCheckProductList</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

<!--	
	Check_Product : 상품번호(pro_num)
	Product : 유저아이디(user_id), 상품번호(pro_num), 상품판매메인사진(pro_photo), 상품판매글제목(pro_title), 판매가격(pro_price)
-->
	<section>
	<div align="center">
	<div id="myPage">
	 	<h3><i class="fa-solid fa-pipe" ></i>좋아요 리스트</h3>
			 <table class="table table-hover" id="myPageTbl">
				<tr>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품제목</th>
					<th>판매자(ID)</th>
					<th>판매가격</th>
				</tr>
				<c:choose>
					<c:when test="${listSize > 0}">
					  <c:forEach var="item" items="${listShopperMyCheckProduct}">
						<tr>
							<td>${item.pro_num}</td>
							<td><img alt="" id="photoImg" src="${pageContext.request.contextPath}/upload/${item.pro_photo}"></td>
							<td>${item.pro_title}</td>
							<td>${item.user_id}</td>
							<td>${item.pro_price}</td>
						</tr>
					  </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">찜한 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	</section>
	

	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>