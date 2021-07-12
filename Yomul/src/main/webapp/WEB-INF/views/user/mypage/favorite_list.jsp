<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<%@include file="mypage_header.jsp"%>
	<script type="text/javascript">
		$("#mypage_header_order_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#mypage_header_favorite_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="favorite_list" class="mt-3">
		<!--  상세 내역 -->
		<div class="container rounded border p-4 mt-3">
			<div>
				<div class="rounded border p-2 m-2">
					<div class="row">
						<div class="col-md-4 text-center">
							<img class="rounded-circle mb-3" src="/yomul/image/이미지준비중.jpg" style="width: 200px; height: 200px;">
						</div>
						<div class="col-md my-auto">
							<h4 class="mb-3">맛있고 좋은 비싼 단감</h4>
							<div class="mb-3">
								<span>Hwisaek</span> <span class="border mx-2"></span><span>39800원</span>
							</div>
						</div>
					</div>
				</div>
				<div class="rounded border p-2 m-2">
					<div class="row">
						<div class="col-md-4 text-center">
							<img class="rounded-circle mb-3" src="/yomul/image/이미지준비중.jpg" style="width: 200px; height: 200px;">
						</div>
						<div class="col-md my-auto">
							<h4 class="mb-3">가성비 원탑 ACER 노트북 거의 새거</h4>
							<div class="mb-3">
								<span>abc123</span> <span class="border mx-2"></span><span>500000원</span>
							</div>
						</div>
					</div>
				</div>
				<div class="rounded border p-2 m-2">
					<div class="row">
						<div class="col-md-4 text-center">
							<img class="rounded-circle mb-3" src="/yomul/image/이미지준비중.jpg" style="width: 200px; height: 200px;">
						</div>
						<div class="col-md my-auto">
							<h4 class="mb-3">무겁고 비싸지만 계산기는 잘 되는 맥북 중고</h4>
							<div class="mb-3">
								<span>애플수집가</span> <span class="border mx-2"></span><span>999000원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>