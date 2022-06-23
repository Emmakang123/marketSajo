<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.opener.location.reload();
</script>
<style type="text/css">
.imgPic{
	width:55px;
	height: 55px;
	border-radius: 50%;
}
.showList{
	display: flex;
}
.tagTxt{
	margin-left: 15px;
	margin-top: 15px;
}
a{
	text-decoration: none;
	color: black;
}
.btn{
	margin-bottom: 10px;
}
</style>
</head>
<body>	
	<div>
	<button class="btn" onclick="window.close();">닫기</button>
		<c:forEach var="list" items="${openChatList }">
			<div class="showList">
				<div ><img class="imgPic" alt="" src="${pageContext.request.contextPath}/upload/${list.pic_change }" ></div> 
				<div class="tagTxt"><a href="insertParti?room_num=${list.room_num}">${list.room_name}</a> </div>
			</div>
			<hr>
		</c:forEach>
			<button onclick="location.href='openChatCreate'">오픈채팅만들기</button>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="openChatList?currentPage = $	{pg.startPage-pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="openChatList?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage > pg.totalPage }">
		<a href="openChatList?currentPage = ${pg.startPage+pg.pageBlock }">[다음]</a>
	</c:if>
	</div>
</body>
</html>