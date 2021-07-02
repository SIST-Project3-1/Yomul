<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  부트스트랩 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">


<style>
/* town_list head 부분 (검색) */
.user_town_list_head {
	width: 100%;
	background-color: Gainsboro;
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

#btn {
	background-color: tomato;
}

.user_town_list_head .text {
	text-align: center;
}

.user_town_list_head div.label {
	text-align: center;
}

.user_town_list_head a {
	background-color: white;
	border-radius: 20px;
	display: inline;
	color: black;
	text-decoration: none;
}

/*user_town_body 정렬 버튼 부분*/
.user_town_list_body {
	width: 80%;
	margin: auto;
}

.mt-200 {
	margin-top: 50px;
}

.dropbtn {
	background-color: tomato;
	color: white;
	padding: 6px;
	font-size: 14px;
	border: none;
	border-radius: 3px
}

.dropdown {
	position: relative;
	display: inline-block
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	border: 2px solid black;
	min-width: 100px;
	z-index: 1
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block
}

.dropdown-content a:hover {
	background-color: #ddd
}

.dropdown:hover  .dropdown-content {
	display: block
}

.dropdown:hover .dropbtn {
	background-color: tomato;
}

/*town_list 본 게시글*/
.post-list {
	position: relative;
	padding: 5px 0;
}

.post-list .picture {
	max-width: 400px;
	overflow: hidden;
	height: auto;
	border-radius: 6px;
}

.post-list .label {
	font-weight: normal;
}

.post-list .picture {
	max-width: 210px;
}

.post-list .picture img {
	width: 100%;
}

.post-list p {
	float: left;
}

.post-list:after {
	height: 1px;
	background: #EEEEEE;
	width: 83.3333%;
	bottom: 0;
	right: 0;
	content: "";
	display: block;
	position: absolute;
}

.post-list .town_info {
	margin-top: 70px;
}

div.pagenation {
	text-align: center;
}
</style>




<meta charset="UTF-8">
<title>동네 생활</title>
</head>
<body>
	<!-- //http://localhost:9090/yomul/town_list -->

	<!-- user_town_list 검색창 부분 -->
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
								<!--end of col-->
								<div class="col">
									<input
										class="form-control form-control-lg form-control-borderless"
										type="search" placeholder="궁금한것을 찾아보세요">
								</div>
								<!--end of col-->
								<div class="col-auto">
									<button class="btn btn-lg btn-primary" type="submit" id="btn">검색</button>
								</div>
								<!--end of col-->
							</div>
						</form>
					</div>
					<!--end of col-->
				</div>
			</div>
			<br>
			<div class="label">
				<a href="#">#중고상품</a>&nbsp;&nbsp;<a href="#">#신발</a>
			</div>
		</div>
	</div>
	<!-- user_town_list 정렬 부분 -->
	<div class="user_town_list_body">
		<div class="text-left mt-200">
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
							<div>
								<label>부엌 찐한 차콜색?으로 인테리어 되어있었어요!삼성 비스포크로 냉장고 할건데.. 색상 추천
									부탁드려용 거실 톤도 티비벽이랑 바닥이 나무인데요! 어떤 톤 가구가 이 집에 잘 어울릴까용..? 재능 많으신 분들
									의견 부탁드려용</label>
							</div>
							<div class="town_info">
								<label>아이디</label><label>작성시간</label><label
									style="color: tomato">댓글갯수:</label><label>조회수</label>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="picture ">
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
								<label>거실 주방 일체형입니다.소파 3인용으로 들이고싶은데 색갈 어떤게 좋을가요?패브릭으로 하고
									싶은데 아이 키우는 집이라 그래두 가죽느낌의 재질이 나을거 같아요..40만원 아래로 보고 있는데 추천해주실
									색갈이나 브랜드 알려주시면 고맙겠습니다.</label>
							</div>
							<div class="town_info">
								<label>아이디</label><label>작성시간</label><label
									style="color: tomato">댓글갯수:</label><label>조회수</label>
							</div>
						</div>
						<div class="col-sm-4 ">
							<div class="picture ">
								<img src="image/신발사진2.png">
							</div>
						</div>
					</div>
				</div>
				<div class="post-list">
					<div class="row">
						<div class="col-sm-8">
							<h1 class="description">제목</h1>
							<div>
								<label>창 두개 넓직이 잘 빠진 거실을 어떻게 활용하면 좋을까요?고양이 키우는 집사라 인테리어에
									한계가 있네요🥲홈바로 일년살고 처분했는데 어떻게 꾸미면 좋을지 모르겠어요홈캠핑도 생각중인데 앞에 건물이 있어서
									뷰가 좋지않아요ㅜㅜ</label>
							</div>
							<div class="town_info">
								<label>아이디</label><label>작성시간</label><label
									style="color: tomato">댓글갯수:</label><label>조회수</label>
							</div>
						</div>
						<div class="col-sm-4 ">
							<div class="picture ">
								<img src="image/신발사진3.png">
							</div>
						</div>
					</div>
				</div>

				<hr>
				<div class="pagenation">1 2 3 4 5 6 7 8 9 10</div>


			</div>
		</div>

	</div>



</body>
</html>