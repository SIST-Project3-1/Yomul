<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body id="join" class="h-100">
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container col-md-6 mt-3">
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
			<button class="btn btn-block btn-yomul" type="submit">회원가입 완료</button>
			<div class="text-center mt-3">
				<p>
					이미 아이디가 있으신가요? <a href="#">로그인</a>
				</p>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>