<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<input type="hidden" id="article_no" value="${vo.no }">
	<div id="near_info" class="near-info-content">
		<div class="near-info-left">
			<!--  작성자 정보  -->
			<div class="reviews-info-writer">
				<div class="">
					<img src="http://localhost:9000/yomul/image/${vo.profileImg }">
					<label>${vo.nickname }</label>
				</div>
			</div>
			
			<!--  내용  -->
			<div class="near-info-left-content">
				<p>${vo.content }</p>
				<div>
					<label>${vo.vdate }</label>
					<label class="near-info-point">·</label>
					<label>조회 ${vo.hits }</label>
					<label class="near-info-point">·</label>
					<button type="button" class="btn_report near-info-report" value="${vo.no }">신고</button>
				</div>
			</div>
			<div class="near-info-line"></div>
			
			<!--  댓글  -->
			<c:import url="near_comment_area.jsp" />
		</div>
		
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>