<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="join">
		<div class="container col-md-6 mt-3">
			<h1 class="mb-3">회원가입</h1>
			<form name="join_form">
				<div class="form-group">
					<label for="email">이메일</label>
					<input id="email" name="email" class="w-100 form-control" type="email" required>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<small id="pwHelp" class="form-text text-muted">8자 이상 입력해주세요.</small>
					<input id="pw" name="pw" class="w-100 form-control" type="password" required>
				</div>
				<div class="form-group">
					<label for="pwchk">비밀번호 확인</label>
					<input id="pwchk" class="w-100 form-control" type="password" required>
				</div>
				<div class="form-group">
					<label for="nickname">별명</label>
					<small id="nicknameHelp" class="form-text text-muted">다른 유저와 겹치지 않는 별명을 입력해주세요.(2~15자)</small>
					<input id="nickname" name="nickname" class="w-100 form-control" type="text" required>
				</div>
				<p>약관 동의</p>
				<div class="form-group border rounded pt-3 pl-2 pb-1 pr-3">
					<div class="form-check">
						<input id="check_all" type="checkbox" class="form-check-input">
						<label class="form-check-label"> 전체동의 </label>
					</div>
					<hr>
					<div class="form-check">
						<input id="check_1" name="check_1" type="checkbox" class="form-check-input" required>
						<label class="form-check-label"> 만 14세 이상입니다. </label>
					</div>
					<div class="form-check">
						<input id="check_2" name="check_2" type="checkbox" class="form-check-input" required>
						<label class="form-check-label"> 이용약관 </label>
					</div>
					<div class="form-check">
						<input id="check_3" name="check_3" type="checkbox" class="form-check-input" required>
						<label class="form-check-label"> 개인정보수집 및 이용동의 </label>
					</div>
					<div class="form-check">
						<input id="check_4" name="check_4" type="checkbox" class="form-check-input">
						<label class="form-check-label"> 이벤트, 프로모션 알림 메일 및 SMS 수신 </label>
					</div>
				</div>
				<button class="btn btn-block btn-yomul" type="submit">회원가입 완료</button>
				<div class="text-center mt-3">
					<p>
						이미 아이디가 있으신가요? <a href="#">로그인</a>
					</p>
				</div>
			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

