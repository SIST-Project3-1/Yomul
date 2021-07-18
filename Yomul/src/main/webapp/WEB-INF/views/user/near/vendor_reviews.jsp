<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<c:import url="vendor_header.jsp" />
	<script type="text/javascript">
		$("#vendor_header_reviews").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<div id="vendor_reviews" class="vendor-reviews-content">
		<c:forEach var="vo" items="${list }">
			<div class="vendor-reviews-card">
				<div class="card" style="width: 18rem;">
				 	<div class="card-body">
				 	<div class="vendor-reviews-regular">
					 	<img src="/yomul/upload/${vo.profileImg }" class="card-img-top">
					    <h5 class="card-title">${vo.nickname }</h5>
				 	</div>
		    		<a href="/yomul/reviews_info/${vo.no }">
			    		<p class="card-text">${vo.content }</p>
					</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>