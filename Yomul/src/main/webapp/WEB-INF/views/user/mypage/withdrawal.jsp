<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="withdrawal" style="height: 75%; display: flex; align-items: center;">
		<div class="container mt-4 text-center" style="width: 800px;">
			<h1 class="mb-3 text-center">
				<strong>정말로 탈퇴하시겠습니까?</strong>
			</h1>
			<small class="text-yomul">탈퇴는 되돌릴 수 없습니다.</small>
			<div class="text-center mt-5 row">
				<a href="/yomul/mypage/withdrawal_proc" class="btn btn-lg btn-yomul col-lg mr-lg-3">예</a>
				<a href="javascript:window.history.back();" class="btn btn-lg btn-outline-yomul col-lg ml-lg-3">아니오</a>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>