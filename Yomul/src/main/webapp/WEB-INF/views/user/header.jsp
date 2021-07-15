<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="border-bottom navbar navbar-expand-md bg-white navbar-light sticky-top">
	<a class="navbar-brand" href="/yomul/"> 요물 </a>

	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/yomul/product_list">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/yomul/town_list">동네생활</a>
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
		<li class="nav-item">
			<a class="nav-link" href="/yomul/login">로그인</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/yomul/logout">로그아웃</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/yomul/join">회원가입</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/yomul/admin">ADMIN</a>
		</li>
	</ul>

	<ul class="navbar-nav">

		<!-- 알림창 -->
		<li class="nav-item">
			<div class="dropdown mt-2 px-2">
				<a role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<h5 class="bi bi-bell my-0">
						<span class="badge badge-yomul rounded-circle" style="position: absolute; left: 1.3em; bottom: 0.9em; font-size: 65%;">6</span>
					</h5>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
					<p class="dropdown-item">작성한 게시글에 댓글이 등록되었습니다.</p>
					<div class="dropdown-divider"></div>
					<p class="dropdown-item">알라아아라라망알람알람알람님이 채팅을 보냈습니다.</p>
					<div class="dropdown-divider"></div>
					<p class="dropdown-item">등록한 물건이 누군가에게 예약됐습니다.</p>
					<div class="dropdown-divider"></div>
					<p class="dropdown-item">작성한 게시글에 댓글이 등록되었습니다.</p>
					<div class="dropdown-divider"></div>
					<p class="dropdown-item">알라아아라라망알람알람알람님이 채팅을 보냈습니다.</p>
					<div class="dropdown-divider"></div>
					<p class="dropdown-item">등록한 물건이 누군가에게 예약됐습니다.</p>
					<div class="dropdown-divider"></div>
				</div>
			</div>
		</li>

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
			<a class="dropdown-item" href="/yomul/town_write">동네생활</a>
			<a class="dropdown-item" href="/yomul/near_write">내 근처</a>
		</div>
	</div>
</nav>