<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네생활 글쓰기</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
<style>
div.user_town_write {
	width: 50%;
	margin: auto;
}

div.user_town_write .head {
	margin-top: 50px;
}

div.user_town_write .head input {
	display: block;
	width: 900px;
	height: 50px;
	border: 2px solid lightgray;
	border-radius: 10px;
	text-align: left;
}
div.user_town_write .head .form-select{
	padding:5px 20px;
	border:2px solid lightgray;
	border-radius:20px;
}

div.user_town_write .body textarea {
	width: 900px;
	height: 400px;
	border: 2px solid lightgray;
	margin-top: 5px;
	text-align: left;
}

div.user_town_write .head .input-file-button {
	padding: 10px 30px;
	margin-top: 5px;
	
	border-radius: 20px;
	color: white;
	cursor: pointer;
	background-color: rgb(255, 99, 95);
}

div.user_town_write div.town_write_btn {
	text-align: center;
	margin-left: 300px;
}

div.user_town_write div.town_write_btn .townWrite {
	padding: 25px 80px;
	background-color: rgb(255, 99, 95);
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
			$('#profile_img_img').attr('src', e.target.result);
		}
		reader.readAsDataURL(fis.files[0]);
	}

	
</script>
</head>
<body>
	<!-- http://localhost:9000/yomul/town_write -->
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="sample">
		<form name="townWrite" method="POST" action="#">
			<div class="user_town_write">
				<div class="head">
					<h1>동네생활 글쓰기</h1>
					<h4>
						글을 작성해주세요 궁금한 것이 있으면<a href="#">문의하기</a>
					</h4>
					<hr>
					<select class="form-select" aria-label="Default select example">
						<option selected>카테고리</option>
						<option value="동네생활">동네생활</option>
						<option value="용품인증">용품인증</option>
					</select> <input type="text" name="title" id="title" class="title"
						placeholder="제목을 입력해주세요" required>
					<div id="title_alert"></div>
					<label class="input-file-button" for="input-file"
						style="white-space: nowrap;"> 사진 </label> <input type="file"
						id="input-file" style="display: none" onchange="fileUpload(this)">
				</div>
				<div class="body">
					<textarea name="content" id="content" class="content"
						placeholder="내용을 적어주세요!!" required></textarea>
					<img id="profile_img_img" class="rounded-circle mb-3"
						src="/yomul/image/이미지준비중.jpg"
						style="width: 200px; height: 200px; display: block;">
				</div>
				<div class="town_write_btn">
					<button type="submit" name="townWrite" id="townWrite"
						class="townWrite">글쓰기 저장하기</button>
				</div>
			</div>
		</form>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>