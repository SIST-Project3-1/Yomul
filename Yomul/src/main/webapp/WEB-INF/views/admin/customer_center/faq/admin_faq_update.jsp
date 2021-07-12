<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 글 수정하기</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
div.admin_faq_write {
	width: 50%;
	margin: auto;
}

div.admin_faq_write .head {
	margin-top: 50px;
}

div.admin_faq_write .head input {
	display: block;
	width: 900px;
	height: 50px;
	border: 2px solid lightgray;
	border-radius: 10px;
	text-align: left;
}

div.admin_faq_write .head .form-select{
	padding:5px 20px;
	border:2px solid lightgray;
	border-radius:20px;
}

div.admin_faq_write .body textarea {
	width: 900px;
	height: 400px;
	border: 2px solid lightgray;
	margin-top: 5px;
	text-align: left;
}

div.admin_faq_write .head .input-file-button {
	padding: 10px 30px;
	margin-top: 5px;
	margin-left: 750px;
	border-radius: 20px;
	color: white;
	cursor: pointer;
	background-color: rgb(255, 99, 95);
}

div.admin_faq_write div.faq_write_btn {
	text-align: center;
	margin-left: 300px;
}

div.admin_faq_write div.faq_write_btn #fqaUpdate {
	padding: 25px 80px;
	color: white;
	border-radius: 20px;
	border: 2px solid white;
	display: block;
}
</style>

</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="sample">
		<form name="fqaUpdate" method="get" action="#">
			<div class="admin_faq_write">
				<div class="head">
					<h1>FAQ 글 수정하기</h1>
					<h4>
						게시할 FAQ 글을 수정해주세요
					</h4>
					<hr>
					<select class="form-select" aria-label="Default select example">
						<option selected>카테고리</option>
						<option value="상품문의">상품문의</option>
						<option value="회원문의">회원문의</option>
					</select> <input type="text" name="title" id="title" class="title"
						placeholder="제목을 입력해주세요" required>
					<div id="title_alert"></div>

				</div>
				<div class="body">
					<textarea name="content" id="content" class="content"
						placeholder="내용을 적어주세요!!" required></textarea>
				</div>
				<div class="faq_write_btn">
					<button type="submit" name="fqaUpdate" id="fqaUpdate"
						class="btn-yomul">저장하기</button>
				</div>
			</div>
		</form>
	</section>
</body>
</html>