<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="nav nav-tabs nav-justified mt-2">
	<li class="nav-item"><a id="mypage_header_myprofile" class="nav-link text-muted" href="/yomul/mypage/myprofile_info">프로필</a></li>
	<li class="nav-item"><a id="mypage_header_order_list" class="nav-link text-muted" href="/yomul/mypage/buy_list">나의 쇼핑</a></li>
	<li class="nav-item"><a id="mypage_header_myarticle" class="nav-link text-muted" href="/yomul/mypage/myarticle_list">나의 글</a></li>
</ul>

<c:choose>
	<c:when test="${headerType =='myprofile' }">
		<ul class="nav nav-tabs nav-justified mt-2">
			<li class="nav-item"><a id="mypage_header_myprofile_info" class="nav-link text-muted" href="/yomul/mypage/myprofile_info">프로필 보기</a></li>
			<li class="nav-item"><a id="mypage_header_myprofile_update" class="nav-link text-muted" href="/yomul/mypage/myprofile_update">프로필 수정</a></li>
		</ul>
	</c:when>
	<c:when test="${headerType == 'buy_list' }">
		<ul class="nav nav-tabs nav-justified mt-2">
			<li class="nav-item"><a id="mypage_header_buy_list" class="nav-link text-muted" href="/yomul/mypage/buy_list">구매내역</a></li>
			<li class="nav-item"><a id="mypage_header_sell_list" class="nav-link text-muted" href="/yomul/mypage/sell_list">판매내역</a></li>
			<li class="nav-item"><a id="mypage_header_favorite_list" class="nav-link text-muted" href="/yomul/mypage/favorite_list">찜 목록</a></li>
		</ul>
	</c:when>
	<c:when test="${headerType == 'myarticle' }">
		<ul class="nav nav-tabs nav-justified mt-2">
			<li class="nav-item"><a id="mypage_header_myarticle_list" class="nav-link text-muted" href="/yomul/mypage/myarticle_list">내가 쓴 글</a></li>
			<li class="nav-item"><a id="mypage_header_mycomment_list" class="nav-link text-muted" href="/yomul/mypage/mycomment_list">내가 쓴 댓글</a></li>
		</ul>
	</c:when>
</c:choose>
