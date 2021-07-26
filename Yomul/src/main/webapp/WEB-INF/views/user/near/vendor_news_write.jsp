<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 작성</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<script>
	//이미지 미리보기 
	function fileUpload(fis) {
		var str = fis.value;
		// 이미지를 변경한다.
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#profile_img_img').attr('src', e.target.result);
		}
		reader.readAsDataURL(fis.files[0]);
	}

	//이미지 선택 시 버튼을 선택된 이미지 추가
	function changeFile(fis) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$("#near-write-preview")
					.append(
							"<img src='" + e.target.result + "' class='img-fluid rounded-circle' style='min-width:150px; min-height:150px'>");
		}

		reader.readAsDataURL(fis.files[0]);
	}

	//업체 등록 버튼 클릭 시
	function news_write_submit() {
		var formData = new FormData($("#near_write_form")[0]);
		$.ajax({
			url : "/yomul/vendor_news_write_proc",
			method : "POST",
			data : formData,
			enctype : "multipart/form-data",
			contentType : false,
			processData : false,
			success : function(result) {
				console.log(result);
				if (result != 0) {
					alert("소식 등록에 성공했습니다.");
					location.href = "/yomul/near_info/" + result;
				} else {
					alert("소식 등록에 실패했습니다.");
				}
			}
		});
	}
</script>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<c:import url="vendor_header.jsp" />
	<script type="text/javascript">
		$("#vendor_header_news").addClass("active").removeClass("text-muted")
				.css("color", "rgb(255, 99, 95)");
		$("#vendor_header_news_insert").addClass("active").removeClass(
				"text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<!--  BODY  -->
	<form id="near_write_form" method="POST" enctype="multipart/form-data">
		<div id="near_write" class="near-write">
			<div class="near-write-content">
				<!-- 선택한 사진 전체 미리보기 -->
				<div class="near-write-preview"></div>

				<!-- 사진 -->
				<div class="near-write-img">
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
						<label>제목</label> <input type="text" name="title"
							placeholder="제목을 입력해 주세요" required>
					</div>
					<div>
						<label>가격</label> <input type="number" name="price"
							placeholder="가격 (선택사항)">
					</div>
					<div>
						<textarea name="content" placeholder="단골들에게 홍보하고 싶은 내용을 입력해주세요"
							required></textarea>
					</div>
					<input type="checkbox" name="chatCheck" class="near-write-checkbox" value=1>
					채팅 안 받기 <input multiple="multiple" type="file" id="file"
						name="filelist[]" class="d-none" onChange="changeFile(this)"  >
					<button type="button" onclick="news_write_submit()">완료</button>
				</div>
			</div>
		</div>
	</form>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>