<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdPwModal</title>
</head>
<script type="text/javascript">
	$(function () {
		$("#found_modalbtn").click(function(){
			$(".foundback_modal").fadeIn();
		});
		$("#found_userid").click(function(){
			$(".foundback_modal").fadeOut();
		});
	});
</script>

<body>

	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>