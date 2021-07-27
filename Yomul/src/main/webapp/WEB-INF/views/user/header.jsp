<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="border-bottom navbar navbar-expand-md bg-white navbar-light sticky-top">
	<a class="navbar-brand" href="/yomul/">
		<img src="/yomul/image/logo.png">
	</a>

	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/yomul/product_list">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/yomul/near_home">내 근처</a>
			</li>
		</ul>
	</div>

	<!-- 통합 검색창 -->
	<form name="total-search" class="form-inline ml-auto" action="total_search" method="GET">
		<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 10; left: 23px;"> </label>
		<div class="input-group flex-nowrap">
			<input id="search_bar" class="form-control mr-sm-2 pl-4" type="search" name="target" placeholder="요물 통합검색" aria-label="Search" value="${target!=null?target: null}" required>
			<button type="submit" class="d-none"></button>
		</div>
	</form>

	<ul class="navbar-nav">
		<c:choose>
			<c:when test="${sessionScope.member == null }">
				<li class="nav-item">
					<a class="nav-link" href="/yomul/login">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/yomul/join">회원가입</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="nav-item">
					<a class="nav-link" href="/yomul/logout">로그아웃</a>
				</li>
			</c:otherwise>
		</c:choose>

		<c:if test="${sessionScope.member.authority == 'ADMIN' }">
			<li class="nav-item">
				<a class="nav-link" href="/yomul/admin">ADMIN</a>
			</li>
		</c:if>
	</ul>

	<ul class="navbar-nav">

		<!-- 채팅 알림 -->
		<li class="nav-item">
			<a class="nav-link" href="/yomul/chat">
				<h5 class="bi bi-chat-dots my-0"></h5>
			</a>
		</li>

		<!-- 내 프로필 -->
		<li class="nav-item">
			<a class="nav-link" href="/yomul/mypage/myprofile_info">
				<h5 class="bi bi-person-circle my-0"></h5>
			</a>
		</li>
	</ul>
	<div class="dropdown">
		<button type="button" class="btn btn-yomul dropdown-toggle" data-toggle="dropdown">글쓰기</button>
		<div class="dropdown-menu dropdown-menu-right">
			<a class="dropdown-item" href="/yomul/product_write">물건 등록</a>
			<a class="dropdown-item" href="/yomul/near_write">내 근처</a>
		</div>
	</div>
</nav>