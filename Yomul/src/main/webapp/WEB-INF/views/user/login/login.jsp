<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<div id="login" style="height: 75%; display: flex; align-items: center;">
		<div class="container mt-4" style="width: 500px;">
			<h1 class="mb-3 text-center text-decoration-none text-dark">
				<i class="bi bi-bank mr-2"></i>요물
			</h1>
			<form name="login_form">
				<div class="form-group h-100 align-middle">
					<input class="w-100 form-control rounded-0" style="border-radius: .25rem .25rem 0 0 !important;" type="email" id="email" name="email" placeholder="이메일"> <input class="w-100 form-control rounded-0 border-top-0" style="border-radius: 0 0 .25rem .25rem !important;" type="password" id="pw" name="pw" placeholder="비밀번호">
				</div>
				<button class="btn btn-block btn-yomul mb-2" type="submit">로그인</button>
				<a class="btn btn-outline-yomul btn-block rounded-pill text-dark bg-white border-dark mb-2" href="/yomul/join">계정이 없으신가요? 간편하게 가입하기</a>
				<div class="d-flex text-muted mb-2">
					<label>
						<input type="checkbox" name="id_store" id="id_store"> <small> 아이디 저장 </small>
					</label>
					<label class="ml-2">
						<input type="checkbox" name="auto_login" id="auto_login"> <small> 자동 로그인 </small>
					</label>
					<small class="ml-auto"> <a href="find_id.jsp" class="text-decoration-none text-muted">아이디 찾기</a> | <a href="find_password.jsp" class="text-decoration-none text-muted">비밀번호 찾기</a>
					</small>
				</div>
			</form>
			<div class="text-center mt-5">
				<a href="/yomul/kakao_login">
					<img src="/yomul/image/kakao_login_medium.png">
				</a>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
