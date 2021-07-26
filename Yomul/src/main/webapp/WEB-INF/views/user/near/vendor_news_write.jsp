<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
//이미지 선택 시 버튼을 선택된 이미지 추가
function changeFile(fis) {
	var reader = new FileReader();
	
	reader.onload = function(e) {
		$("#near-write-preview").append("<img src='" + e.target.result + "' class='img-fluid rounded-circle' style='min-width:150px; min-height:150px'>");
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
		$("#vendor_header_news").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_news_insert").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<!--  BODY  -->
	<div id="near_write" class="near-write">
		<div class="near-write-content">
			<!-- 선택한 사진 전체 미리보기 -->
			<div class="near-write-preview">
		
			</div>
			
			<!-- 사진 -->
			<div class="near-write-img">
				<button type="button" id="btn_img" onclick="document.getElementById('file').click();">
					<svg  class="" width="48" height="48" viewBox="0 0 48 48" fill="currentColor" preserveAspectRatio="xMidYMid meet">
					<path d="M11.952 9.778l2.397-5.994A1.778 1.778 0 0 1 16 2.667h16c.727 0 1.38.442 1.65 1.117l2.398 5.994h10.174c.982 0 1.778.796 1.778 1.778v32c0 .981-.796 1.777-1.778 1.777H1.778A1.778 1.778 0 0 1 0 43.556v-32c0-.982.796-1.778 1.778-1.778h10.174zM24 38c6.075 0 11-4.925 11-11s-4.925-11-11-11-11 4.925-11 11 4.925 11 11 11z"></path>
					</svg>
					<span class="">사진 올리기</span>
					<span class="">(*최대 10장까지)</span>
				</button>
			</div>
			
			<!-- 글 작성 -->
			<div class="near-write-form" >
				<form id="near_write_form">
					<div>
						<label>제목</label>
						<input type="text" name="title" placeholder="제목을 입력해 주세요" required>
					</div>
					<div>
						<label>가격</label>
						<input type="text" name="price" placeholder="가격 (선택사항)">
					</div>
					<div>
						<textarea name="content" placeholder="단골들에게 홍보하고 싶은 내용을 입력해주세요" required></textarea>
					</div>
					<input type="checkbox" name="chatCheck" class="near-write-checkbox">  채팅 안 받기
					<input multiple="multiple" type="file" id="file" name="filelist[]" class="d-none" onChange="changeFile(this)">
					<button type="button" onclick="news_write_submit()">완료</button>
				</form>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>