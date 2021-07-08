<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 수정</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
<style>
div.admin_notice_write {
	width: 50%;
	margin: auto;
}

div.admin_notice_write .head {
	margin-top: 50px;
}

div.admin_notice_write .head input {
	display: block;
	width: 900px;
	height: 50px;
	border: 2px solid lightgray;
	border-radius: 10px;
	text-align: left;
}

div.admin_notice_write .head .form-select{
	padding:5px 20px;
	border:2px solid lightgray;
	border-radius:20px;
}

div.admin_notice_write .body textarea {
	width: 900px;
	height: 400px;
	border: 2px solid lightgray;
	margin-top: 5px;
	text-align: left;
}

div.admin_notice_write .head .input-file-button {
	padding: 10px 30px;
	margin-top: 5px;
	margin-left: 750px;
	border-radius: 20px;
	color: white;
	cursor: pointer;
	background-color: rgb(255, 99, 95);
}

div.admin_notice_write div.notice_write_btn {
	text-align: center;
	margin-left: 300px;
}

div.admin_notice_write div.notice_write_btn #noticeUpdate {
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
	<jsp:include page="../../admin_header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="sample">
		<form name="noticeUpdate" method="get" action="#">
			<div class="admin_notice_write">
				<div class="head">
					<h1>공지사항 수정</h1>
					<h4>
						공지사항을 수정하세요
					</h4>
					<hr>
					<input type="text" name="title" id="title" class="title"
						placeholder="제목을 입력해주세요" required>
					<div id="title_alert"></div>

				</div>
				<div class="body">
					<textarea name="content" id="content" class="content"
						placeholder="내용을 적어주세요" required></textarea>
				</div>
				<div class="notice_write_btn">
					<button type="submit" name="noticeUpdate" id="noticeUpdate"
						class="btn-yomul">저장하기</button>
				</div>
			</div>
		</form>
	</section>
</body>
</html>