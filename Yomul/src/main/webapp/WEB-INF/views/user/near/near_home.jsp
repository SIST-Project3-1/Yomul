<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<div id="near_home" class="near-home-content">
		<!-- 검색창 -->
		<div class="near-home-search">
			<form class="form-inline ml-auto">
				<label for="search_bar" class="bi bi-search" style="position:relative; z-index:20; left:23px;"></label>
				<div class="input-group flex-nowrap">
					<input class="form-control mr-sm-2 pl-4" type="search" placeholder="주변 가게를 찾아보세요" size="60" required>
				</div>
			</form>	
		</div>

		<!-- 키워드 -->
		<div class="near-home-keyword">
			<h3>키워드</h3>
			<div>
				<c:forEach var="keyword" items="${keyword}">
					<a href="/yomul/near_card_form"><label>${keyword }</label></a>
				</c:forEach>
			</div>
		</div>

		<!-- 내 근처 소식 -->
		<div class="near-home-news">
			<div>
				<h3>내 근처 소식</h3>
				<a href="/yomul/near_card_form">전체보기 ></a>
			</div>
			<c:forEach var="vo" items="${list }">
			<div class="near-home-news-content">
				<table>
					<tr>
						<td>
							<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
						</td>
						<td>
							<div class="near-home-news-title">
								<a href="near_info/${vo.no }">
									<h5>${vo.title }</h5>
									<p>${vo.content }</p>
								</a>
								<div class="near-home-news-writer">
									<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
									<label>${vo.writer }</label>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div>

		<!-- 이웃들의 추천가게 -->
		<div class="near-home-neighbor">
			<h3>이웃들의 추천가게</h3>
			<% for(int i=0;i<2;i++){ %>
			<div class="near-home-neighbor-content">
				<div>
					<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
					<a href="/yomul/vendor_profile_info">업체명입니다</a>
				</div>
				<div>
					<p>정보입니다정보입니다정보입니다정보입니다정보입니다정보입니다...</p>
					<label>후기 5</label>
					<label>·</label>
					<label style="color:gray">단골 10</label>
				</div>
				<div class="near-home-neighbor-review">
					<p>단골 닉네임</p>
					<a href="/yomul/reviews_info">
						<p>후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다...</p>
					</a>
				</div>
			</div>
			<% } %>
		</div>
		
		<!-- 업체 프로필 -->
		<div class="near-home-vendor">
			<h3>사장님이신가요? 단골을 모아보세요!</h3>
			<a href="vendor_signup">비즈 프로필 만들기 ></a>
		</div>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>
