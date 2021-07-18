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
	<div id="near_card_form" class="near-card-form-content">
		<c:forEach var="vo" items="${list }">
		<div class="near-card-form-card">
			<div class="card" style="width: 18rem;">
			 		<c:if test="${fvo.getFilename() != null }">
							<img src="/yomul/upload/${fvo.getFilename }">
							</c:if>
							<c:if test="${fvo.getFilename() == null }">
							<img src="http://localhost:9000/yomul/upload/default.jpg">
							</c:if>
			 	<div class="card-body">
				 	<a href="near_info/${vo.no }">
					    <h5 class="card-title">${vo.title }</h5>
					    <p class="card-text">${vo.content }</p>
				 	</a>
			 	</div>
			 	<div class="near-card-form-bottom">
				    <label>좋아요 13</label>
					<label>·</label>
					<label>댓글 44</label>
			 	</div>
			</div>
		</div>
		</c:forEach>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>