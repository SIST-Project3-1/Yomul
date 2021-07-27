<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 수정</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
div.admin_notice_update {
	width: 50%;
	margin: auto;
}

div.admin_notice_update .head {
	margin-top: 50px;
}

div.admin_notice_update .head input {
	display: block;
	width: 900px;
	height: 50px;
	border: 2px solid lightgray;
	border-radius: 10px;
	text-align: left;
}

div.admin_notice_update .head .form-select {
	padding: 5px 20px;
	border: 2px solid lightgray;
	border-radius: 20px;
}

div.admin_notice_update .body textarea {
	width: 900px;
	height: 400px;
	border: 2px solid lightgray;
	margin-top: 5px;
	text-align: left;
}

div.admin_notice_update .head .input-file-button {
	padding: 10px 30px;
	margin-top: 5px;
	margin-left: 750px;
	border-radius: 20px;
	color: white;
	cursor: pointer;
	background-color: rgb(255, 99, 95);
}

div.admin_notice_update div.notice_update_btn {
	text-align: center;
	margin-left: 300px;
}

div.admin_notice_update div.notice_update_btn #noticeUpdate {
	padding: 25px 80px;
	color: white;
	border-radius: 20px;
	border: 2px solid white;
	display: block;
}
</style>
<script>
	function fileUpload(fis) {
		var str = fis.value;
		// 이미지를 변경한다.
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#notice_img_img').attr('src', e.target.result);
		}
		reader.readAsDataURL(fis.files[0]);
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="admin_notice_update">
		<form name="noticeUpdate" method="post"
			action="/yomul/admin_notice_update_proc"
			enctype="multipart/form-data">
			<div class="admin_notice_update">
				<div class="head">
					<h1>공지사항 수정</h1>
					<h4>공지사항을 수정해주세요</h4>
					<hr>
					<input type="hidden" name="no" value="${vo.no }"> <input
						type="text" name="title" id="title" class="title"
						value="${vo.getTitle() }" required>
					<div id="title_alert"></div>

				</div>
				<div class="body">
					<textarea name="content" id="content" class="content" required>${vo.getContent() }</textarea>
				</div>
				<div class="notice-img-img">
					<c:forEach var="fname" items="${files }">
						<img id="notice_img_img"
							src='/yomul/upload/${files !=null ? fname : (file.filename !=null ? file.getSavedFilename(): "default.jpg" )}'
							style="width: 400px; height: 400px;">
						<input type="file" class="custom-file-input" id="notice_img"
							name="notice_img" aria-describedby="notice_img"
							onchange="fileUpload(this)" multiple>
						<label class="btn-yomul" for="notice_img" data-browse="업로드"
							style="padding: 10px; border: 2px solid white; border-radius: 20px;">이미지업로드</label>
					</c:forEach>
				</div>
				<div class="notice_update_btn">
					<button type="submit" name="noticeUpdate" id="noticeUpdate"
						class="noticeUpdate">저장하기</button>
				</div>
			</div>
		</form>
	</section>
</body>
</html>