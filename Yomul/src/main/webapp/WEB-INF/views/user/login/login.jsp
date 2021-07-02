<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../head.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body id="join" class="h-100">
	<div class="container col-md-6">
		<form name="login_form">
			<div class="form-group h-100 align-middle">
				<label for="email">이메일</label>
				<input class="w-100 form-control" type="email">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<small id="pwHelp" class="form-text text-muted">8자 이상 입력해주세요.</small>
				<input id="pw" class="w-100 form-control" type="password">
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


