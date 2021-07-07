<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 목록</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- MYPAGE HEADER -->
	<%@include file="vendor_header.jsp"%>
	<script type="text/javascript">
		$("#vendor_header_news").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_news_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<div id="vendor_news_list" class="vendor-news-list-content">
		<% for(int i=0;i<10;i++){ %>
		<div class="media" id="vendor-news-list-img">
			<img src="/yomul/image/이미지준비중.jpg" class="mr-3">
			<div class="media-body">
		    <h5 class="mt-0" style="padding-top:5px;">요거 물건이네 오픈~!</h5>
		    <p>안녕하세요. 요거 물건이네 소식입니다. 우리 업체는 어쩌구 저쩌구 많이 이용해주시고 악플은 사절합니다 ...</p>
		    <label>조회 29</label>
		    <label class="near-info-point" style="color:lightgray;">·</label>
		    <label>좋아요 10</label>
			</div>
		</div>
		<div class="vendor-profile-follow-line"></div>
		<% } %>
	</div>
	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>