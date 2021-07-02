<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<div id="login">

		<div class="container col-md-6 mt-4 align-middle">
			<form name="login_form">
				<div class="form-group h-100 align-middle">
					<input class="w-100 form-control rounded-0" style="border-radius: .25rem .25rem 0 0 !important;" type="email" id="email" placeholder="이메일">
					<input class="w-100 form-control rounded-0 border-top-0" style="border-radius: 0 0 .25rem .25rem !important;" type="password" id="pw" placeholder="비밀번호">
				</div>
				<button class="btn btn-block btn-yomul" type="submit">로그인</button>
				<div class="text-center mt-3">
					<a class="text-decoration-none text-body mr-3" href="#">비밀번호 재설정</a> <a class="text-decoration-none text-body" href="#">회원가입</a>
				</div>
			</form>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
