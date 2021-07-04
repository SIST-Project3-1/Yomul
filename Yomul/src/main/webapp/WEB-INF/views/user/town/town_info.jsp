<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네생활 상세보기</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
<style>
div.user_town_info {
	width: 50%;
	margin: auto;
}

div.user_town_info .body .tag a {
	padding: 8px 40px;
	background-color: Whitesmoke;
	border-radius: 30px;
	border: 2px solid white;
	color: black;
}

div.user_town_info .body .article {
	display: block;
}

div.user_town_info .body .info {
	margin-top: 20px;
}

div.user_town_info .body .img {
	display: block;
}

div.user_town_info .report {
	background-color: white;
	color: gray;
	text-decoration: underline;
	border: 2px solid white;
}

div.user_town_info .comment-wrapper .panel-body {
	max-height: 650px;
	overflow: auto;
}

div.user_town_info #btn {
	display: inline-block;
	background-color:white;
	color:rgb(255, 99, 95);
	border:2px solid white;
	font-weight:bold;
}

div.user_town_info .comment-wrapper .media-list .media img {
	width: 64px;
	height: 64px;
	border: 2px solid white;
	margin-right: 5px;
	border-radius: 30px;
}

div.user_town_info .comment-wrapper .media-list .media {
	border-bottom: 1px dashed #efefef;
	margin-bottom: 25px;
}

div.user_town_info div.foot .page {
	text-align: center;
}

div.user_town_info .form-control {
	width: 90%;
	display: inline;
}
</style>
</head>
<body>
	<!--  http://localhost:9000/yomul/town_info  -->
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="sample">
		<div class="user_town_info">
			<div class="head">
				<a href="town_list">질문과 답변</a>
				<h1>글 제목</h1>
			</div>
			<hr>
			<div class="body">
				<div class="article">본문 내용입니다.</div>
				<div class="img">
					<img src="image/신발사진3.png"> <img src="image/신발사진2.png">
				</div>
				<div class="tag">
					<a href="#">#동네생활</a><a href="#">#같이해요</a>
				</div>
				<div class="info">
					<label>2021년 7월 4일</label>&nbsp;<label>조회수8</label>&nbsp;
					<button type="button" class="report">신고</button>
				</div>
			</div>
			<hr>
			<div class="foot">
				<div class="container">
					<div class="row bootstrap snippets bootdeys">
						<div class="col-md-10 col-sm-12">
							<div class="comment-wrapper">
								<div class="panel panel-info">
									<div class="panel-body">
										<input type="text" class="form-control"
											placeholder="댓글을 남겨보세요"></input>
										<button type="button" class="btn btn-info" id="btn">등록</button>
										<br>
										<div class="clearfix"></div>
										<hr>
										<ul class="media-list">
											<li class="media"><a href="#" class="pull-left"> <img
													src="image/신발사진3.png" class="img-circle">
											</a>
												<div class="media-body">
													<p>
														<span class="text-muted pull-right"> <small
															class="text-muted">사용자 닉네임!!!</small>
														</span> 사용자 댓글 내용 내용 내용 내용 ~~~~~~~~
													</p>
													<span class="text-dark">2021년 07월 04일</span>
													<button type="button" class="report">좋아요</button>
													<button type="button" class="report">답글달기</button>
													<button type="button" class="report">신고</button>
												</div></li>
												
											<li class="media"><a href="#" class="pull-left"> <img
													src="image/신발사진3.png" class="img-circle">
											</a>
												<div class="media-body">
													<p>
														<span class="text-muted pull-right"> <small
															class="text-muted">사용자 닉네임!!!</small>
														</span> 사용자 댓글 내용 내용 내용 내용 ~~~~~~~~
													</p>
													<span class="text-dark">2021년 07월 04일</span>
													<button type="button" class="report">좋아요</button>
													<button type="button" class="report">답글달기</button>
													<button type="button" class="report">신고</button>
												</div></li>

										</ul>
										<div class="page">1 2 3 4</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>


		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>