<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 프로필 보기</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<%@include file="mypage_header.jsp"%>
	<script type="text/javascript">
		$("#mypage_header_myprofile").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#mypage_header_myprofile_info").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="myprofile_info" style="height: 75%; align-items: center;">
		<div class="container border mt-3 p-3">
			<div class="row">
				<div class="col-md-4 text-center">
					<img class="rounded-circle mb-3" src='/yomul/upload/${file.filename!=null?file.getSavedFilename(): "default.jpg" }' style="width: 300px; height: 300px;">
				</div>
				<div class="col-md my-auto">
					<div class="mb-3 d-flex justify-content-between">
						<h3 class="my-0 d-inline-block">${member.nickname }</h3>
						<a class="btn btn-sm my-0" href="/yomul/vendor_profile_info">
							<small>비즈 프로필</small>
						</a>
					</div>
					<a class="btn btn-sm btn-outline-dark mb-3" href="/yomul/mypage/myprofile_update">수정</a>
					<p class="mb-3">${member.intro }</p>
				</div>
			</div>
			<hr>
			<div class="d-flex justify-content-around">
				<a class="btn" href="/yomul/mypage/buy_list">
					<h2>
						<i class="bi bi-basket"></i>
					</h2>
					<div class="font-weight-bold">구매 내역</div>
					<div>${buyCount }</div>
				</a>
				<a class="btn" href="/yomul/mypage/sell_list">
					<h2>
						<i class="bi bi-cash-coin"></i>
					</h2>
					<div class="font-weight-bold">판매 내역</div>
					<div>${sellCount }</div>
				</a>
				<a class="btn" href="/yomul/mypage/favorite_list">
					<div>
						<h2>
							<i class="bi bi-bookmark-star"></i>
						</h2>
					</div>
					<div class="font-weight-bold">찜 목록</div>
					<div>${favoriteCount }</div>
				</a>
			</div>
		</div>
		<br>
		<div class="text-center mt-5">
			<a href="/yomul/mypage/kakao_register">
				<img src="/yomul/image/kakao_login_medium.png">
			</a>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>