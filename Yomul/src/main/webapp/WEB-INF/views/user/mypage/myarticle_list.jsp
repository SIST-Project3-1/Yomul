<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글</title>
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
		$("#mypage_header_myarticle_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="myarticle_list" class="mt-3 container">
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<h4>도배를 해야할까요...</h4>
			<p>벽걸이 에어컨하다가 뗏은데 저렇게 다 벗겨져서요 액자같은거두면 괜찮을까요? 복층집이에요 이층이고어떤액자가 좋을까요</p>
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.07.05 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_comment_count">댓글 0</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
		</a>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<h4>철제침대사이즈</h4>
			<p>혹시 이런침대프레임 더블사이즈 보신적 잇으실까요ㅠㅠ 오늘의 집에서는 아무리 찾아도 없네요,,</p>
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.07.04 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_comment_count">댓글 0</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
		</a>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<h4>세면대 리모델링 문의</h4>
			<p class="text-truncate">지금 사용중인 세면대가 상판 아래쪽에 설치가 되어 있어서 너무 불편하고 물도 많이 튀어서 관리도 너무 어렵네요세면대만 교체하고 싶은데 견적이 많이 나올까요?</p>
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.07.03 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_comment_count">댓글 0</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
		</a>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<h4>식탁이랑 의자 컬러 좀 봐주세요</h4>
			<p class="text-truncate">얼마전에 홈테이블데코페어에서 홀프레츠 식탁보고 반해서 구매하려고 하는데 색상이 너무 고민되요 ㅠㅠ 몇개월 뒤에 입주할 아파트 주방 모습인데요,아이보리와 블랙 컬러 중 어떤 색상이 더 잘 어울릴까요? 식탁 의자는 위 사진에 있는 의자로 하려는데,아이보리, 그레이, 카멜 3가지 색상이 있더라구요~위 조합</p>
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.07.02 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_comment_count">댓글 0</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
		</a>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<h4>어떤색 패브릭이 잘 어울릴까요?</h4>
			<p class="text-truncate">집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요</p>
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.07.01 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_comment_count">댓글 0</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
		</a>
		<hr>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>