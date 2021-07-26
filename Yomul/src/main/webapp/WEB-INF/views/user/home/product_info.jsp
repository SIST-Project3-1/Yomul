<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.title}</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<link rel="stylesheet" href="/yomul/resources/css/product_info.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_like").on("click", function(e) {
			$.ajax({
				url : "/yomul/product_like",
				method : "GET",
				data : {
					"article_no" : '${product.no}',
					"member_no" : '${sessionScope.member.no}'
				},
				success : function(result) {
					if (result == 2) {
						location.href = "/yomul/product_info?no=${product.no}";
					} else if (result == 3) {
						location.href = "/yomul/product_info?no=${product.no}";
					} else {
						alert("좋아요 처리 실패");
					}
				}
			});
			return false;
		});

		$("#btn_favorite").on("click", function(e) {
			$.ajax({
				url : "/yomul/product_favorite",
				method : "GET",
				data : {
					"product_no" : '${product.no}',
					"member_no" : '${sessionScope.member.no}'
				},
				success : function(result) {
					if (result == 2) {
						location.href = "/yomul/product_info?no=${product.no}";
					} else if (result == 3) {
						location.href = "/yomul/product_info?no=${product.no}";
					} else {
						alert("찜 처리 실패");
					}
				}
			});
			return false;
		});

		$("#btn_chat").on("click", function(e) {
			$.ajax({
				url : "/yomul/product_chat",
				method : "GET",
				data : {
					"chat_to" : '${product.seller}',
					"content" : "${product.title} 구매합니다."
				},
				success : function(result) {
					if (result == 1) {
						location.href = "/yomul/chat";
					} else {
						alert("찜 처리 실패");
					}
				}
			});
			return false;
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<form>

		<div class="pi_contaner">
			<div class="pi_contentWarp">
				<div class="pi_haeder">
					<div class="pi_category">
						<p>${product.category_content}</p>
					</div>
					<h1 class="pi_htitle">${product.title}</h1>
					<div class="pi_hbottom">
						<a class="pi_user" href="#">
							<div class="pi_userimg">
								<img src="/yomul/upload/${profileImg.savedFilename != null ? profileImg.savedFilename : 'default.jpg'}" style="max-width: 100%;">
							</div>
							<div class="pi_username">${product.seller_nickname}</div>
							<div class="pi_userhometwon">${product.location}</div>
						</a>
						<div class="mo_a_bo_gi">
							<button class="mo_a_bo_gibtn">모아보기</button>

							<c:if test="${sessionScope.member.no == product.seller}">
								<button id="deleteProduct" type="button" class="mo_a_bo_gibtn">글 삭제</button>
								<script type="text/javascript">
									$("#deleteProduct").on("click", function() {
										$.ajax({
											url : "/yomul/product_delete?no=${product.no}",
											method : "GET",
											success : function(result) {
												if (result == 1) {
													alert("글을 삭제했습니다.");
													location.href = "/yomul/product_list";
												} else {
													alert("삭제에 실패했습니다.");
												}
											}
										});
									});
								</script>
							</c:if>
						</div>
					</div>
				</div>
				<!--pi_haeder-->

				<div class="contentW">
					<div class="pi_imgbolck">
						<c:forEach var="img" items="${productImgList}">
							<div class="pi_imgbolck2">
								<img src="/yomul/upload/${img.savedFilename}" alt="">
							</div>
						</c:forEach>
					</div>
					<p>${product.content}</p>
				</div>
			</div>
			<!--pi_contentWarp-->


			<div class="pi_sidebar">
				<div class="pi_sticky">
					<div class="pi_stickyCover">
						<div class="content-detail-sidebar">

							<!-- 좋아요 버튼 -->
							<c:choose>
								<c:when test="${sessionScope.member != null }">
									<button id="btn_like" class="content-detail-sidebar-button content-detail-sidebar-button--white" aria-pressed="false" title="좋아요" type="button">
										<c:choose>
											<c:when test="${isLiked}">
												<svg class="content-detail-sidebar__icon-blue icon" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
													preserveAspectRatio="xMidYMid meet">
									<path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path>
								</svg>
											</c:when>
											<c:when test="${!isLiked}">
												<svg class="content-detail-sidebar__icon-inactive icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
									<path fill="currentColor"
														d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z"></path>
								</svg>
											</c:when>
										</c:choose>
									</button>
								</c:when>
								<c:when test="${sessionScope.member == null }">
									<button onclick="alert('로그인 후 이용해주세요');" class="content-detail-sidebar-button content-detail-sidebar-button--white" aria-pressed="false" title="좋아요" type="button">
										<svg class="content-detail-sidebar__icon-inactive icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
									<path fill="currentColor"
												d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z"></path>
								</svg>
									</button>
								</c:when>
							</c:choose>
							<span class="content-detail-sidebar-counter">${likeCount}</span>

							<!-- 찜 버튼 -->
							<c:choose>
								<c:when test="${sessionScope.member != null }">
									<button id="btn_favorite" class="content-detail-sidebar-button content-detail-sidebar-button--white" aria-pressed="false" title="스크랩" type="button">
										<c:choose>
											<c:when test="${isFavorite}">
												<svg class="content-detail-sidebar__icon-blue icon" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
													preserveAspectRatio="xMidYMid meet">
									<path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">									</path>
								</svg>
											</c:when>
											<c:when test="${!isFavorite}">
												<svg class="content-detail-sidebar__icon-inactive icon" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" preserveAspectRatio="xMidYMid meet">
									<path fill-rule="evenodd" transform="matrix(1 0 0 -1 0 23.033)"
														d="M12.943 6.342a2 2 0 0 1-1.886 0L3 2.032V20.5a.5.5 0 0 0 .5.5h17a.5.5 0 0 0 .5-.5V2.033l-8.057 4.309zm-.471-.882l8.056-4.31A1 1 0 0 1 22 2.034V20.5a1.5 1.5 0 0 1-1.5 1.5h-17A1.5 1.5 0 0 1 2 20.5V2.033a1 1 0 0 1 1.472-.882l8.056 4.31a1 1 0 0 0 .944 0z">									</path>
								</svg>
											</c:when>
										</c:choose>
									</button>
								</c:when>
								<c:when test="${sessionScope.member == null }">
									<button class="content-detail-sidebar-button content-detail-sidebar-button--white" aria-pressed="false" title="스크랩" type="button">
										<svg class="content-detail-sidebar__icon-inactive icon" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" preserveAspectRatio="xMidYMid meet">
									<path fill-rule="evenodd" transform="matrix(1 0 0 -1 0 23.033)"
												d="M12.943 6.342a2 2 0 0 1-1.886 0L3 2.032V20.5a.5.5 0 0 0 .5.5h17a.5.5 0 0 0 .5-.5V2.033l-8.057 4.309zm-.471-.882l8.056-4.31A1 1 0 0 1 22 2.034V20.5a1.5 1.5 0 0 1-1.5 1.5h-17A1.5 1.5 0 0 1 2 20.5V2.033a1 1 0 0 1 1.472-.882l8.056 4.31a1 1 0 0 0 .944 0z"></path>
								</svg>
									</button>
								</c:when>
							</c:choose>
							<span class="content-detail-sidebar-counter">${favoriteCount }</span>

							<hr class="content-detail-sidebar-hr">

							<!-- 채팅 -->
							<c:choose>
								<c:when test="${sessionScope.member != null }">
									<button id="btn_chat" class="content-detail-sidebar-button content-detail-sidebar-button--gray" aria-pressed="false" title="채팅" type="button">
										<svg class="icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
									<path fill="currentColor" fill-rule="nonzero"
												d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z"></path>
								</svg>
									</button>
								</c:when>
								<c:when test="${sessionScope.member == null }">
									<button onclick="alert('로그인 후 이용해주세요');" class="content-detail-sidebar-button content-detail-sidebar-button--gray" aria-pressed="false" title="채팅" type="button">
										<svg class="icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
									<path fill="currentColor" fill-rule="nonzero"
												d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z"></path>
								</svg>
									</button>
								</c:when>
							</c:choose>

							<div class="drop-down card-detail-floating__action-wrap card-detail-floating__action-share">

								<!-- 공유 -->
								<c:if test="${sessionScope.member.authority == 'ADMIN'}">
									<button id="deleteProduct" type="button" class="">글 삭제</button>
									<script type="text/javascript">
										$("#deleteNear").on("click", function() {
											$.ajax({
												url : "/yomul/admin_product_delete?no=${vo.no}",
												method : "GET",
												success : function(result) {
													if (result == 1) {
														alert("글을 삭제했습니다.");
														location.href = "/yomul/product_list";
													} else {
														alert("삭제에 실패했습니다.");
													}
												}
											});
										});
									</script>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--pi_contaner-->



	</form>
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>