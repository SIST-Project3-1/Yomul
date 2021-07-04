<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<style>
	#qna_write .textarea {
		height: 200px;
	}
</style>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<!--  BODY 참고 페이지: https://ohou.se/contacts/new -->
	<section id="qna_write" class="col-md-7 col-lg-5 mx-auto my-5">
		<h4 class="font-weight-bold">문의하기</h4>
		<form class="container my-5 mx-0">
			<div class="row mt-3">
				<select class="form-control col-md-6">
				
				</select>
			</div>
			<div class="row mt-3">
				<input type="text" class="form-control col-md-6" placeholder="이름">
			</div>
			<div class="row mt-3">
				<input type="text" class="form-control col-md-6" placeholder="이메일">
			</div>
			<div class="row mt-3">
				<input type="text" class="form-control col-md-6" placeholder="제목">
			</div>
			<div class="row mt-3">
				<textarea class="textarea form-control" placeholder="내용"></textarea>
			</div>
			<div class="row mt-3">
				<input type="text" class="form-control col-md-6 mr-3" placeholder="파일 선택">
				<button class="btn btn-yomul px-3">첨부파일</button>
			</div>
			<div class="row mt-3">
				<button class="btn btn-yomul px-4">보내기</button>
			</div>
		</form>
	</section>
	
	<!-- FOOTER -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>