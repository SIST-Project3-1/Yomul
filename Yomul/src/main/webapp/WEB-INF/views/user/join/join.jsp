<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 회원가입</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var emailCheckFlag = false;
	var pwCheckFlag = false;
	var nicknameCheckFlag = false;
	var checkBoxCheckFlag = false;

	// 이메일 체크
	function emailCheck() {
		// 이메일 형식 확인
		if (validateEmail($("#email").val())) {
			$.ajax({
				url : "/yomul/email_check",
				method : "POST",
				async : false,
				data : {
					"email" : $("#email").val()
				},
				success : function(result) {
					if (result == 1) { // 이메일 사용 불가
						$("#email").siblings(".valid-feedback").css("display", "none");
						$("#email").siblings(".invalid-feedback").css("display", "block");
						$("#email").siblings(".wrong_regex").css("display", "none");
						emailCheckFlag = false;
					} else { // 이메일 사용 가능
						$("#email").siblings(".valid-feedback").css("display", "block");
						$("#email").siblings(".invalid-feedback").css("display", "none");
						$("#email").siblings(".wrong_regex").css("display", "none");
						$("#email").attr("readonly", "");
						$("#btn_email_check").attr("disabled", "");
						emailCheckFlag = true;
					}
				}
			});
		} else { // 이메일 형식 오류
			$("#email").siblings(".valid-feedback").css("display", "none");
			$("#email").siblings(".invalid-feedback").css("display", "none");
			$("#email").siblings(".wrong_regex").css("display", "block");
			$("#email").focus();
			emailCheckFlag = false;
		}
	}

	// 비밀번호 체크
	function pwCheck() {
		console.log("pwCheck");
		if ($("#pw").val() != "" && $("#pw_chk").val() == $("#pw").val()) {
			$("#pw_chk").siblings(".valid-feedback").css("display", "block");
			$("#pw_chk").siblings(".invalid-feedback").css("display", "none");
			pwCheckFlag = true;
		} else {
			$("#pw_chk").siblings(".valid-feedback").css("display", "none");
			$("#pw_chk").siblings(".invalid-feedback").css("display", "block");
			pwCheckFlag = false;
		}
	}

	// 닉네임 중복 확인
	function nicknameCheck() {
		$.ajax({
			url : "/yomul/nickname_check",
			method : "POST",
			data : {
				"nickname" : $("#nickname").val()
			},
			success : function(result) {
				if (result == 1) {
					$("#nickname").siblings(".valid-feedback").css("display", "none");
					$("#nickname").siblings(".invalid-feedback").css("display", "block");
					nicknameCheckFlag = false;
				} else {
					$("#nickname").siblings(".valid-feedback").css("display", "block");
					$("#nickname").siblings(".invalid-feedback").css("display", "none");
					nicknameCheckFlag = true;
				}
			}
		});
	}

	// 전체 동의
	function checkAllCheckbox() {
		if ($("#check_all").is(":checked") == true) {
			$("#check_1").prop("checked", true);
			$("#check_2").prop("checked", true);
			$("#check_3").prop("checked", true);
			$("#subscribe").prop("checked", true);
		} else if ($("#check_all").is(":checked") == false) {
			$("#check_1").prop("checked", false);
			$("#check_2").prop("checked", false);
			$("#check_3").prop("checked", false);
			$("#subscribe").prop("checked", false);

		}
	}

	// 필수 약관 동의 확인
	function checkBoxCheck() {
		if (!$("#check_1").is(":checked")) {
			$("#check_1").parent().siblings(".invalid-feedback").css("disbplay", "block");
			checkBoxCheckFlag = false;
		} else if (!$("#check_2").is(":checked")) {
			$("#check_1").parent().siblings(".invalid-feedback").css("disbplay", "none");
			$("#check_2").parent().siblings(".invalid-feedback").css("disbplay", "block");
			checkBoxCheckFlag = false;
		} else if (!$("#check_3").is(":checked")) {
			$("#check_1").parent().siblings(".invalid-feedback").css("disbplay", "none");
			$("#check_2").parent().siblings(".invalid-feedback").css("disbplay", "none");
			$("#check_3").parent().siblings(".invalid-feedback").css("disbplay", "block");
			checkBoxCheckFlag = false;
		} else {
			checkBoxCheckFlag = true;
		}
	}

	// 회원가입 처리
	function join_submit() {
		if (!emailCheckFlag) {
			emailCheck();
		} else if (!pwCheckFlag) {
			pwCheck();
		} else if (!nicknameCheckFlag) {
			nicknameCheck();
		} else if (!checkBoxCheckFlag) {
			checkBoxCheck();
		} else {
			$.ajax({
				url : "/yomul/join_proc",
				method : "POST",
				data : $("#form_join").serialize(),
				success : function(result) {
					if (result == 1) {
						alert("회원가입에 성공했습니다.");
						location.href = "/yomul/login";
					} else {
						alert("회원가입에 실패했습니다.");
					}
				}
			});
		}
	}
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
						<div class="valid-feedback">사용할 수 있는 이메일입니다.</div>
						<div class="invalid-feedback">사용할 수 없는 이메일입니다.</div>
						<div class="invalid-feedback wrong_regex">이메일 형식에 맞지 않습니다.</div>
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
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
				</div>
				<div class="form-group">
					<label for="nickname">별명</label>
					<small id="nicknameHelp" class="form-text text-muted">다른 유저와 겹치지 않는 별명을 입력해주세요.(2~15자)</small>
					<input id="nickname" name="nickname" class="w-100 form-control" type="text" onkeyup="nicknameCheck()" required>
					<div class="valid-feedback">사용할 수 있는 닉네임입니다.</div>
					<div class="invalid-feedback">사용할 수 없는 닉네임입니다.</div>
				</div>
				<p>약관 동의</p>
				<div class="form-group border rounded pt-3 pl-2 pb-1 pr-3">
					<div class="form-check">
						<label class="form-check-label">
							<input id="check_all" type="checkbox" class="form-check-input" onchange="checkAllCheckbox()">
							전체동의
						</label>
					</div>
					<hr>
					<div class="form-check">
						<label class="form-check-label">
							<input id="check_1" name="check_1" type="checkbox" class="form-check-input" required>
							만 14세 이상입니다. <span class="text-yomul">(필수)</span>
						</label>
						<div class="invalid-feedback">필수 약관에 동의해주세요.</div>
					</div>
					<div class="form-check">
						<label class="form-check-label">
							<input id="check_2" name="check_2" type="checkbox" class="form-check-input" required>
							이용약관
							<a href="/yomul/usepolicy">보기</a>
							<span class="text-yomul">(필수)</span>
						</label>
						<div class="invalid-feedback">필수 약관에 동의해주세요.</div>
					</div>
					<div class="form-check">
						<label class="form-check-label">
							<input id="check_3" name="check_3" type="checkbox" class="form-check-input" required>
							개인정보수집 및 이용동의
							<a href="/yomul/privacy">보기</a>
							<span class="text-yomul">(필수)</span>
						</label>
						<div class="invalid-feedback">필수 약관에 동의해주세요.</div>
					</div>
					<div class="form-check">
						<label class="form-check-label">
							<input id="subscribe" name="subscribe" type="checkbox" class="form-check-input">
							이벤트, 프로모션 알림 메일 및 SMS 수신 <span>(선택)</span>
						</label>
					</div>
				</div>
				<button class="btn btn-block btn-yomul" type="button" onclick="join_submit()">회원가입 완료</button>
				<div class="text-center mt-3">
					<p>
						이미 아이디가 있으신가요?
						<a href="/yomul/login">로그인</a>
					</p>
				</div>
			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

