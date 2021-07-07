<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="nav nav-tabs nav-justified mt-2">
	<li class="nav-item"><a id="vendor_header_profile" class="nav-link text-muted" href="/yomul/vendor_profile_info">프로필</a></li>
	<li class="nav-item"><a id="vendor_header_news" class="nav-link text-muted" href="/yomul/vendor_news_list">소식</a></li>
	<li class="nav-item"><a id="vendor_header_reviews" class="nav-link text-muted" href="/yomul/vendor_reviews">후기</a></li>
</ul>

<c:choose>
	<c:when test="${headerType =='profile' }">
		<ul class="nav nav-tabs nav-justified mt-2">
			<li class="nav-item"><a id="vendor_header_profile_info" class="nav-link text-muted" href="/yomul/vendor_profile_info">프로필 보기</a></li>
			<li class="nav-item"><a id="vendor_header_profile_update" class="nav-link text-muted" href="/yomul/vendor_profile_update">프로필 수정</a></li>
			<li class="nav-item"><a id="vendor_header_profile_follow" class="nav-link text-muted" href="/yomul/vendor_profile_follow">단골</a></li>
		</ul>
	</c:when>
	<c:when test="${headerType == 'news' }">
		<ul class="nav nav-tabs nav-justified mt-2">
			<li class="nav-item"><a id="vendor_header_news_list" class="nav-link text-muted" href="/yomul/vendor_news_list">소식 목록</a></li>
			<li class="nav-item"><a id="vendor_header_news_insert" class="nav-link text-muted" href="/yomul/vendor_news_insert">소식 작성</a></li>
			<li class="nav-item"><a id="vendor_header_news_update" class="nav-link text-muted" href="/yomul/vendor_news_update">소식 수정</a></li>
		</ul>
	</c:when>
</c:choose>
