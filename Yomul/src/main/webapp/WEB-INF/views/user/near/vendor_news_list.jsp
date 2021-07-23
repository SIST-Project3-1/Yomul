<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 목록</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<c:import url="vendor_header.jsp" />
	<script type="text/javascript">
		$("#vendor_header_news").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_news_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<div id="vendor_news_list" class="vendor-news-list-content" style="padding-bottom:100px;">
		<c:forEach var="vo" items="${list }">
			<div class="media" id="vendor-news-list-news">
				<img src="/yomul/upload/default.jpg" class="mr-3">
				<div class="media-body">
				<a href="/yomul/near_info/${vo.no }" class="vendor-news-list-info">
				    <h5 class="mt-0" style="padding-top:5px;">${vo.title }</h5>
				    <p>${vo.content }</p>
				</a>
			    <label>조회 ${vo.hits }</label>
			    <label class="near-info-point" style="color:lightgray;">·</label>
			    <label>좋아요 ${vo.likes }</label>
				</div>
				<c:if test="${owner == sessionScope.member.no }">
					<div class="vendor_news_list_update">
						<a href="/yomul/vendor_news_update">수정</a>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>