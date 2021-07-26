<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 검색</title>
<!-- HEAD -->
<%@ include file="../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="header.jsp"%>

	<!--  BODY  -->
	<section id="total_search" class="mt-3 container">

		<!-- 물건 목록 -->
		<div class="near-home-news">
			<div>
				<h3>물건 목록</h3>
				<a href="/yomul/product_list?search=${target}">전체보기 ></a>
			</div>
			<div id="near_card_form" class="near-card-form-content" style="width: 100%;">
				<c:forEach var="product" begin="0" end="2" items="${productList}" varStatus="status">
					<div class="near-card-form-card d-inline-block">
						<div class="card" style="width: 18rem;">
							<img src="/yomul/upload/${product.img}" class="card-img-top">
							<div class="card-body">
								<a href="/yomul/product_info?no=P49">
									<h5 class="card-title">${product.title }</h5>
									<p class="card-text">${product.content }</p>
								</a>
							</div>
							<div class="near-card-form-bottom">
								<label>좋아요 ${product.likes }</label>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- 내 근처 소식 목록-->
		<div class="near-home-news">
			<div>
				<h3>내 근처 소식</h3>
				<a href="/yomul/near_card_form?word=${target}">전체보기 ></a>
			</div>
			<c:forEach var="near" begin="0" end="2" items="${nearList}" varStatus="status">
				<div class="near-home-news-content">
					<table>
						<tr>
							<td>
								<img src="/yomul/upload/default.jpg">
							</td>
							<td>
								<div class="near-home-news-title">
									<a href="near_info">
										<h5>${near.title }</h5>
										<p>${near.content }</p>
									</a>
									<div class="near-home-news-writer">
										<img src="/yomul/upload/default.jpg">
										<label>작성자</label>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>
</body>
</html>