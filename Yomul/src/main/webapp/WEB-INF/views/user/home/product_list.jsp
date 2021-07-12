<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<div id="near_card_form" class="near-card-form-content">
		<% for(int i=0;i<15;i++){ %>
		<div class="near-card-form-card">
			<div class="card" style="width: 18rem;">
			 	<img src="/yomul/image/이미지준비중.jpg" class="card-img-top">
			 	<div class="card-body">
				 	<a href="/yomul/product_info">
					    <h5 class="card-title">타이틀입니다</h5>
					    <p class="card-text">내용입니다내용입니다내용입니다내용입니내용입니다
						내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내내용입니다용입니다...</p>
				 	</a>
			 	</div>
			 	<div class="near-card-form-bottom">
				    <label>좋아요 13</label>
					<label>·</label>
					<label>댓글 44</label>
			 	</div>
			</div>
		</div>
		<% } %>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>