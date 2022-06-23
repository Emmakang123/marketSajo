<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/faqLogin.css" rel="stylesheet" type="text/css">

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
				<div class="col-12 col-md-2 offset-md-5">
					<div class="login">
						<div><label for="inputEmail4" class="form-label">문의번호</label>
							 <input type="text" id="number" >
						</div>	
						<div>
							<label >비밀번호</label>
					 		<input type="password" id="pass">
						</div>
					</div> 
					<div class="Loginbtn">
						<button class="btn btn-primary" onclick="faqchk()">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
<script type="text/javascript">
 
	function faqchk() {
		const num = $("#number").val();
		var pass = $("#pass").val();
		alert("num : " + num + "pass : " + pass);
		$.ajax({
			url: "<%=context%>/faqchk",
			data:{num: num, pass: pass},
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					location.href = "faqLoginDetail?faq_num=" + num;					
				} else {
					alert("문의번호 또는 비밀번호가 틀립니다. 다시 한번 확인해주세요.");	
				}
			}
			
		});
	}

</script>
</body>
</html>