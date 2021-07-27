<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 로그인</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		// 일반 로그인
		$("#form_login").on("submit", function(e) {
			e.preventDefault();

			$.ajax({
				url : "/yomul/login_proc",
				method : "POST",
				data : new FormData(this), // 필수
				async : false,
				processData : false, // 필수 
				contentType : false, // 필수
				success : function(result) {
					if (result == 1) {
						alert("로그인 성공");
						location.href = "/yomul/";
					} else {
						alert("아이디 또는 패스워드가 일치하지 않습니다.");
					}
				}
			});
			return false;
		});

		// 자동 로그인이 설정된 경우
		if ($("#autoLogin").is(":checked")) {
			$("#form_login").submit();
		}

		// 자동 로그인 체크시, 아이디 저장도 자동으로 체크
		$("#autoLogin").on("click", function() {
			if ($("#autoLogin").is(":checked")) {
				$("#idStore").prop("checked", true);
				$("#idStore").attr("onclick", "return false;");
			} else {
				$("#idStore").prop("checked", false);
				$("#idStore").attr("onclick", "return true;");
			}
		})
	});
</script>
</head>
<body style="height: 100vh;">
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<div id="login" style="height: 75%; display: flex; align-items: center;">
		<div class="container mt-4" style="width: 500px;">
			<h1 class="mb-3 text-center text-decoration-none text-dark">
				<img src="/yomul/image/logo_big.png" style="width: 300px;">
			</h1>
			<form id="form_login" action="login_proc" method="post">
				<div class="form-group h-100 align-middle">
					<input class="w-100 form-control rounded-0" style="border-radius: .25rem .25rem 0 0 !important;" type="email" id="email" name="email" placeholder="이메일" value="${idStore}"> <input
						class="w-100 form-control rounded-0 border-top-0" style="border-radius: 0 0 .25rem .25rem !important;" type="password" id="pw" name="pw" placeholder="비밀번호" value="${autoLogin}">
				</div>
				<button class="btn btn-block btn-yomul mb-2" type="submit">로그인</button>
				<a class="btn btn-outline-yomul btn-block rounded-pill text-dark bg-white border-dark mb-2" href="/yomul/join">계정이 없으신가요? 간편하게 가입하기</a>
				<div class="d-flex text-muted mb-2">
					<label>
						<input type="checkbox" name="idStore" id="idStore" ${idStore != null ? "checked" : ""}> <small> 아이디 저장 </small>
					</label>
					<label class="ml-2">
						<input type="checkbox" name="autoLogin" id="autoLogin" ${autoLogin != null ? "checked" : ""}> <small> 자동 로그인 </small>
					</label>
					<small class="ml-auto"> <a href="/yomul/reset_password" class="text-decoration-none text-muted">비밀번호 재설정</a>
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
	<%@ include file="../footer.jsp"%>
</body>
</html>
