<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
$(document).ready(function(){
	$('#category').change(function(){
		$('#category').css('color','black');
	});
	
	/* if ($('#file')[0].files.length === 0) {
	    alert("파일을 선택해주세요");
	    $('#file_btn').attr("disabled","disabled");
	}else{
		 $('#file_btn').removeAttr("disabled");
	} */
	
	
	
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
			<div class="near-write-preview">
		
			</div>
			<!-- 사진 -->
			<form action="upload_file_proc" method="POST" enctype="multipart/form-data">
			<div class="near-write-img">
					<img alt="이미지없습니다" src="${url }" style="width:150px">
					<img alt="이미지없습니다2" src="resources/upload/신발사진1.jpg" style="width:150px">
					
				
				<input type="file" id="file"  name="uploadFile" multiple >
				<button type="submit" class="btn-yomul" style="height:50px;" id="file_btn">이미지업로드</button>
			</div>
			</form>
			
			<!-- 글 작성 -->
			<div class="near-write-form" >
				<form name="near_write" action="near_write_proc" method="post" enctype="multipart/form-data">
					<div>
						<label>제목</label>
						<input type="text" placeholder="제목을 입력해 주세요" required name="title">
					</div>
					<div>
						<label>카테고리</label>
						<select name="category" id="category" class="near-write-category" required>
							<option value="카테고리" disabled selected hidden>카테고리를 설정해 주세요</option>
							<option value="동네구인구직">동네구인구직</option>
							<option value="과외/클래스">과외/클래스</option>
							<option value="농수산물">농수산물</option>
							<option value="중고차">중고차</option>
						</select>
					</div>
					<div>
						<label>가격</label>
						<input type="text" placeholder="가격 (선택사항)" name="price">
					</div>
					<div>
						<label>전화번호</label>
						<input type="text" placeholder="전화번호 (선택사항)" name="hp">
					</div>
					<div>
						<textarea placeholder="이웃들에게 홍보하고 싶은 내용을 입력해주세요" required name="content"></textarea>
					</div>
					<input type="checkbox" class="near-write-checkbox" name="chatCheck" value="1">  채팅 안 받기
					<button type="submit">완료</button>
				</form>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>