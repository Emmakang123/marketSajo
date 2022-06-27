<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이거사조마켓</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
 <!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<!-- fontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<!-- Css Styles -->
<link rel="stylesheet" href="css/main/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/main/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/main/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/main/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/main/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/main/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/main/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/main/style.css" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<div class="container">
<div id = coupon_evt>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"> <!--각각 쿠폰,공지사항으로 가는 이미지링크 -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
				 <div class="carousel-inner">
             <div class="carousel-item active">
                <c:choose>
                   <c:when test="${b1.bn_category ==1}">
                       <a href="noticeDetail?board_num=${b1.board_num }">
                          <img alt= "쿠폰이벤트배너" src="/upload/${b1.bn_photo}" id="coupon_banner_img"class="d-block w-100">
                       </a>
                   </c:when>
                   <c:otherwise>
                      <a href="coupon">
                          <img alt= "쿠폰이벤트배너" src="/upload/${b1.bn_photo}" id="coupon_banner_img"class="d-block w-100">
                       </a>
                   </c:otherwise>
                </c:choose>     
             </div>
             <div class="carousel-item">
             <c:choose>
                <c:when test="${b2.bn_category == 1}">
                    <a href="noticeDetail?board_num=${b2.board_num }">
                       <img alt= "쿠폰이벤트배너" src="/upload/${b2.bn_photo}" id="coupon_banner_img"class="d-block w-100">
                    </a>
                </c:when>
                <c:otherwise>
                   <a href="coupon">
                       <img alt= "쿠폰이벤트배너" src="/upload/${b2.bn_photo}" id="coupon_banner_img"class="d-block w-100">
                    </a>
                </c:otherwise>
                </c:choose>
             </div>
             <div class="carousel-item">
             <c:choose>
                <c:when test="${b3.bn_category == 1}">
                   <a href="noticeDetail?board_num=${b3.board_num }">
                       <img alt= "쿠폰이벤트배너" src="/upload/${b3.bn_photo}" id="coupon_banner_img"class="d-block w-100">
                   </a>
                </c:when>
                <c:otherwise>
                
                   <a href="coupon">
                       <img alt= "쿠폰이벤트배너" src="/upload/${b3.bn_photo}" id="coupon_banner_img"class="d-block w-100">
                   </a>
                </c:otherwise>
                </c:choose>
             </div>
		</div>		
	
	
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
</div>

<!-----------------------베스트 상품-------------------------------->
	 <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>베스트상품</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <c:forEach var="product_bestTop4list" items="${product_bestTop4list }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="/upload/${product_bestTop4list.pro_photo}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-cart-arrow-down"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a id="item_a" href="productDetails?pro_num=${product_bestTop4list.pro_num}">${product_bestTop4list.pro_title}</a></h6>
                            <h6 id="item_context">${product_bestTop4list.pro_write}</h6>
                            <h5><fmt:formatNumber value="${product_bestTop4list.pro_price}" pattern="#,###"/>원</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>	
			<c:set var="num" value="${num - 1 }"></c:set>  
            </div>
        </div>
    </section>
	
 
<!----------------------- 신상품-------------------------------->	
	<section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>NEW신상품</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <c:forEach var="product_newTop4list" items="${product_newTop4list }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="/upload/${product_newTop4list.pro_photo}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-cart-arrow-down"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a id="item_a" href="productDetails?pro_num=${product_newTop4list.pro_num}">${product_newTop4list.pro_title}</a></h6>
                            <h6  id="item_context">${product_newTop4list.pro_write}</h6>
                            <h5><fmt:formatNumber value="${product_newTop4list.pro_price}" pattern="#,###"/>원</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>	
			<c:set var="num" value="${num - 1 }"></c:set>  
            </div>
        </div>
    </section>


<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>