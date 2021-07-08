<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 검색</title>
<!-- HEAD -->
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="header.jsp"%>

	<!--  BODY  -->
	<section id="total_search" class="mt-3">
		<!-- 동네생활 -->
		<div class="container">
			<div class="d-flex justify-content-between">
				<h3 class="d-inline-block">동네생활</h3>
				<a href="town_list" class="d-inline-block text-yomul">전체보기 ></a>
			</div>
			<div class="user_town_list_body">
				<!--  게시글 부분 -->
				<div class="container bootstrap snippets bootdey">
					<div class="row">
						<div class="post-list">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="description">제목</h1>
									<div>
										<a href="http://localhost:9000/yomul/town_info?no=">부엌 찐한 차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천 부탁드려용 거실 톤도 티비벽이랑 바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들 의견 부탁드려용</a>
									</div>
									<div class="town_info">
										<label>해푸름</label>
										<label>작성일자:2021-07-05</label>
										<label style="color: tomato">댓글:15</label>
										<label>조회수:30</label>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="picture">
										<img src="image/신발사진1.jpg">
									</div>
								</div>
							</div>
						</div>
						<div class="post-list">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="description">제목</h1>
									<div>
										<a href="http://localhost:9000/yomul/town_info">부엌 찐한 차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천 부탁드려용 거실 톤도 티비벽이랑 바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들 의견 부탁드려용</a>
									</div>
									<div class="town_info">
										<label>해푸름</label>
										<label>작성일자:2021-07-05</label>
										<label style="color: tomato">댓글:15</label>
										<label>조회수:30</label>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="picture">
										<img src="image/신발사진1.jpg">
									</div>
								</div>
							</div>
						</div>
						<div class="post-list">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="description">제목</h1>
									<div>
										<a href="http://localhost:9000/yomul/town_info">부엌 찐한 차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천 부탁드려용 거실 톤도 티비벽이랑 바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들 의견 부탁드려용</a>
									</div>
									<div class="town_info">
										<label>해푸름</label>
										<label>작성일자:2021-07-05</label>
										<label style="color: tomato">댓글:15</label>
										<label>조회수:30</label>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="picture">
										<img src="image/신발사진1.jpg">
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<hr class="my-5">

			<!-- 내 근처 소식 -->
			<div class="near-home-news">
				<div>
					<h3>내 근처 소식</h3>
					<a href="near_home">전체보기 ></a>
				</div>
				<c:forEach var="i" begin="0" end="2" step="1">
					<div class="near-home-news-content">
						<table>
							<tr>
								<td><img src="/yomul/image/이미지준비중.jpg"></td>
								<td>
									<div>
										<h5>타이틀</h5>
										<p>내용</p>
										<img src="/yomul/image/이미지준비중.jpg">
										<label>작성자</label>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>