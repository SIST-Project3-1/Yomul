<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 탈퇴 취소</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
function clickOk() {
	$.ajax({
		url : "/yomul/vendor_withdrawal_cancel_proc",
		method : "GET",
		success : function(result) {
			if (result == -1) { // 로그인 필요
				alert("로그인이 필요합니다.");
				location.href = "/yomul/login";
			}else if(result == 0) { // 탈퇴 신청이 안되어 있음
				alert("업체 탈퇴 요청 회원이 아닙니다.");
			}else { // 탈퇴 신청 취소 완료
				alert("업체 탈퇴 취소가 완료되었습니다.");
			}
			location.href = "/yomul/vendor_profile_update";
		}
	});
}
</script>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="withdrawal_cancle" style="height: 75%; display: flex; align-items: center;">
		<div class="container mt-4 text-center" style="width: 800px;">
			<h2 class="mb-3 text-center">
				<strong>업체 탈퇴 처리 중에는 업체 관련 기능을 이용할 수 없습니다.</strong>
				<strong>업체 탈퇴를 취소하시겠습니까?</strong>
			</h2>
			<div class="text-center mt-5 row">
				<button type="button" onclick="clickOk()" class="btn btn-lg btn-yomul col-lg mr-lg-3">예</button>
				<a onclick="history.back()" class="btn btn-lg btn-outline-yomul col-lg ml-lg-3">아니오</a>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>