<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
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
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>
	
	<!--  BODY  -->
	<!--  BODY  -->
	<div id="near_write" class="near-write">
		<div class="near-write-content">
			<!-- 선택한 사진 전체 미리보기 -->
			<div class="near-write-preview"></div>
			<!-- 사진 -->
			<form action="near_update_proc" method="POST" enctype="multipart/form-data">
				<div class="near-write-img">
					<!-- <input type="file" name="uploadFile" id="uploadFile" multiple>
					 -->

					<img id="profile_img_img" class="rounded-circle mb-3"
						src='/yomul/upload/${file.filename !=null ? file.getSavedFilename(): "default.jpg" }'
						style="width: 400px; height: 400px;"> <input type="file"
						class="custom-file-input" id="profile_img" name="profile_img"
						aria-describedby="profile_img" onchange="fileUpload(this)"
						multiple> <label class="btn-yomul" for="profile_img"
						data-browse="업로드"
						style="padding: 10px; border: 2px solid white; border-radius: 20px;">이미지업로드</label>

				</div>

				<!-- 글 작성 -->
				<div class="near-write-form">
					<div>
						<label>제목</label> <input type="text" placeholder="${vo.title }"
							required name="title">
					</div>
					<div>
						<label>가격</label> <input type="number" placeholder="${vo.price }"
							name="price" value=0>
					</div>
					<div>
						<label>전화번호</label> <input type="text" placeholder="${vo.hp }"
							name="hp">
					</div>
					<div>
						<textarea required name="content" id="content">${vo.content }</textarea>
					</div>
					<input type="checkbox" class="near-write-checkbox" name="chatCheck"
						value="1"> 채팅 안 받기
					<button type="submit" id="submit">완료</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>