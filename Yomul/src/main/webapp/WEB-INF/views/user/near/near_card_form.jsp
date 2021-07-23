<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<script>
	$(document).ready(function(){
			$('searchForm').submit();			
	});
</script>

<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>
	<!-- 검색창 -->
	<div class="near-home-search">
		<form class="form-inline ml-auto" id="searchForm" method="GET" action="near_card_form?word=${word }">
			<label for="search_bar" class="bi bi-search"
				style="position: relative; z-index: 20; left: 23px;"></label>
			<div class="input-group flex-nowrap">
				<input class="form-control mr-sm-2 pl-4" type="search"
					placeholder="주변 가게를 찾아보세요" size="60" id="searchInput" name="word" value="${word }" >
			</div>
		</form>
	</div>

	<!--  BODY  -->
	<div id="near_card_form" class="near-card-form-content">
		<c:forEach var="vo" items="${list }">
			<div class="near-card-form-card">
				<div class="card" style="width: 18rem;">
						<img src="/yomul/upload/${vo.mainFile }">
					<div class="card-body">
						<a href="near_info/${vo.no }">
							<h5 class="card-title">${vo.title }</h5>
							<p class="card-text">${vo.content }</p>
						</a>
					</div>
					<div class="near-card-form-bottom">
						<label>좋아요 13</label> <label>·</label> <label>댓글 44</label>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>