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
	margin-left: 750px;
	border-radius: 20px;
	color: white;
	cursor: pointer;
	 background-color : rgb( 255, 99, 95);
}

div.user_town_write .footer .tag {
	padding: 8px 40px;
	background-color: Whitesmoke;
	border-radius: 30px;
	border: 2px solid white;
}

div.user_town_write div.town_write_btn {
	text-align: center;
}

div.user_town_write div.town_write_btn .townWrite {
	padding: 25px 80px;
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 20px;
	border: 2px solid white;
}
</style>

</head>
<body>
	<!-- http://localhost:9000/yomul/town_write -->
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="sample">
		<form name="townWrite" method="get" action="#">
			<div class="user_town_write">
				<div class="head">
					<h1>동네생활 글쓰기</h1>
					<h4>
						글을 작성해주세요 궁금한 것이 있으면<a href="#">문의하기</a>
					</h4>
					<hr>
					<input type="text" name="title" id="title" class="title"
						placeholder="제목을 입력해주세요">
					<div id="title_alert"></div>
					<label class="input-file-button" for="input-file"> 사진업로드 </label> <input
						type="file" id="input-file" style="display: none">
				</div>
				<div class="body">
					<textarea name="content" id="content" class="content"
						placeholder="내용을 적어주세요">
					</textarea>
				</div>
				<div class="footer">
					<button type="button" name="tag" id="tag" class="tag">#키워드를
						입력해주세요</button>
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