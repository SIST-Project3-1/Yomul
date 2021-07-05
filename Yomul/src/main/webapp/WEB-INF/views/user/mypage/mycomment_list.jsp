<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- MYPAGE HEADER -->
	<%@include file="mypage_header.jsp"%>
	<script type="text/javascript">
		$("#mypage_header_myarticle").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#mypage_header_mycomment_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="mycomment_list" class="container mt-3">
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.30 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.29 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.28 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.27 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.26 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.25 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.24 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.23 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.22 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.21 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.20 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<a class="btn btn-sm text-danger ml-auto" href="#">삭제</a>
		</div>
		<hr>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>