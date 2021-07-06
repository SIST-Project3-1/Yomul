<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<link rel="stylesheet" href="http://localhost:9000/yomul/css/near.css">
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<div id="near_home" class="near-home-content">
		<!-- 검색창 -->
		<div class="near-home-search">
			<form class="form-inline ml-auto">
				<label for="search_bar" class="bi bi-search" style="position:relative; z-index:20; left:23px;"></label>
				<div class="input-group flex-nowrap">
					<input class="form-control mr-sm-2 pl-4" type="search" placeholder="주변 가게를 찾아보세요" size="60">
				</div>
			</form>	
		</div>

		<!-- 키워드 -->
		<div class="near-home-keyword">
			<h3>키워드</h3>
			<div>
				<c:forEach var="keyword" items="${keyword}">
					<label>${keyword }</label>
				</c:forEach>
			</div>
		</div>

		<!-- 내 근처 소식 -->
		<div class="near-home-news">
			<div class="near-home-news-title">
				<h3>내 근처 소식</h3>
				<a href="#">전체보기 ></a>
			</div>
			<% for(int i=0;i<3;i++){ %>
			<div class="near-home-news-content">
				<table>
					<tr>
						<td>
							<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
						</td>
						<td>
							<div>
								<h5>타이틀</h5>
								<p>내용</p>
								<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
								<label>작성자</label>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<% } %>
		</div>

		<!-- 이웃들의 추천가게 -->
		<div class="near-home-neighbor">
			<h3>이웃들의 추천가게</h3>
			<% for(int i=0;i<2;i++){ %>
			<div class="near-home-neighbor-content">
				<div>
					<img src="http://localhost:9000/yomul/image/이미지준비중.jpg" style="margin-right:5px">
					<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
				</div>
				<div>
					<h5>타이틀</h5>
					<p>내용</p>
					<label>후기</label>
					<label>·</label>
					<label style="color:gray">단골</label>
				</div>
				<div>
					<p>고객명</p>
					<p>후기</p>
				</div>
			</div>
			<% } %>
		</div>
		
		<!-- 비즈프로필 -->
		<div class="near-home-vendor">
			<h3>사장님이신가요? 단골을 모아보세요!</h3>
			<a href="vendor_signup.jsp">비즈프로필 만들기 ></a>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>