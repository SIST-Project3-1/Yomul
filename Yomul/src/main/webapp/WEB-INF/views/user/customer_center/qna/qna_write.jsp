<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 문의하기</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<script>
	$(document).ready(function() {
		// 보내기 버튼 클릭
		$("#form_qna_write").on('submit',function(e) {
			e.preventDefault();

			$.ajax({
				url : "/yomul/customer_qna/write_proc",
				method : "POST",
				data : new FormData(this), // 필수
				async : false,
				processData : false, // 필수 
				contentType : false, // 필수
				success : function(result) {
					if (result == 1) {
						alert("문의 작성에 성공했습니다.");
						location.href="/yomul/customer_qna"
					} else {
						alert("문의 작성에 실패했습니다.");
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
	<%@ include file="../../header.jsp"%>

	<!--  BODY 참고 페이지: https://ohou.se/contacts/new -->
	<section id="qna_write" class="container mt-3">
		<h4 class="font-weight-bold">문의하기</h4>
		<form id="form_qna_write" class="container my-5 mx-0" 
				action="/yomul/customer_qna/write_proc" method="post" enctype="multipart/form-data">
			<div class="row mt-3">
				<select name="category" class="form-control p-2 text-dark" required>
					<option value="">유형</option>
					<c:forEach var="category" items="${categories}">
						<option value="${category.no}">${category.content}</option>
					</c:forEach>
				</select>
			</div>
			<div class="row mt-3">
				<input type="text" name="name" class="form-control" placeholder="이름" required>
			</div>
			<div class="row mt-3">
				<input type="email" name="email" class="form-control" placeholder="이메일" required>
			</div>
			<div class="row mt-3">
				<input type="password" name="pw" class="form-control " placeholder="비밀번호" required>
			</div>
			<div class="row mt-3">
				<input type="text" name="title" class="form-control" placeholder="제목" required>
			</div>
			<div class="row mt-3">
				<textarea name="content" rows="10" class="textarea form-control" placeholder="내용" required></textarea>
			</div>
			<div class="row mt-3">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="validatedCustomFile" lang="kor" name="file">
					<label class="custom-file-label" for="validatedCustomFile">파일 선택</label>
				</div>
			</div>
			<div class="mt-3 text-right">
				<button type="submit" id="btn_submit" class="btn btn-yomul px-4">보내기</button>
			</div>
		</form>
	</section>

	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>