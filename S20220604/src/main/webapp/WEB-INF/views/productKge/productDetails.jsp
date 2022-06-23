<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<% 
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/kge/productDetails.css" rel="stylesheet" type="text/css">
<link href="css/jsh/review.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	
	//모달창 열기,닫기
	$(function() {
		
		$(".modal_button").click(function(){
			$(".modal").fadeIn();
		});
		$(".modal_content").click(function(){
			$(".modal").fadeOut();
		});
	});
	
	// 위시 리스트 추가 아작스   
	   function putCheckProduct() {
	      
	      var user_id = $("#detialsUser_id").val()
	      alert("user_id->"+user_id);
	      // 로그인이 되어 있지 않은 상태라면, 로그인 페이지로 이동하도록 연결
	      if (user_id =="") {
	         location.href = "/login"
	      }
	      var pro_num = $("#detailsPro_num").val()
	      alert("pro_num->"+pro_num);
	      
	      $.ajax(
	         {
	            url:"<%=context%>/inputCheckProduct",
	            data:{user_id : user_id, pro_num : pro_num},
	            dataType : 'text',
	            success:function(data){
	               
	               if (data == 1) {
	                  alert("위시리스트에 추가 되었습니다.");
	               } else alert("이미 추가 되었습니다.");
	            }
	         });
	      }
	
	// 로그인 체크 function
	function loginCheck(){
		alert("loginCheck start...");

		var user_id = $("#detialsUser_id").val();
		alert("user_id->"+user_id);
		// 로그인이 되어 있지 않다면 로그인 페이지로 이동
		if (user_id =="") {
			location.href = "/login"
			return false;
		}
		else return true;
	}
	
	// 장바구니 추가 아작스
	   function putBaskect() {
	      alert("putBaskect start...");
	      
	      // 로그인 체크 function 타기
	      loginCheck();
	      
	      var user_id = $("#detialsUser_id").val();
	      var pro_num = $("#detailsPro_num").val();
	      alert("pro_num->"+pro_num);
	      
	      var quantity = $("#quantity").val();
	      alert("quantity->"+quantity);
	      
	      $.ajax(
	         {
	            url:"<%=context%>/inputBasket",
	            data:{user_id : user_id, pro_num : pro_num, quantity : quantity},
	            dataType : 'text',
	            success:function(data){
	               alert("data;" + data)
	               if (data == 1) {
	                  alert("장바구니에 추가 되었습니다.");
	               } else alert("이미 추가 되었습니다.");
	            }
	         });
	      }
	
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	
	<div id="out">
<div class="wrapper">
	<div id="detailPhoto">
		<img alt="" id="productimg" src="${pageContext.request.contextPath}/upload/${product.pro_photo}">
	</div>
	
	<div id="detailText">
	
	
					<div class="modal">
						<div class="modal_content" title="클릭하면 창이 닫힙니다">
							<img alt="상호이미지" id="sell_photoImg" src="${pageContext.request.contextPath}/img/${product.sell_photo}"><br>
							<input type="button" id="chat_connect_btn" name="chat_connect_button" value="채팅창 연결" onclick = "location.href = '${pageContext.request.contextPath}/chatWithCeller?pro_num=${product.pro_num}&pro_title=${product.pro_title}&user_id=${product.user_id}' ">
							<input type="button" id="make_info_btn" name="make_info_button" value="판매자 정보" onclick = "location.href = '${pageContext.request.contextPath}/makerMyProfileView' ">
						</div>
					</div>
	 <!--   시환님 컨트롤러로 이동 -->
	<form action="PaymentPage" method="post" name="pbw" enctype="multipart/form-data" onsubmit="return loginCheck()">
		<input type="hidden" id="detialsUser_id" name="user_id" value="${user_id}"> <!-- 구매자 아이디 -->
		<input type="hidden" id="detialsSellUser_id" name="product.user_id" value="${product.user_id}"> <!-- 판매자 아이디 -->
		<input type="hidden" id="detailsPro_num" name="pro_num" value="${product.pro_num}">
		<input type="hidden" id="detailsSell_photo" name="sell_photo" value="${product.sell_photo}">
		<input type="hidden" id="detailsPro_price" name="pro_price" value="${product.pro_price}">
		<input type="hidden" id="detailsPro_title" name="pro_title" value="${product.pro_title}">
		<input type="hidden" name="path" value="${pageContext.request.contextPath}/resources/image/"> 
		
		<table class="table">
					<tr>
						<td id="a"><b>상호명</b></td>
						<td id="a_1">${product.sell_name}<button type="button" class="modal_button" onclick="return loginCheck()">
														 <img alt="상호이미지" id="sell_photoImg" src="${pageContext.request.contextPath}/img/${product.sell_photo}"></button></td>
					</tr>
					
					
					<tr>
						<td id="a"><b>제품이름</b></td>
						<td id="a_1">${product.pro_title}</td>
					</tr>
					<tr>
						<td id="a"><b>가격</b></td>
						<td id="a_1"><fmt:formatNumber type="currency" value="${product.pro_price}" currencySymbol="\\"/></td>
					</tr>
					<tr>
						<td id="a"><b>재고</b></td>
						<td id="a_1">${product.amount}</td>
					</tr>
					<tr>
					<td id="a"><b>구매수량</b></td>
						<td><input type="number" class="b" id="quantity" name="quantity" min="1" max="${product.amount}" value="1"></td>
					</tr>
					</table>
					<div class="bb_buttons">
						<div class="in_bb_buttons">
							<input type="button" id="detail_basket_buttons" name="detail_basket_buttons" value="장바구니" onclick="putBaskect()">
							<input type="button" id="wish_button" name="wish_button" value="위시리스트" onclick="putCheckProduct()">
						</div>
					</div>
					<p>
						<input type="submit" id="detail_purchase_buttons" name="detail_purchase_buttons" value="구매하기">
	</form>
	</div>
</div>	 



<div id="css_tabs">
    <input id="tab1" type="radio" name="tab" onclick="ClickDetail()" checked="checked" />
    <input id="tab2" type="radio" name="tab" onclick="ClickReview()"/>
    <input id="tab3" type="radio" name="tab" onclick="ClickRefund()"/>
    <label for="tab1"><b>상세설명</b></label>
    <label for="tab2"><b>후기</b></label>
    <label for="tab3"><b>배송/환불 규정</b></label>
    
    
    <div id="tab1_content"><b>상세 설명</b><p>${product.pro_write}</p>
	<img alt="detailimg" id="detailimg" src="${pageContext.request.contextPath}/upload/${product.pro_pic}"></div>
	
	
    <div id="tab2_content" ><b>후기</b>
		<c:if test="${reviewCount == 0}">
			<h2>리뷰가 없습니다</h2>
		</c:if>

	
	
		<c:if test="${reviewCount > 0}">
			<input type="hidden" id="now_user_id" value="${user_id}">
			<input type="hidden" id="now_product" value="${pro_num}">
			<table>
				<tr class="review_basic">
						<th>별점</th><th>사진</th><th>구매자</th><th>후기 제목</th><th>후기 내용</th>
				</tr>
				<c:forEach var="searchReview" items="${searchReview}" varStatus="status">
					<tr class="review_content">
						<td><div id="individual_re_star${status.index}">${searchReview.re_star}점</div></td>
						<td><img src="${pageContext.request.contextPath}/upload/${searchReview.re_pic}" class="product_img_size" 
								onerror="this.style.display='none'"></img></td>
						<td><img src="${pageContext.request.contextPath}/upload/${memberPic[status.index]}" class="member_img_size"></img></td>
	                    <td><div  id="individual_re_user_id${status.index}">${searchReview.user_id}</div></td>
	                    <td><div  id="individual_re_title${status.index}">${searchReview.re_title}</div></td>
						<td><div  id="individual_re_star${status.index}">${searchReview.re_content}</div></td> 
						<c:if test="${CheckUser == 1}">
						<c:if test="${searchReview.user_id == user_id}">
						<td><a href="#updateOpen" class="btn_open">수정</a>
						<div id="updateOpen" class="pop_wrap" style="display:none;">
	  						<div class="pop_inner">
	  							<form action="updateForm" method="post" enctype="multipart/form-data">
	  								<table>
	  									<tr>
	  										<td><input type="hidden" name="user_id" value="${user_id}"></td>
											<td><input type="hidden" name="pro_num" value="${pro_num}"></td>
		  									<td>별점: </td><td><input type="number" name="re_star" value="kkk" min="1" max="5" maxlength="1"></td>
		  									<td>후기 제목: </td><td><input type="text" name="re_title" value="aaa" maxlength="20"></td>
		  									<td>후기 내용: </td><td><input type="text" name="re_content" value="www" maxlength="1000"></td>
		  									<td>사진 첨부: <input type="file" name="file"></td>
		  									<td><input type="hidden" name="path" value="${pageContext.request.contextPath}/upload/"></td>
		  									<td><input type="submit" value="수정"></td>								
	  									</tr>
	  								</table>
								</form>
	  	  							<button type="button" class="btn_close">닫기</button>
	  						</div>
						</div>
						</c:if> 
						<td><input type="button" onclick="reviewDelete(${status.index})" value="삭제"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<table>
				<c:if test="${CheckUser == 1}">
				<c:if test="${CountPersonalReview == 0}">
					<td><a href="#insertOpen" class="btn_open">입력</a> 
						<div id="insertOpen" class="pop_wrap" style="display:none;">
		  					<div class="pop_inner">
		  						<form action="insertForm" method="post" enctype="multipart/form-data">
		  							<table>
		  								<tr>
		  									<td><input type="hidden" name="user_id" value="${user_id}"></td>
											<td><input type="hidden" name="pro_num" value="${pro_num}"></td>
		  									<td>별점: <input type="number" name="re_star"  value="" min="1" max="5" maxlength="1" required="required"></td>
		  									<td>후기 제목: </td><td><input type="text" name="re_title" value="" maxlength="20" required="required"></td>
		  									<td>후기 내용: </td><td><input type="text" name="re_content" value="" maxlength="1000" required="required"></td>
		  									<td>사진 첨부: <input type="file" name="file"></td>
		  									<td><input type="hidden" name="path" value="${pageContext.request.contextPath}/resources/image/"></td>
		  									<td><input type="submit" value="입력"></td>									
		  								</tr>
		  							</table>
								</form>
		  	  						<button type="button" class="btn_close" >닫기</button>
		  					</div>
						</div>
				</c:if>
				</c:if>
			</table>
		</c:if>
	</div>
	</div>
	
	
	
    <div id="tab3_content"><b>배송/환불 규정</b><img alt="detailimg" id="detailimg" src="${pageContext.request.contextPath}/img/delivery&refund.JPG"></div>
    
	</div>





	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">


	function ClickReview() {
		$("#tab2_content").show();
		$("#tab1_content").hide();
		$("#tab3_content").hide();
	}
	function ClickDetail() {
		$("#tab2_content").hide();
		$("#tab1_content").show();
		$("#tab3_content").hide();
	}
	function ClickRefund() {
		$("#tab2_content").hide();
		$("#tab1_content").hide();
		$("#tab3_content").show();
	}
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;
	
	// 팝업 열기
	for(var i = 0; i < target.length; i++){
	  target[i].addEventListener('click', function(){
	    targetID = this.getAttribute('href');
	    document.querySelector(targetID).style.display = 'block';
	  });
	}
	
	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
	  btnPopClose[j].addEventListener('click', function(){
	    this.parentNode.parentNode.style.display = 'none';
	  });
	}
	

function reviewDelete(vIndex) {
	
		
	if($("#individual_re_user_id"+vIndex).val()
		== document.getElementById('now_user_id').value) {
		
		console.log(document.getElementById('individual_re_user_id'+vIndex).value)
		console.log(document.getElementById('now_user_id').value)
		
		
			var form = document.createElement('form');
		form.setAttribute('method','post');
		form.setAttribute('action', "http://localhost:8989/DeleteReview");
		document.charset = "utf-8"; 
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pro_num");
		hiddenField.setAttribute('value', document.getElementById('now_product').value);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"user_id");
		hiddenField.setAttribute('value', document.getElementById('now_user_id').value);
		form.appendChild(hiddenField);
		} 
		
		document.body.appendChild(form);
		form.submit();
	
		}
	else {
		alert("접근 권한이 없습니다")
	}
}

function addFilePath(msg) {
	alert(msg);
	document.getElementById("form").reset();
}
</script>

</html>