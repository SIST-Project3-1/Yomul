<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네생활 글쓰기</title>
<style>
.town-write-content {
	/*border:1px red solid;*/
    width:60%;
    margin:auto;
    padding:50px 0;
}
.town-write-top {
	/*border:1px red solid;*/
	display:flex;
	margin-bottom:20px;
	width:100%;
}
.town-write-top input{
	border:1px lightgray solid;
	width:85%;
	height:35px;
}
.town-write-category {
    border:none;
    width: 14%;
	height:30px;
	color:gray;
	margin-top:3px;
	margin-right:15px;
}
.town-write-text {
	/*border:1px red solid;*/
	display:flex;
	justify-content: center;
}
.town-write-text textarea{
	width:100%;
	height:400px;
	border:1px lightgray solid;
}
.town-write-img {
	/*border:1px red solid;*/
	margin-top:20px;
	display:flex;
	align-items: center;
    flex-direction: column;
}
.town-write-img div{
	width:100%; height:150px;
	border:1px lightgray dashed;
	border-radius:10px;
	background-color: lightgrey;
	display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
}
.town-write-img svg{
	color:gray;
	width:30px; height:30px;
}
.town-write-img label:nth-child(2){
	color:gray;
	font-weight:bold;
	font-size:15px;
	cursor: pointer;
}
.town-write-img label:last-child{
	color:gray;
	font-size:13px;
}
.town-write-btn {
	/*border:1px red solid;*/
	height:50px;
	margin-top:40px;
    display: flex;
    justify-content: center;
}
.town-write-btn button{
	text-align:center;
	height:30px;
    width:100px;
    border:none;
    background-color:rgb(255, 99, 95);
    border-radius:5px;
    color:white;
}
.town-write-btn button:first-child{
	margin-right:25px;
}
.town-write-img-view {
	display: flex;
    flex-direction: column;
    align-items: center;
}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('#category').change(function(){
		$('#category').css('color','black');
	});
	$('#tag').change(function(){
		$('#tag').css('color','black');
	});
	
});
function fileUpload(fis) {
	var str = fis.value;
	// 이미지를 변경한다.
	var reader = new FileReader();
	reader.onload = function(e) {
		$('#file_img').attr('src', e.target.result);
		$('#img_file').css('display','none');
	}
	reader.readAsDataURL(fis.files[0]);
}
</script>

<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<div id="town_write" class="town-write-content">
		<form id="town_write_form" name="town_write_form" action="town_write_proc" method="get">
			<!-- 카테고리 & 제목 -->
			<div class="town-write-top">
				<select name="category" id="category" class="town-write-category" required>
					<option value="" disabled selected hidden>카테고리</option>
					<option value="우리동네질문">우리동네질문</option>
					<option value="분실/실종센터">분실/실종센터</option>
					<option value="동네사건사고">동네사건사고</option>
					<option value="같이해요">같이해요</option>
					<option value="동네맛집">동네맛집</option>
					<option value="일상">일상</option>
					<option value="취미">취미</option>
					<option value="살림">살림</option>
					<option value="기타">기타</option>
				</select>
				<input type="text" id="title" name="title" placeholder="제목을 입력해 주세요" required>
			</div>
			
			<!-- 본문 -->
			<div class="town-write-text">
				<textarea name="content" placeholder="우리 동네 관련된 질문이나 이야기를 해보세요" required></textarea>
			</div>
			
			<!-- 사진 -->
			<div class="town-write-img">
				<div id="img_file" for="file">
					<svg  class="" width="48" height="48" viewBox="0 0 48 48" fill="currentColor" preserveAspectRatio="xMidYMid meet">
					<path d="M11.952 9.778l2.397-5.994A1.778 1.778 0 0 1 16 2.667h16c.727 0 1.38.442 1.65 1.117l2.398 5.994h10.174c.982 0 1.778.796 1.778 1.778v32c0 .981-.796 1.777-1.778 1.777H1.778A1.778 1.778 0 0 1 0 43.556v-32c0-.982.796-1.778 1.778-1.778h10.174zM24 38c6.075 0 11-4.925 11-11s-4.925-11-11-11-11 4.925-11 11 4.925 11 11 11z"></path>
					</svg>
					<label for="file">사진 올리기</label>
					<label>(*최대 5장까지)</label>
				</div>
				<input type="file" id="file" name="file" style="display:none" onchange="fileUpload(this)">
			</div>
			<div class="town-write-img-view">
				<img src="" id="file_img">
			</div>
			
			<!-- 버튼 -->
			<div class="town-write-btn">
				<button type="submit" >완료</button>
				<button type="reset" >취소</button>
			</div>
		</form>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>
