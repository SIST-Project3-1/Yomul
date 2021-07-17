<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단골</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<%@include file="vendor_header.jsp"%>
	<script type="text/javascript">
		$("#vendor_header_profile").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_profile_follow").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<div id="vendor_profile_follow" class="vendor-profile-follow-content">
		<c:forEach var="vo" items="${list }">
			<div class="media" id="vendor-profile-follow-img">
				<img src="/yomul/upload/${vo.profileImg }" class="mr-3">
				<div class="media-body">
				 <h5 class="mt-0">${vo.nickname }</h5>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>