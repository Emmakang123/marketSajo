<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정하기</title>
<link href="css/kge/producBoardModify.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	
	
	<h2 id="modifyTitle"><b>상품 수정하기</b></h2>
		
		<form action="ModifyProduct" method="post" name="pbw" enctype="multipart/form-data"> <!-- pbw=productboardwrite -->
				<input type="hidden" name="user_id" value="${product.user_id}">
				<input type="hidden" name="pro_num" value="${product.pro_num}">
				<div  class="ModifyProductDiv"> 
					<table id="modifyTable">
						<tr>
							<td class="boardModifyLeft"><b>상품 대분류 : </b></td>
							<td class="boardModifyRight">
								<c:if test="${product.pro_type1==100}">&nbsp;&nbsp;채소</c:if>
								<c:if test="${product.pro_type1==200}">&nbsp;&nbsp;과일</c:if>
								<c:if test="${product.pro_type1==300}">&nbsp;&nbsp;곡류</c:if>
							</td>
						</tr>
						<p>
						<tr>
							<td class="boardModifyLeft"><b>상품 중분류 : </b></td>
							<td class="boardModifyRight">
								<c:if test="${product.pro_type2==101}">&nbsp;&nbsp;야채</c:if>
								<c:if test="${product.pro_type2==102}">&nbsp;&nbsp;구황작물</c:if>
								<c:if test="${product.pro_type2==201}">&nbsp;&nbsp;국산과일</c:if>
								<c:if test="${product.pro_type2==202}">&nbsp;&nbsp;수입과일</c:if>
								<c:if test="${product.pro_type2==301}">&nbsp;&nbsp;쌀</c:if>
								<c:if test="${product.pro_type2==302}">&nbsp;&nbsp;대두류</c:if>
							</td>
						</tr>
						<p>
						<tr>
							<td class="boardModifyLeft"><b>상품 이름</b></td>
							<td><input type="text" class="modifyPro_title" name="pro_title" class="boardModifyRight" required="required" value="${product.pro_title}"></td>
						</tr>
						<tr>
							<td class="boardModifyLeft"><b>판매가격(원)</b></td>
							<td><input type="number" class="modifyPro_price" name="pro_price" class="boardModifyRight" required="required" value="${product.pro_price}"></td>
						</tr>
						<tr>
							<td class="boardModifyLeft"><b>상품판매 메인사진</b></td>
							<td><input type="file" class="modifyPro_photo" name="pro_photoImg" class="boardModifyRight" required="required" value="${product.pro_photo}"> <br> 
						</tr>
						<tr>
							<td class="boardModifyLeft"><b>상품 상세글</b></td>
							<td><input type="text" class="modifyPro_write" name="pro_write" class="boardModifyRight" required="required" value="${product.pro_write}"></td>
						</tr>
						<tr>
							<td class="boardModifyLeft"><b>상품판매 상세사진</b></td>
							<td><input type="file" class="modifyPro_pic" name="pro_picImg" class="boardModifyRight" required="required" value="${product.pro_pic}"> <br> 
						</tr>
						<tr>
							<td class="boardModifyLeft"><b>재고</b></td>
							<td><input type="number" class="modifyAmount" name="amount" class="boardModifyRight" required="required" value="${product.amount}"></td>
						</tr>
						<tr>
						<td colspan="2"><input id="modify_Submit_Button" type="submit" value="확인"></td>
					</tr>
				</table>
			</div>
		</form>
		


	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
</body>
</html>