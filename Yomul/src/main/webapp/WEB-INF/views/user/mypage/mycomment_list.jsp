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
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="23" data-comment_content="집 수리 끝나면 곧 입주하는데 커튼, 침구 등 어떤색이 어울릴지 잘 모르겠습니다..조언 부탁 드릴게요">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">테라스(야외)는 아래 바닥? 타일? 같은 것도 깔고 해서 청소랑 관리는 어떻게 하시는지 궁금해요:)</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.29 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="22" data-comment_content="이런집이 딱 좋은 것 같아요~ 잘 봤습니다 :)">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">우왕 넘 이뻐요 놀러가고 싶은 집이네요!</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.28 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="21" data-comment_content="우와 4층을 다 쓰다니 진ㅁ자 대박..">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">예뿌게 봐주셔서 너무나 감사드립니다🤭💛💛</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.27 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="20" data-comment_content="집안에 카페랑 루프탑바까지 모두 모아놓은것같아요 !🤭">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">너무예쁜집 ❤️‍🔥</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.26 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="19" data-comment_content="집안 분위기가 따뜻하고 좋은거 같아요ㅎㅎㅎ나중에 신혼집 꾸밀때 참고할께요">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">우와 진짜 하나하나 세심하면서 정성스러운 공간이라는게 느껴지구요, 서울에 있는 협소주택이라니 공간들이 개성있고 좋은것 같아요! 정말 따뜻한집이네요🤍</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.25 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="18" data-comment_content="소품하나하나가 느무느무 이뻐요">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">쇼파가 넘예쁘네요 고급져요 ㅎㅎ</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.24 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="17" data-comment_content="인테리어 소품만으로도 이런 느낌이 나네요 가구들 다 예뻐요">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">분위기너무좋아요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.23 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="16" data-comment_content="뷰가 기가막혀요.... 🥺🥺 저도 요런 인테리어 하고싶네용 ㅎㅎ 잘봤습니다 ❣️">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">요거 물건입니다!! 저의 첫 에프 아이닉! 그동안 에프 없이 잘 살았는데 굳이 에프 살 필요 있나.. 하고 구입 생각 없었는데 후기들도 너무 좋고, 일반 에프가 아니라 통돌이, 로세리티 등등의 기능도 있어서 혹해서 샀습니다! 구입 후에 설명서에 나온대로 15분간 조리기구를 데워 코팅을 닦아내고 바로 통돌이로 콩볶기 시작! 처음에 통돌이 끼우는 방법을 몰라서 왜 얘가 안돌아가지 하다가 제대로 끼우니 도로록 도로록 콩 볶아지는 소리에 고소한 향이??? 평소에 검은콩차 먹으려고 약불에 계속 덖어주는게 엄청 번거롭고 시간이 걸렸는데 아이닉으로는 통돌이에 넣고 돌려주기만 하면 끝! 원래 에프보다 과일건조기 사고 싶었는데 아이닉은 과일건조도 되니?? 요리할때 쓰는 에프지만 차를 좋아하는 저는 콩차, 건조과일차 등등 만들어먹을 예정입니다??‍♀️ 통돌이 이용하면 커피도 볶을수 있을 것 같아 생원두 사다가 도전 예정이에요ㅋㅋㅋㅋ 아이닉 너무 좋아요!!!</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.22 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="15" data-comment_content="언박싱하려고 집에 후다닥 왔어요. 예상보다는 덜 커요. 집에 1인용 냉장고가 있는데 그 옆에 놓으니 아담하네요.연마제 닦으려니 모서리랑 열판?에서만 좀 뭍어나오는 정도고 네이버 리뷰 봤을때 기름받이에 필름있는거 모르고 그냥 돌렸다는 글이 몇 있었는데 기름받이 필름이 파란색이고 스티커도 붙어있어서 저는 잘 떼어냈어요. 고객 리뷰를 보고 개선을 하는 기업 제품을 구매했다는 생각에 만족도가 굉장히 크게 상승했습니다. 보조용품들도 사용하다가 손이 베일것같은 마감이 아니고 다치지않게 신경써서 마감되어있어 평소 설거지를 허겁지겁하는 엄마가 쓰기에 안전할것같아요. 사실 이 부분은 제가 한번 다 갈아야할까 고민했던건데 배송 온 그대로 사용하려구요. 문은 스텐이 아니라는 글 보고 구매 망설이기는 했으나 스텐을 가장 많이 사용하는 제품 중 가장 평이 좋은 제품이라 구매했어요. 사용하다가 바꾸고 싶을 즈음 아이닉에서 더 좋은 제품 출시할테니 그때 또 구매하려구요. 일주일 내내 고민하고 비교하면서 고른 제품인데 마음에 들어서 신이 나네요.ㅎㅎ잘쓸게요">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">1인가구여서 너무 오버해서 구매하는 것 아닌가 싶었는데 너무 사고싶어서 걍 샀거든요 며칠 써본결과 진짜 완전 만족해요 1. 깨끗함 스테인레스여서 믿음이 가고 처음에 청소할때 묻어나오는게 거의 없었어서 좋았어요 청소하기도 쉬워요 굿굿 2. 적은 소리와 발열 옛날에 샀던 작은 용량의 에프는 가끔 터질것처럼.. 무섭게 작동해서 조마조마했었는데 소리가 작아서 너무 좋아요 발열도 적어요 진짜 이점에서 제일 만족 3. 디자인 버튼도 다 직관적이고 예뻐요(조작이 어려우면 사용설명서 붙들고 있어야 하는데 전혀 그런게 없어요) 스마트한 디자인 b 4. 실용성 다양한 조리도구로 꼬치도 해먹고 삼겹살구이도 해서 먹어봤는데 활용성이 높은 것 같아요 음식 뒤집는것도 진짜 쉽고 전구버튼 누르면 안이 훤히 보여서 좋아요</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.21 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="14" data-comment_content="사자마자 올려야하는데 매일 에어프라이어로 음식해먹느라 이제 리뷰 올립니다. 이거 정말 예전에 쓰던 에어프라이어랑은 퀄리티가 다르네요. 전에는 냉동감자만 해먹었다면 이건 생감자로 감자스틱 해먹을수 있어요. 전엔 치킨너겟만 만들었다면 이건 돈가스 구울 수 있어요. 전엔 1인분씩 만들었다면 아이닉은 3인분씩 만들수 있어요. 온갖 야채랑 닭가슴살 구워서 매일 다이어트식으로 먹어요. 주말엔 삼겹살이랑 통닭구이 해먹구요. 감자스틱이랑 토마토, 소세지구워서 아이 간식해요. 결론적으로 외식은 전혀 하지 않습니다. 매일매일 세척하니 세척이 그리 어렵지않아요. 저는 오히려 시원스레 닦을수있어 오븐형이 더 편하네요. 오븐형 에어프라이어중 아이닉을 선택한 이유. 1. 올스텐 2. 가장 큰 용량 가전은 무조건 커야하는거라고 신랑이 그래서 선택했는데 안샀으면 어쨌을까 싶어요. 갑자기 쉐프가 된 기분입니다.">삭제</button>
		</div>
		<hr>
		<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">
			<p class="text-truncate">에어프라이어 살려고 여기저기 많이 둘러보고 후기 들과 여러회사의 에프를 비교해 보면서 평가한 비평글들도 본후, 올 스텐으로 되어있고, 상하에 전기코일이 있는 D회사의 제품도 있었지만 가격+디자인등을 고려해서 아이오닉으로 결정하고 본품을 주문.내용은 배송을 받고 박스를 오픈.같이온 기구들을 점검.제일 먼저 곰국냄비에 물 +식초를 붓고.끓으면 불을끄고,내용물들을 모두 넣고 열탕한후 꺼내서 식은후에 종이냅킨으로 물기를 싹 걷어내면 반짝반짝 윤이나게 소독하고 바로 생닭850g 허브소금.후추.뿌린후 냉장고에서 3시간 숙성후, 로티세리에 꿰어서 에프에 바로넣고 치킨 클릭. 와~환상적입니다.노티세리가 돌아가면서 35분만에완성. 속까지 완전 잘 익어서 남(의)편과 정말 감동하면서 맛있게 먹었네요^^ 10번만 이렇게 해먹으면 에프값은 공짜~ 다른 음식도 여러가지 해보려고 해요 ~^^</p>
		</a>
		<div class="d-flex">
			<span id="article_author">Hwisaek</span>
			<span class="border mx-2"></span>
			<span id="article_date">2021.06.20 13:45</span>
			<span class="border mx-2"></span>
			<span id="article_hit_count">조회 0</span>
			<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="13" data-comment_content="안녕하세요 고객님">삭제</button>
		</div>
		<hr>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="comment_delete_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><span id="modal_content_no"></span>번 댓글을 삭제하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-yomul" id="btn_comment_delete">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#comment_delete_modal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); // Button that triggered the modal
			var comment_no = button.data('comment_no'); // Extract info from data-* attributes
			var comment_content = button.data('comment_content');
			var modal = $(this);
			modal.find('#modal_content_no').text(comment_no);
		});
	</script>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>