<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<link rel="stylesheet" href="http://localhost:9000/yomul/css/near.css">
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- MYPAGE HEADER -->
	<%@include file="vendor_header.jsp"%>
	<script type="text/javascript">
		$("#vendor_header_profile").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_profile_follow").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<div id="vendor_profile_follow" class="vendor-profile-follow-content">
		<% for(int i=0;i<10;i++){ %>
		<div class="media" id="vendor-profile-follow-img">
			<img src="/yomul/image/이미지준비중.jpg" class="mr-3">
			<div class="media-body">
			 <h5 class="mt-0">단골 닉네임</h5>
			</div>
		</div>
		<div class="vendor-profile-follow-line"></div>
		<% } %>
	</div>
	
	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>