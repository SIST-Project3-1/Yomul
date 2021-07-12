<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<!-- HEAD -->
<style>
	#qna_write {
		width: 600px;
	}
	
	#qna_write .textarea {
		height: 200px;
	}
</style>
<%@ include file="../../../head.jsp"%>
<script>
	$(document).ready(function() {
		
		// 파일 첨부 버튼 클릭
		$("#btn_file").click(function() {
			
		});
		
		// 보내기 버튼 클릭
		$("#btn_send").click(function() {
			//$.ajax();
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../header.jsp"%>

	<!--  BODY 참고 페이지: https://ohou.se/contacts/new -->
	<section id="qna_write" class="mx-auto m-5">
		<h4 class="font-weight-bold">문의하기</h4>
		<form class="container my-5 mx-0" action="#" method="post" enctype="multipart/form-data">
			<div class="row mt-3">
				<select name="category" class="form-control col-6 p-2 text-secondary">
					<option value="0">유형</option>
					<option value="1">거래 환불/분쟁 및 사기 신고</option>
					<option value="2">계정 문의</option>
					<option value="3">판매 금지/거래 품목 문의</option>
					<option value="4">매너평가, 매너온도, 거래후기 관련 문의</option>
					<option value="5">게시글 노출, 미노출 문의</option>
					<option value="6">채팅, 알림 문의</option>
					<option value="7">앱 사용/거래 방법 문의</option>
					<option value="8">동네 생활(커뮤니티) 문의</option>
					<option value="9">지역 광고 문의</option>
					<option value="10">비즈프로필(등록, 이용) 문의</option>
					<option value="11">검색 문의</option>
					<option value="12">기타 문의</option>
					<option value="13">오류 제보</option>
					<option value="14">개선/제안</option>
				</select>
			</div>
			<div class="row mt-3">
				<input type="text" name="name" class="form-control col-6" placeholder="이름">
			</div>
			<div class="row mt-3">
				<input type="text" name="email" class="form-control col-6" placeholder="이메일">
			</div>
			<div class="row mt-3">
				<input type="text" name="title" class="form-control" placeholder="제목">
			</div>
			<div class="row mt-3">
				<textarea name="content" class="textarea form-control" placeholder="내용"></textarea>
			</div>
			<div class="row mt-3">
				<div class="custom-file col-8">
					<input type="file" class="custom-file-input" id="validatedCustomFile" lang="kor" required>
					<label class="custom-file-label" for="validatedCustomFile">파일 선택</label>
				</div>
			</div>
			<div class="row mt-3">
				<button type="button" id="btn_send" class="btn btn-yomul px-4">보내기</button>
			</div>
		</form>
	</section>
	
	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>