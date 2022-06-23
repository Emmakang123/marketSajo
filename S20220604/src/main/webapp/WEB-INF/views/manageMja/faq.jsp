<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/faq.css" rel="stylesheet" type="text/css">
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
			<div class="row">
				<div id="notice">
 					<h2>1:1 문의하기</h2><hr>
 				</div>
 			<div class="row no-gutters" id="faq-main">
				<div class="col-12 col-md-3 offset-md-3">
					<div id="faq"><a href="faq?user_id=${sessionId}">문의하기</a></div>
				</div>
				<div class="col-12 col-md-3">
					<div id="faq"><a href="interceptor">나의 문의내역</a></div>
	 			</div>
 			</div>
 			
			<div class="col-12 col-md-10 offset-md-1">
				<table class="table" id="tbl-first">
					<tr><td colspan="2">개인정보 수집 및 이용 안내</td></tr>
					<tr><th>수집항목</th><td>* [필수] 이름, 이메일, 휴대폰번호, 비밀번호, 발생지 주소(택배 이용문의 시), 운송장번호(택배/특송 이용문의 시)</td></tr>
					<tr><th>수집 및 이용 목적</th><td> 고객 민원 접수, 사실 관계 확인을 위한 연락 및 통지, 처리 결과 안내</td></tr>
					<tr><th>보유 및 이용 기간 </th><td> -상담 접수 및 처리 후 3개월 까지 -소비자 불만/분쟁 처리 후 3년(법정 보존기간)</td></tr>
					<tr><td colspan="2">*고객은 상기의 개인정보 수집 및 이용에 대해 동의를 거부하실 수 있으나 해당 동의를 거부하시는 경우 1:1문의가 불가합니다.</td></tr>
					<tr><td colspan="2"><input type="checkbox" id="inChk"> 이용동의 </td></tr>
				</table>
				
				<form action="faqSubmit" method="post">
					<table class="table" id="tbl-second">
						<tr><td colspan="2">기본 정보 입력</td></tr>
						<tr><th>이름</th>
							<c:choose>
								<c:when test="${empty sessionId}"><td>
									<input type="text" name="user_id" required="required"></td> 
								</c:when>
						 		<c:otherwise>
						 			<td><input type="text" name="user_id" readonly="readonly" value="${user_id}"></td>
						 		</c:otherwise>
						 	</c:choose>
						</tr>
						<tr><th>이메일</th>
							<td>
								<input type="text" name="faq_email" id="email_id" placeholder="marketSojo@gmail.com" maxlength="18" />  	 
							</td>
						</tr>
						<tr><th>휴대폰번호</th>
							<td>
								<input type="tel" name="faq_phone"  required="required" id = "telInput" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"  placeholder="예) 010-1234-5678">					
							</td>
						</tr>
						<tr><th>비밀번호</th>
							<td>
								<input type="text" placeholder="숫자 4자리" maxlength="4" name="faq_pass"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required">
							</td>
						</tr>
						<tr><td colspan="2">상세항목입력</td></tr>
						<tr><th>문의유형</th><td>
							<select name="faq_category">
								<option value="1">회원정보</option>
								<option value="2">신  고</option>
								<option value="3">기  타</option>					
							</select></td></tr>
						<tr><th>제목</th><td><input type="text" name="faq_subject" required="required"></td></tr>
						<tr><th>내용</th><td><textarea rows="5" cols="30" name="faq_content" required="required"></textarea>
							<c:choose>
								<c:when test="${empty sessionId}"> 
									<input type="hidden" name="login_check" value="0"> 
								</c:when>
							 	<c:otherwise>
							 		<input type="hidden" name="login_check" value="1">
							 	</c:otherwise>
							 </c:choose></td></tr>					 
					</table>
			 	</form>
			 	<button id="submitBtn">제출하기</button>	
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function (){
		$('#submitBtn').click(function () {
			var yn = $("input:checkbox[id=inChk]").is(":checked");
			if(yn){
				$("form").submit();
			} else {
				alert("이용동의해주셔야 등록이 가능합니다.");
			}
		})	
	});
	
	function inNumber() {
		if(event.keyCode<= 48 || event.keyCode > 57){
			event.returnValue= false;
		}
	}
	
	
	//핸드폰 번호 입력
	$('#telInput').keyup(function (event) {
		  event = event || window.event;
		  var _val = this.value.trim();
		  this.value = autoHypenTel(_val);
		});
	
	function autoHypenTel(str) {
		  str = str.replace(/[^0-9]/g, '');
		  var tmp = '';

		  if (str.substring(0, 2) == 02) {
		    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
		    if (str.length < 3) {
		      return str;
		    } else if (str.length < 6) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2);
		      return tmp;
		    } else if (str.length < 10) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 3);
		      tmp += '-';
		      tmp += str.substr(5);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 4);
		      tmp += '-';
		      tmp += str.substr(6, 4);
		      return tmp;
		    }
		  } else {
		    // 핸드폰 및 다른 지역 전화번호 일 경우
		    if (str.length < 4) {
		      return str;
		    } else if (str.length < 7) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3);
		      return tmp;
		    } else if (str.length < 11) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 3);
		      tmp += '-';
		      tmp += str.substr(6);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 4);
		      tmp += '-';
		      tmp += str.substr(7);
		      return tmp;
		    }
		  }

		  return str;
		}
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>