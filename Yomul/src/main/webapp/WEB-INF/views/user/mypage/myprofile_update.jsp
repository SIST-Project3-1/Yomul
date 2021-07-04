<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="myprofile_update">
		<div class="container col-md-6 mt-3 border p-3">
			<div class="d-flex justify-content-between mb-3">
				<h1 class="d-inline">프로필 수정</h1>
				<a href="#" class="text-black-50 text-decoration-none" style="line-height: 56px;"><small>탈퇴하기</small></a>
			</div>
			<form name="join_form">
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input id="email" name="email" class="w-100 form-control" value="test@test.com" disabled>
					</div>
				</div>
				<div class="form-group row">
					<label for="nickname" class="col-sm-2 col-form-label">별명</label>
					<div class="col-sm-10">
						<input id="nickname" name="nickname" class="w-100 form-control" type="text" value="Hwisaek" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">전화번호</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" value="010-1234-1234" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" name="phone" id="phone">
					</div>
				</div>
				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">성별</label>
					<div class="col-sm-10">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender" id="male" value="male">
							<label class="form-check-label" for="male">남자</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender" id="female" value="female">
							<label class="form-check-label" for="female">여자</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="intro" class="col-sm-2 col-form-label">소개</label>
					<div class="col-sm-10">
						<textarea id="intro" name="intro" rows="10" class="form-control"></textarea>
					</div>
				</div>
				<button class="btn btn-block btn-yomul" type="submit">회원 정보 수정</button>
			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>