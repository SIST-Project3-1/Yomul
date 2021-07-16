<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 글쓰기</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
.admin-fqa-write-content {
	width:900px;
	margin:auto;
	padding:0;
}
.admin_faq_write {
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
.head h4{
	margin-bottom:20px;
}
div.admin_faq_write .head .form-select{
	padding:5px 20px;
	border:2px solid lightgray;
	border-radius:20px;
}
.form-select {
	margin-bottom:5px;
	color:gray;
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
div.admin_faq_write div.admin_faq_write_btn .fqaWrite {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 20px;
	border: 2px solid white;
	display: block;
	width:100px; height:50px;
	margin-top:20px;
}
.admin_faq_write_btn {
	display: flex;
    flex-direction: column;
    align-items: center;
}
</style>
<script>
$(document).ready(function(){
	$('#category').change(function(){
		$('#category').css('color','black');
	});
});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="admin_fqa_write" class="admin-fqa-write-content">
		<form name="admin_fqa_write" method="get" action="admin_fqa_write_proc">
			<div class="admin_faq_write">
				<div class="head">
					<h1>FAQ 글쓰기</h1>
					<h4>게시할 FAQ 글을 써주세요</h4>
				<div id="title_alert">
					<select id="category" name="categoryNo" class="form-select" aria-label="Default select example" required>
						<option value="" disabled selected hidden>카테고리</option>
						<c:forEach var="category" items="${categories}">
							<option value="${category.no}">${category.content}</option>
						</c:forEach>
					</select> 
					<input type="text" name="title" id="title" class="title" placeholder="제목을 입력해 주세요" required>
				</div>
				</div>
				<div class="body">
					<textarea name="content" id="content" class="content" placeholder="내용을 적어 주세요" required></textarea>
				</div>
				<div class="admin_faq_write_btn">
					<button type="submit" class="fqaWrite">완료</button>
				</div>
			</div>
		</form>
	</section>
</body>
</html>