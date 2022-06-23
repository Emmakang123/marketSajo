<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"></jsp:include>

	<style type="text/css">
	*{margin:0; padding:0;}
	a{text-decoration:none;}
	.wrap{padding:10px;}
	
	.btn_open{font-weight:bold; margin:5px; padding:4px 6px; background:#000; color:#fff;}
	.pop_wrap{position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,.5); font-size:0; text-align:center;}
	.pop_wrap:after{display:inline-block; height:100%; vertical-align:middle; content:'';}
	.pop_wrap .pop_inner{display:inline-block; padding:20px 30px; background:#fff; width:1000px; vertical-align:middle; font-size:15px;}
	</style>




</head>
<body>

	<c:if test="${reviewCount == 0}">
		<h2>리뷰가 없습니다</h2>
	</c:if>
	
	
	
	<c:if test="${reviewCount > 0}">
		<input type="hidden" id="now_user_id" value="${user_id}">
		<input type="hidden" id="now_product" value="${pro_num}">
		<table>
			<tr>
					<th>별점</th><th>사진</th><th>구매자</th><th>후기 제목</th><th>후기 내용</th>
			</tr>
			<c:forEach var="searchReview" items="${searchReview}" varStatus="status">
				<tr>
					<td><input type="text" id="individual_re_star${status.index}" value="${searchReview.re_star}" readonly="readonly"></td>
					<%-- <td><img src="${pageContext.request.contextPath}/${searchReview.re_pic}"></img></td> --%>
					<td><input type="text"  id="individual_re_user_id${status.index}" value="${searchReview.user_id}" readonly="readonly"></td>
					<td><input type="text"  id="individual_re_title${status.index}" value="${searchReview.re_title}" readonly="readonly"></td>
					<td><input type="text"  id="individual_re_star${status.index}" value="${searchReview.re_content}" readonly="readonly"></td> 
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
	  									<td>별점: </td><td><input type="number" name="re_star" value="" min="1" max="5" maxlength="1"></td>
	  									<td>후기 제목: </td><td><input type="text" name="re_title" value="" maxlength="20"></td>
	  									<td>후기 내용: </td><td><input type="text" name="re_content" value="" maxlength="1000"></td>
	  									<td>사진 첨부: <input type="file" name="file"></td>
	  									<td><input type="hidden" name="path" value="${pageContext.request.contextPath}/resources/image/"></td>
	  									<td><input type="submit" value="수정"></td>									
  									</tr>
  								</table>
							</form>
  	  							<button type="button" class="btn_close" >닫기</button>
  						</div>
					</div>
					</c:if> 
					<td><input type="button" onclick="reviewDelete(${status.index})" value="삭제"></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<table>
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
		</table>
	</c:if>
	
	
	


</body>
<script type="text/javascript">

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
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"></jsp:include>
</html>