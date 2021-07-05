<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 보기</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="myprofile_info" style="height: 75%; display: flex; align-items: center;">
		<div class="container border mt-3 p-3">
			<div class="row">
				<div class="col-md-4 text-center">
					<img class="rounded-circle mb-3" src="/yomul/image/이미지준비중.jpg" style="width: 300px; height: 300px;">
				</div>
				<div class="col-md my-auto">
					<h3 class="mb-3">Hwisaek</h3>
					<a class="btn btn-sm btn-outline-dark mb-3" href="/yomul/myprofile_update">수정</a>
					<p class="mb-3">이 자리는 소개가 들어가는 자리로 프로필 페이지의 소개 부분인데 프로필 수정에서 소개 쪽을 수정해서 데이터를 입력할 수 있다는 매우 크면서도 작은 장점이 있습니다.</p>
				</div>
			</div>
			<hr>
			<div class="d-flex justify-content-around">
				<a class="btn">
					<h2>
						<i class="bi bi-basket"></i>
					</h2>
					<div class="font-weight-bold">구매 내역</div>
					<div>237</div>
				</a> <a class="btn">
					<h2>
						<i class="bi bi-cash-coin"></i>
					</h2>
					<div class="font-weight-bold">판매 내역</div>
					<div>432</div>
				</a> <a class="btn">
					<div>
						<h2>
							<i class="bi bi-bookmark-star"></i>
						</h2>
					</div>
					<div class="font-weight-bold">찜 목록</div>
					<div>16</div>
				</a>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>