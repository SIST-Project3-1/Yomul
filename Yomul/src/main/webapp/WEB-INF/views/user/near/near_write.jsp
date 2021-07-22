<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
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

	$(document).ready(function() {

		$("#content").change(function() {
			if ($("#category option:selected").val() == "default") {
				$("#submit").prop("disabled", true);
			}
		});
		$("#category").change(function() {
			$("#submit").removeAttr("disabled");
		});

	});
</script>

</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<div id="near_write" class="near-write">
		<div class="near-write-content">
			<!-- 선택한 사진 전체 미리보기 -->
			<div class="near-write-preview"></div>
			<!-- 사진 -->
			<form action="near_write_proc" method="POST"
				enctype="multipart/form-data">
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
						<label>제목</label> <input type="text" placeholder="제목을 입력해 주세요"
							required name="title">
					</div>
					<div>
						<label>카테고리</label> <select name="category" id="category"
							class="near-write-category" required>
							<option value="default" disabled selected hidden>카테고리를
								설정해 주세요</option>
							<option value="동네구인구직">동네구인구직</option>
							<option value="과외/클래스">과외/클래스</option>
							<option value="농수산물">농수산물</option>
							<option value="중고차">중고차</option>
						</select>
					</div>
					<div>
						<label>가격</label> <input type="number" placeholder="가격 (선택사항)"
							name="price" value=0>
					</div>
					<div>
						<label>전화번호</label> <input type="text" placeholder="전화번호 (선택사항)"
							name="hp">
					</div>
					<div>
						<textarea placeholder="이웃들에게 홍보하고 싶은 내용을 입력해주세요" required
							name="content" id="content"></textarea>
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