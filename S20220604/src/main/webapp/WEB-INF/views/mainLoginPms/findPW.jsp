<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPW</title>
<link href="css/findIdPw.css" rel="stylesheet" type="text/css"> 
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>


	<div class="login_box">
		<div class="findPW">
<!-- 		<form action="findPwBtn" name="findPwBtn"> -->
				<a href="/findID">아이디찾기 </a> / <a href="/findPW">비밀번호찾기 </a> 
				
				<p>이름</p>
				<input type="text" name="inputName" id="inputName" class="custom-control-input"
					 placeholder="이름을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력해주세요'">
				<p>아이디</p>
				<input type="text" name="inputId" id="inputId" class="custom-control-input"
					 placeholder="아이디를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력해주세요'">
				<p>이메일</p>
				<input type="text" name="inputEmail" id="inputEmail" class="custom-control-input"
					 placeholder="이메일을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력해주세요'">
				<!-- <input type="submit" class="idSearch" value="확인"><p> -->
				<button id="findPW_btn" type="button" onclick="searchPW()">확인</button><p>
<!-- 		</form> -->
		<button id="login_button" onclick = "location.href = '${pageContext.request.contextPath}/login' ">로그인</button>
	</div>
	</div>
	<script type="text/javascript">
	
	//비밀번호 찾아서 보여주는 아작스
	function searchPW(){
		var user_id = $('#inputId').val();
		var user_name = $('#inputName').val();
		var email = $('#inputEmail').val();
		alert("user_name: " + user_name +"user_id: " + user_id + "email: " + email);
			$.ajax({
				type:"POST",
				url:"<%=context%>/findPwBtn",
				data: {user_name: user_name, user_id:user_id, email: email},
				dataType:'json',
				success : function(member5){
					alert("member5.user_id->"+member5.user_id);
				
					  if(member5.user_id == 'failUser')  {
						  $('#id_value').text("회원 정보를 확인해주세요");
						  ajaxSuccessFailUser()
							
					 } else {
						 ajaxSuccess();
					     alert("유저의 임시비밀번호->"+member5.user_pw);/*유저아이디를 갖고있는데 멤버로 담아와서 어떻게 유저아이디만 보여주는지 모르겠다*/
		
					}
					
					
				},
				error : function (XMLHttpRequest, textStatus, errorThrown) {
					alert("실패");
				}
					
				
		});
	}
	

	function ajaxSuccessFailUser(){
			
			Swal.fire({

			  title:'확인',
			  text: "회원 정보를 확인해주세요",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#6B9900',
			  cancelButtonColor: '#f4f1e9',
			  confirmButtonText: '확인',
			}).then((result) => {
			  if (result.value) {
				  location.href="${pageContext.request.contextPath}/findPW";
			  }
			})
		}
	function ajaxSuccess(){
		
			Swal.fire({
			
			  title: '이메일전송',
			  text: "고객님의 이메일로 임시비밀번호를 전송했습니다. 로그인후 즉시 비밀번호를 변경해주세요!",
			  icon: 'success',
			  showCancelButton: true,
			  confirmButtonColor: '#6B9900',
			  cancelButtonColor: '#f4f1e9',
			  confirmButtonText: '로그인',
			  cancelButtonText: '홈으로'
			}).then((result) => {
			  if (result.value) {
				  location.href="${pageContext.request.contextPath}/login";
			  }
			  else{
				  location.href="${pageContext.request.contextPath}/index";
			  }
			})
		}

	</script>

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>