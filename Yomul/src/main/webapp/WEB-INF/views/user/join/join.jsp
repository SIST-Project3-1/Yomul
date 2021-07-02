<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../head.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body id="join">
	<div class="container col-md-6">
		<h1>회원가입</h1>
		<form name="join_form">
			<div class="form-group">
				<label for="email">이메일</label>
				<input class="w-100 form-control" type="email">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<small id="pwHelp" class="form-text text-muted">8자 이상 입력해주세요.</small>
				<input id="pw" class="w-100 form-control" type="password">
			</div>
			<div class="form-group">
				<label for="pwchk">비밀번호 확인</label>
				<input id="pwchk" class="w-100 form-control" type="password">
			</div>
			<div class="form-group">
				<label for="nickname">별명</label>
				<small id="nicknameHelp" class="form-text text-muted">다른 유저와 겹치지 않는 별명을 입력해주세요.(2~15자)</small>
				<input id="nickname" class="w-100 form-control" type="text">
			</div>
			<p>약관 동의</p>
			<div class="form-group border rounded pt-3 pl-2 pb-1 pr-3">
				<div class="form-check">
					<input id="all_check" type="checkbox" class="form-check-input">
					<label class="form-check-label"> 전체동의 </label>
				</div>
				<hr>
				<div class="form-check">
					<input type="checkbox" class="form-check-input">
					<label class="form-check-label"> 만 14세 이상입니다. </label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input">
					<label class="form-check-label"> 이용약관 </label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input">
					<label class="form-check-label"> 개인정보수집 및 이용동의 </label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input">
					<label class="form-check-label"> 이벤트, 프로모션 알림 메일 및 SMS 수신 </label>
				</div>
			</div>
			<button class="btn btn-block btn-primary" type="submit">회원가입 완료</button>
			<div class="text-center mt-3">
				<p>
					이미 아이디가 있으신가요? <a href="#">로그인</a>
				</p>
			</div>
		</form>
	</div>
</body>
</html>


