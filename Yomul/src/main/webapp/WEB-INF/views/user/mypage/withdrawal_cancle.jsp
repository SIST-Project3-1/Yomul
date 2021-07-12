<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 취소</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="withdrawal_cancle" style="height: 75%; display: flex; align-items: center;">
		<div class="container mt-4 text-center" style="width: 800px;">
			<h2 class="mb-3 text-center">
				<strong>회원 탈퇴 처리 중에는 사이트를 이용할 수 없습니다.</strong>
				<strong>회원 탈퇴를 취소하시겠습니까?</strong>
			</h2>
			<div class="text-center mt-5 row">
				<button type="button" class="btn btn-lg btn-yomul col-lg mr-lg-3">예</button>
				<a href="logout" class="btn btn-lg btn-outline-yomul col-lg ml-lg-3">아니오</a>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>