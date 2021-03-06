<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
	#notice_info {
		width: 750px;
		margin: 50px auto;
	}
	
	#notice_info hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
<script>
	$(document).ready(function() {
		// 목록 버튼 클릭
		$("#btn_list").click(function() {
			location.href = "../customer_notices";
		});
	});
</script>
</head>
<body>
	<%@ include file="../../header.jsp"%>
	
	<section id="notice_info">
		<div>
			<h4 class="font-weight-bold">${vo.getTitle() }</h4>
			<p class="font-weight-bold text-secondary">${vo.getNdate() }</p>
		</div>
		<hr>
		<div class="my-5 mx-0">
			<c:forEach var="fname" items="${files }">
				<img src="/yomul/image/${fname }" class="img-fluid">
			</c:forEach>
			<div>
				${vo.getContent() }
			</div>
		</div>
		<hr>
		<div class="text-center">
			<button type="button" id="btn_list" class="btn btn-yomul d-inline-block font-weight-bold">목록으로 돌아가기</button>
		</div>
	</section>
	
	<%@ include file="../../footer.jsp"%>
</body>
</html>
