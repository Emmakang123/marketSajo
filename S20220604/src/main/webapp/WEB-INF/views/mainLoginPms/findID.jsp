<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="/WEB-INF/views/mainLoginPms/findIdPwModal.jsp" %> --%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findID</title>
<link href="css/findIdPw.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	

<script type="text/javascript">
	
//모달창 열기,닫기
$(function() {
	
	$(".modal_button").click(function(){
		$(".modal").fadeIn();
	});
	$(".modal_content").click(function(){
		$(".modal").fadeOut();
	});
});

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>

	<div class="findID">
		<!-- <form action="findIdBtn" name="findIdBtn"> -->
				<a href="${pageContext.request.contextPath}/findID">아이디찾기 </a> / <a href="${pageContext.request.contextPath}/findPW">비밀번호찾기 </a> 
				<p>이름</p>
				<input type="text" name="inputName" id="inputName" class="custom-control-input"
					 placeholder="이름을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력해주세요'">
				<p>이메일</p>
				<input type="text" name="inputEmail" id="inputEmail" class="custom-control-input"
					 placeholder="이메일을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력해주세요'">
				<!-- <input type="submit" class="idSearch" value="확인"><p> -->
				<button id="findID_btn" type="button" onclick="searchID()">확인</button><p>
		<!-- </form> -->
		<button id="login_button" onclick = "location.href = '${pageContext.request.contextPath}/login' ">로그인</button>
	</div>
			
			<div class="modal" id="modal">
				<div class="modal_content" title="클릭하면 창이 닫힙니다">
					<p id="aaas"></p>
					<input type="button" id="login_button" name="login_button" value="로그인" onclick = "location.href = '${pageContext.request.contextPath}/login' ">
				</div>
			</div>

	<script type="text/javascript">
	
	//아이디 찾아서 보여주는 아작스
	
		document.getElementById("findID_btn").onclick = function searchID() {
		    document.getElementById("modal").style.display="flex";
	
		var idV ="";
		var user_name = $('#inputName').val();
		var email = $('#inputEmail').val();
		alert("user_name: " + user_name + "email: " + email);
		
		
			$.ajax({
			type:"POST",
			url:"<%=context%>/findIdBtn",
			data: {user_name: user_name, email: email},
			dataType:'json',
			success:function(member3){
				if(member3.user_id == 'failUser'){
					/* $('#id_value').text("회원 정보를 확인해주세요"); */
					 ajaxSuccessFailUser()
				}else {
					$('.modal_content').append("찾으시는 아이디는 "+member3.user_id+"입니다");
					//alert("찾으시는 아이디는 "+member3.user_id);/*유저아이디를 갖고있는데 멤버로 담아와서 어떻게 유저아이디만 보여주는지 모르겠다*/
					idV = member3;/*비번 찾기용으로 일단 변수에 담기는 했는데 안쓸지도..?*/
					$('#aaas').html("찾으시는 아이디는 "+member3.user_id);
				}
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
			  location.href="${pageContext.request.contextPath}/findID";
		  }
		})
	}
	</script>

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>