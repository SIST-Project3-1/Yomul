<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
<style>
	#qna_write {
		width: 600px;
	}
	
	#qna_write .textarea {
		height: 200px;
	}
</style>
<script>
	$(document).ready(function() {
		
		// 파일 첨부 버튼 클릭
		$("#btn_file").click(function() {
			
		});
		
		// 보내기 버튼 클릭
		$("#btn_send").click(function() {
			//$.ajax();
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<!--  BODY 참고 페이지: https://ohou.se/contacts/new -->
	<section id="qna_write" class="mx-auto m-5">
		<h4 class="font-weight-bold">문의하기</h4>
		<form class="container my-5 mx-0" action="#" method="post" enctype="multipart/form-data">
			<div class="row mt-3">
				<select name="category" class="form-control col-6 p-2 text-secondary">
					<option value="">유형</option>
				</select>
			</div>
			<div class="row mt-3">
				<input type="text" name="name" class="form-control col-6" placeholder="이름">
			</div>
			<div class="row mt-3">
				<input type="text" name="email" class="form-control col-6" placeholder="이메일">
			</div>
			<div class="row mt-3">
				<input type="text" name="title" class="form-control" placeholder="제목">
			</div>
			<div class="row mt-3">
				<textarea name="content" class="textarea form-control" placeholder="내용"></textarea>
			</div>
			<div class="row mt-3">
				<div class="custom-file col-8">
					<input type="file" class="custom-file-input" id="validatedCustomFile" lang="kor" required>
					<label class="custom-file-label" for="validatedCustomFile">파일 선택</label>
				</div>
			</div>
			<div class="row mt-3">
				<button type="button" id="btn_send" class="btn btn-yomul px-4">보내기</button>
			</div>
		</form>
	</section>
	
	<!-- FOOTER -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>