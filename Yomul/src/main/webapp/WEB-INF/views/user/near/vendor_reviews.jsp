<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- MYPAGE HEADER -->
	<%@include file="vendor_header.jsp"%>
	<script type="text/javascript">
		$("#vendor_header_reviews").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<div id="vendor_reviews" class="vendor-reviews-content">
		<% for(int i=0;i<10;i++){ %>
		<div class="vendor-reviews-card">
			<div class="card" style="width: 18rem;">
			 	<div class="card-body">
			 	<div class="vendor-reviews-regular">
				 	<img src="/yomul/image/이미지준비중.jpg" class="card-img-top">
				    <h5 class="card-title">단골 닉네임</h5>
			 	</div>
	    		<a href="/yomul/reviews_info">
		    		<p class="card-text">요거 물건이네 이용해 봤는데 친절하고 너무 좋아요. 사장님이 젊으셔서 그런지 인테리어도 예쁘더라구요 *^^* ...</p>
				</a>			    		
				</div>
			</div>
		</div>
		<% } %>
	</div>
	
	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>