<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
<style>
	#admin_qna_info {
		width: 750px;
		margin: 50px auto;
	}
	
	#admin_qna_info .textarea {
		height: 200px;
	}
	
	#admin_qna_info hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 0;
	}
</style>
<script>
	$(document).ready(function() {
		// 목록 버튼 클릭
		$("#btn_list").click(function() {
			location.href = "admin_qna_list";
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../admin_header.jsp"></jsp:include>
	
	<!--  BODY  -->
	<section id="admin_qna_info">
		<div>
			<h4 class="d-inline-block font-weight-bold">제모옥~~~</h4>
			<p class="font-weight-bold  m-0 text-secondary">매너평가, 매너온도, 거래후기 관련 문의 2021.07.02</p>
		</div>
		<hr class="my-2">
		<div>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
		</div>
		<hr class="my-2">
		
		<!-- 아직 답변 없을 때 -->
		<!-- 
		<h4 class="font-weight-bold">답변</h4>
		<form class="mt-3">
			<input type="text" name="title" class="form-control" placeholder="제목">
			<textarea name="content" class="textarea form-control mt-3" placeholder="내용"></textarea>
			<div class="row mx-1 justify-content-end">
				<button type="button" class="btn btn-yomul mt-3">완료</button>
			</div>
		</form>
		 -->
		
		<!-- 답변이 이미 있을 때 -->
		<div class="mx-3">
			<div class="row">
				<h4 class="mr-3 font-weight-bold">답변드립니다~</h4>
				<p class="font-weight-bold text-secondary mt-1">2021.07.04</p>
			</div>
			<div class="row">
				내요옹~~~<br>
				내요옹~~~<br>
				내요옹~~~<br>
				내요옹~~~<br>
				내요옹~~~<br>
			</div>
		</div>
		
		<hr class="mt-2 mb-3">
		<div class="text-center">
			<button type="button" id="btn_list" class="btn btn-yomul d-inline-block px-3 font-weight-bold">목록으로 돌아가기</button>
		</div>
	</section>
</body>
</html>