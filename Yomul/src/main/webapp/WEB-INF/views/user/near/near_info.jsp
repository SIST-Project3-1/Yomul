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
	<div id="near_info" class="near-info-content">
		<div class="near-info-left">
			<!--  타이틀  -->
			<div class="near-info-left-title">
				<h6>카테고리</h6>
				<h3>타이틀</h3>
			</div>
			
			<!--  이미지  -->
			<div class="near-info-left-img">
				<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
			</div>
			
			<!--  내용  -->
			<div class="near-info-left-content">
				<p>
					내용<br><br><br><br><br>
				</p>
				<div>
					<label>2021년 07월 05일 23:22</label>
					<label class="near-info-point">·</label>
					<label>조회</label>
					<label class="near-info-point">·</label>
					<button type="button" class="near-info-report">신고</button>
				</div>
			</div>
			<div class="near-info-line"></div>
			
			<!--  댓글  -->
			<div class="near-info-chat">
				<div class="near-info-chat-title">
					<h3>댓글</h3><h3>1</h3>
				</div>
				<div class="near-info-chat-writer">
					<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
					<input type="text" placeholder="댓글을 남겨 보세요.">
				</div>
				<div class="near-info-chat-content">
				<% for(int i=0;i<2;i++){ %>
					<div>
						<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
						<div>
							<div>
								<label>작성자</label>
								<span>댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다
								댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다댓글입니다</span>
							</div>
							<div>
								<label>1시간 전</label>
								<label class="near-info-point">·</label>
								<button type="button" class="near-info-chat-like">좋아요</button>
								<label class="near-info-point">·</label>
								<button type="button" class="near-info-chat-like">답글달기</button>
								<label class="near-info-point">·</label>
								<button type="button" class="near-info-chat-report">신고</button>
							</div>
						</div>
					</div>
				<% } %>
				</div>
			</div>
			
			<!-- 페이징  -->
			<div class="near-info-page">
				<p>1 2 3 4</p>
			</div>
		</div>
		
		<!--  작성자 정보  -->
		<div class="near-info-right">
			<div class="near-info-right-writer">
				<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
				<label>작성자</label>
				<button type="button"><p>+</p>단골<p>22</p></button>
			</div>
			<div class="near-info-right-price">
				<label>가격</label>
				<label>원</label>
			</div>
			<button type="button" class="near-info-inquiry">채팅문의</button>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>