<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="border-bottom navbar navbar-expand-lg bg-white navbar-light sticky-top">
	<a class="navbar-brand" href="/yomul/"> 요물 </a>

	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/yomul/product_list">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="/yomul/town_list">동네생활</a></li>
			<li class="nav-item"><a class="nav-link" href="/yomul/near_home">내 근처</a></li>
		</ul>
	</div>

	<form class="form-inline ml-auto">
		<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 10; left: 23px;"> </label>
		<div class="input-group flex-nowrap">
			<input id="search_bar" class="form-control mr-sm-2 pl-4" type="search" placeholder="요물 통합검색" aria-label="Search">
		</div>
	</form>

	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/yomul/login">로그인</a></li>
		<li class="nav-item"><a class="nav-link" href="/yomul/join">회원가입</a></li>
	</ul>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="#"><h5 class="bi bi-bell my-0"></h5></a></li>
		<li class="nav-item"><a class="nav-link" href="/yomul/myprofile_info"><h5 class="bi bi-person-circle my-0"></h5></a></li>
	</ul>
	<div class="dropdown">
		<button type="button" class="btn btn-yomul dropdown-toggle" data-toggle="dropdown">글쓰기</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">Link 1</a> <a class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item" href="#">Link 3</a>
		</div>
	</div>
</nav>

<!-- 헤더 작성 후 참고 예정 -->