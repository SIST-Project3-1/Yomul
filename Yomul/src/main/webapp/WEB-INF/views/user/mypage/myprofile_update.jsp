<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 프로필 수정</title>
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
		$("#form_myprofile_update").on("submit", function(e) {
			e.preventDefault();
			
			$.ajax({
				url : "/yomul/myprofile_update_proc",
				method : "POST",
				data : new FormData(this), // 필수
				async : false,
				processData : false, // 필수 
				contentType : false, // 필수
				success : function(result) {
					if (result == 1) {
						alert("프로필 수정 성공했습니다.");
						location.href = "/yomul/myprofile_info";
					} else {
						alert("프로필 수정에 실패했습니다.");
					}
				}
			});
		})
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<%@include file="mypage_header.jsp"%>
	<script type="text/javascript">
		$("#mypage_header_myprofile").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#mypage_header_myprofile_update").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="myprofile_update" class="container col-md-6 mt-3 border p-3">
		<div class="d-flex justify-content-between mb-3">
			<h1 class="d-inline">프로필 수정</h1>
			<a href="/yomul/withdrawal" class="text-black-50 text-decoration-none" style="line-height: 56px;">
				<small>탈퇴하기</small>
			</a>
		</div>
		<form id="form_myprofile_update" enctype="multipart/form-data">
			<div class="form-group row">
				<label for="email" class="col-md-3 col-form-label">이메일</label>
				<div class="col-md-9">
					<input id="email" name="email" class="w-100 form-control" value="${member.email }" disabled>
				</div>
			</div>
			<div class="form-group row">
				<label for="nickname" class="col-md-3 col-form-label">별명</label>
				<div class="col-md-9">
					<input id="nickname" name="nickname" class="w-100 form-control" type="text" value="${member.nickname }" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="phone" class="col-md-3 col-form-label">전화번호</label>
				<div class="col-md-9">
					<input type="tel" class="form-control" value="${member.phone }" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" name="phone" id="phone">
				</div>
			</div>
			<div class="form-group row">
				<label for="gender" class="col-md-3 col-form-label">성별</label>
				<div class="col-md-9">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="male" value="M" ${member.gender.equals('M') ? "checked" :"" }>
						<label class="form-check-label" for="male">남자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="female" value="F" ${member.gender.equals('F') ? "checked" :"" }>
						<label class="form-check-label" for="female">여자</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="intro" class="col-md-3 col-form-label">소개</label>
				<div class="col-md-9">
					<textarea id="intro" name="intro" rows="10" class="form-control">${member.intro }</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label for="intro" class="col-md-3 col-form-label">프로필 사진</label>
				<div class="col-md-9">
					<div class="input-group mb-3">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="profile_img" name="profile_img" aria-describedby="profile_img" onchange="fileUpload(this)" value='${member.profileImg !=null ? member.profileImg: "defalut.jpg" }'>
							<label class="custom-file-label" for="profile_img" data-browse="업로드">${file.filename!=null ? file.filename: "이미지를 업로드해주세요" }</label>
						</div>
					</div>
					<img id="profile_img_img" class="rounded-circle mb-3" src='/yomul/upload/${file.filename !=null ? file.getSavedFilename(): "default.jpg" }' style="width: 300px; height: 300px;">
				</div>
			</div>

			<button class="btn btn-block btn-yomul" type="submit">회원 정보 수정</button>
		</form>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>