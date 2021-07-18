<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 QnA 관리</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#form_admin_qna_info").on("submit", function(e) {
		e.preventDefault();

		$.ajax({
			url : "${url}",
			method : "${method}",
			data : new FormData(this), // 필수
			processData : false, // 필수 
			contentType : false, // 필수
			success : function(result) {
				var json = JSON.parse(result);
				if (json.result == 1) {
					alert("${successMsg}");
					location.href = "${successLink}";
				} else {
					alert("${failMsg}");
				}
			}
		});
		return false;
	})
});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="admin_qna_info" class="container mt-3">
		<div>
			<h4 class="d-inline-block font-weight-bold">${qna.title }</h4>
			<p class="font-weight-bold  m-0 text-secondary">${qna.category_content}${qna.wdate }</p>
		</div>
		<hr class="my-2">
		<div>${qna.content }</div>
		<hr class="my-2">

		<c:choose>
			<c:when test="${qna.reply == 0}">
				<!-- 아직 답변 없을 때 -->
				<h4 class="font-weight-bold">답변</h4>
				<form id="form_admin_qna_info" class="mt-3" method="post">
					<input type="text" name="title" class="form-control" placeholder="제목">
					<textarea name="content" class="textarea form-control mt-3" placeholder="내용" rows="10"></textarea>
					<div class="row mx-1 justify-content-end">
						<button type="button" class="btn btn-yomul mt-3">완료</button>
					</div>
				</form>
			</c:when>
			<c:when test="${qna.reply == 1}">
				<!-- 답변이 이미 있을 때 -->
				<div class="mx-3">
					<div class="row">
						<h4 class="mr-3 font-weight-bold">답변드립니다~</h4>
						<p class="font-weight-bold text-secondary mt-1">2021.07.04</p>
					</div>
					<div class="row">
						내요옹~~~<br> 내요옹~~~<br> 내요옹~~~<br> 내요옹~~~<br> 내요옹~~~<br>
					</div>
				</div>
			</c:when>
		</c:choose>


		<hr class="mt-2 mb-3">
		<div class="text-center">
			<a href="/yomul/admin_qna_list" id="btn_list" class="btn btn-yomul d-inline-block px-3 font-weight-bold">목록으로 돌아가기</a>
		</div>
	</section>
</body>
</html>