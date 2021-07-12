<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 생활</title>
<%@ include file="../../head.jsp"%>
<style>
/* town_list head 부분 (검색) */
.user_town_list_head {
	width: 100%;
	background-color: Gainsboro;
}

.user_town_list_head #btn-yomul {
	background-color: rgb(255, 99, 95);
}

.user_town_list_head .head {
	width: 80%;
	height: 300px;
	margin: auto;
}

.user_town_list_head .form-control-borderless {
	border: none;
}

.user_town_list_head .form-control-borderless:hover,
	.user_town_list_head .form-control-borderless:active,
	.user_town_list_head .form-control-borderless:focus {
	border: none;
	outline: none;
	box-shadow: none;
}

.user_town_list_head .text {
	text-align: center;
}

.user_town_list_head div.label {
	text-align: center;
}

.user_town_list_head #product {
	background-color: white;
	border-radius: 20px;
	display: inline;
	color: black;
	text-decoration: none;
	border: 2px solid white;
}

/*user_town_body 정렬 버튼 부분*/
.user_town_list_body {
	width: 80%;
	margin: auto;
}

.user_town_list_body .mt-200 {
	margin-top: 50px;
}

.user_town_list_body .dropbtn {
	background-color: rgb(255, 99, 95);
	color: white;
	padding: 6px;
	font-size: 14px;
	border: none;
	border-radius: 3px
}

.user_town_list_body .dropdown {
	position: relative;
	display: inline-block
}

.user_town_list_body .dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	border: 2px solid black;
	min-width: 100px;
	z-index: 1
}

.user_town_list_body .dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block
}

.user_town_list_body .dropdown-content a:hover {
	background-color: #ddd
}

.user_town_list_body .dropdown:hover  .dropdown-content {
	display: block
}

.user_town_list_body .dropdown:hover .dropbtn {
	background-color: rgb(255, 99, 95);
}

/*town_list 본 게시글*/
.user_town_list_body .post-list {
	position: relative;
	padding: 5px 0;
}

.user_town_list_body .post-list .picture {
	max-width: 400px;
	overflow: hidden;
	height: auto;
	border-radius: 6px;
}

.user_town_list_body .post-list .label {
	font-weight: normal;
}

.user_town_list_body .post-list .picture {
	max-width: 210px;
}

.user_town_list_body .post-list .picture img {
	width: 100%;
}

.user_town_list_body .post-list p {
	float: left;
}

.user_town_list_body .post-list:after {
	height: 1px;
	background: #EEEEEE;
	width: 83.3333%;
	bottom: 0;
	right: 0;
	content: "";
	display: block;
	position: absolute;
}

.user_town_list_body .post-list .town_info {
	margin-top: 70px;
}

.user_town_list_body div.pagenation {
	text-align: center;
}

.user_town_list_body #dropdown {
	width: 80%;
	margin: auto;
}

div.town_info label {
	border-left: 2px solid lightgray;
}
</style>
<script>
	//태그 누르면 검색창에 뜨도록
	$(document).ready(function() {
		$("#product").click(function() {
			let productValue = $("#product").val();
			$("#townSearch").val(productValue);
		})
	});
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<!-- //http://localhost:9090/yomul/town_list -->

	<!-- user_town_list 검색창 부분 -->
	<div id="sample">
		<div class="user_town_list_head">
			<div class="head">
				<div class="container">
					<br />
					<div class="text">
						<h1>동네생활</h1>
						<h3>요물마켓 동네 사람들끼리 소통하는 공간입니다</h3>
					</div>
					<div class="row justify-content-center">
						<div class="col-12 col-md-10 col-lg-8">
							<form class="card card-sm">
								<div class="card-body row no-gutters align-items-center">
									<div class="col-auto">
										<i class="fas fa-search h4 text-body"></i>
									</div>

									<div class="col">
										<input
											class="form-control form-control-lg form-control-borderless"
											type="search" placeholder="궁금한것을 찾아보세요" id="townSearch"
											name="townSearch">
									</div>

									<div class="col-auto">
										<button class="btn btn-lg btn-primary" type="submit"
											id="btn-yomul">검색</button>
									</div>

								</div>
							</form>
						</div>

					</div>
				</div>
				<br>
				<div class="label">
					<button type="button" value="중고상품" id="product">#중고상품</button>
				</div>
			</div>
		</div>
		<!-- user_town_list 정렬 부분 -->
		<div class="user_town_list_body">
			<div class="text-left mt-200" id="dropdown">
				<span class="product_options">정렬</span><br>
				<div class="dropdown">
					<button class="dropbtn">
						인기순 <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="#">인기순</a> <a href="#">최신순</a>
					</div>
				</div>
			</div>
			<hr>


			<!--  게시글 부분 -->
			<div class="container bootstrap snippets bootdey">
				<div class="row">
					<div class="post-list">
						<div class="row">
							<div class="col-sm-8">
								<h1 class="description">제목</h1>
								<span class="badge badge-pill badge-secondary">중고상품</span>
								<div>
									<a href="http://localhost:9000/yomul/town_info?no=">부엌 찐한
										차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천 부탁드려용 거실 톤도 티비벽이랑
										바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들 의견 부탁드려용</a>
								</div>
								<div class="town_info">
									<label>닉네임</label><label>작성일자:2021-07-05</label><label
										style="color: tomato">댓글:15</label><label>조회수:30</label>
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
								<span class="badge badge-pill badge-secondary">중고상품</span>
								<div>
									<a href="http://localhost:9000/yomul/town_info">부엌 찐한
										차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천 부탁드려용 거실 톤도 티비벽이랑
										바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들 의견 부탁드려용</a>
								</div>
								<div class="town_info">
									<label>닉네임</label><label>작성일자:2021-07-05</label><label
										style="color: tomato">댓글:15</label><label>조회수:30</label>
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
								<span class="badge badge-pill badge-secondary">중고상품</span>
								<div>
									<a href="http://localhost:9000/yomul/town_info">부엌 찐한
										차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천 부탁드려용 거실 톤도 티비벽이랑
										바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들 의견 부탁드려용</a>
								</div>
								<div class="town_info">
									<label>닉네임</label><label>작성일자:2021-07-05</label><label
										style="color: tomato">댓글:15</label><label>조회수:30</label>
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
	</div>

	<%@ include file="../footer.jsp"%>
</body>
</html>