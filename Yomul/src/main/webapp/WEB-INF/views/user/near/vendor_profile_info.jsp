<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 보기</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<c:import url="vendor_header.jsp" />
	<script type="text/javascript">
		$("#vendor_header_profile").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_profile_info").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="verdor_info" style="height: 75%; display: flex; align-items: center;">
		<div class="container border mt-3 p-3">
			<div class="row">
				<div class="col-md-4 text-center">
					<img class="rounded-circle mb-3" src="/yomul/upload/${vo.img }" style="width: 300px; height: 300px;">
				</div>
				<div class="col-md my-auto" id="vendor-profile-info">
					<h3>${vo.name }</h3>
					<label>${vo.category }</label>
					<div>
						<label>전화번호 : ${vo.tel }</label>
						<label class="near-info-point">·</label>
						<label>주소 : ${vo.addr }</label>
					</div>
					<div class="vendor-profile-follow">
						<a href="/yomul/vendor_profile_follow/${vo.no }">단골<label>${vo.customers }  ></label></a>
					</div>
					<p class="mb-3">${vo.info }</p>
				</div>
			</div>
			<hr>
			<div class="d-flex justify-content-around">
				<a class="btn" href="/yomul/vendor_news_list/${vo.no }">
					<h2>
						<i class="bi bi-bell"></i>
					</h2>
					<div class="font-weight-bold">소식</div>
					<div>${vo.news }</div>
				</a> 
				<a class="btn" href="/yomul/vendor_reviews/${vo.no }">
					<h2>
						<i class="bi bi-card-text"></i>
					</h2>
					<div class="font-weight-bold">후기</div>
					<div>${vo.reviews }</div>
				</a>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>