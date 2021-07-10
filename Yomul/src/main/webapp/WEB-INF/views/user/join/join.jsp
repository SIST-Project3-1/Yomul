<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 회원가입</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_email_check").on("click", function() {
	// 이메일 체크
	function emailCheck() {
		if (validateEmail($("#email").val())) {
			$.ajax({
				url : "/yomul/email_check",
				method : "GET",
				method : "POST",
				data : {
					"email" : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						alert("사용할 수 있는 이메일입니다.");
						$("#email").attr("disabled", "");
						$("#email").attr("readonly", "");
						$("#btn_email_check").attr("disabled", "");
					} else {
						alert("사용중인 이메일입니다. 다른 이메일을 입력해주세요.");

					}
				}
			});
		} else {
			alert("이메일 형식에 맞지 않습니다.");
			$("#email").focus();
		}
	}

	// 비밀번호 체크
	function pwCheck() {
		if ($("#pw_chk").val() == $("#pw").val()) {
			$("#pw_chk").siblings(".valid-feedback").css("display", "block");
			$("#pw_chk").siblings(".invalid-feedback").css("display", "none");
			return true;
		} else {
			$("#pw_chk").siblings(".valid-feedback").css("display", "none");
			$("#pw_chk").siblings(".invalid-feedback").css("display", "block");
			return false;
		}
	}

		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="join">
		<div class="container col-md-6 mt-3">
			<h1 class="mb-3">회원가입</h1>
			<form id="form_join" class="needs-validation" novalidate>
				<div class="form-group">
					<label for="email">이메일</label>
					<div class="input-group mb-3">
						<input type="email" class="form-control" placeholder="example@yomul.com" id="email" name="email" aria-describedby="btn_email_check" required>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button" id="btn_email_check" onclick="emailCheck()">중복확인</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<small id="pwHelp" class="form-text text-muted">8자 이상 입력해주세요.</small>
					<input id="pw" name="pw" class="w-100 form-control" type="password" onkeyup="pwCheck()" required>
				</div>
				<div class="form-group">
					<label for="pw_chk">비밀번호 확인</label>
					<input id="pw_chk" class="w-100 form-control" type="password" onkeyup="pwCheck()" required>
					<div class="valid-feedback">비밀번호가 일치합니다.</div>
				</div>
				<div class="form-group">
					<label for="nickname">별명</label>
					<small id="nicknameHelp" class="form-text text-muted">다른 유저와 겹치지 않는 별명을 입력해주세요.(2~15자)</small> <input id="nickname" name="nickname" class="w-100 form-control" type="text" required>
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
						<label class="form-check-label">
							이용약관
							<a href="/yomul/usepolicy">보기</a>
						</label>
					</div>
					<div class="form-check">
						<input id="check_3" name="check_3" type="checkbox" class="form-check-input" required>
						<label class="form-check-label">
							개인정보수집 및 이용동의
							<a href="/yomul/privacy">보기</a>
						</label>
					</div>
					<div class="form-check">
						<input id="check_4" name="check_4" type="checkbox" class="form-check-input">
						<label class="form-check-label"> 이벤트, 프로모션 알림 메일 및 SMS 수신 </label>
					</div>
				</div>
				<button class="btn btn-block btn-yomul" type="submit">회원가입 완료</button>
				<div class="text-center mt-3">
					<p>
						이미 아이디가 있으신가요?
						<a href="/yomul/login">로그인</a>
					</p>
				</div>
			</form>

			<script>
				// Example starter JavaScript for disabling form submissions if there are invalid fields
				(function() {
					'use strict';
					window.addEventListener('load', function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms, function(form) {
							form.addEventListener('submit', function(event) {
								if (form.checkValidity() === false) {
									event.preventDefault();
									event.stopPropagation();
								}
								form.classList.add('was-validated');
							}, false);
						});
					}, false);
				})();
			</script>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

