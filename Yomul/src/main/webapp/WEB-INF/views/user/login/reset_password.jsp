<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 초기화</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form_join").on("submit", function() {
			$.ajax({
				url : "/yomul/reset_password_proc",
				method : "GET",
				data : {
					"email" : $("#email").val()
				},
				success : function(result) {
					alert("AJAX 로 결과를 받아서 출력하세요.");
				}
			});
			return false;
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="login">
		<div class="container col-md-6 mt-3">
			<h1 class="mb-3">비밀번호 초기화</h1>
			<form id="form_join">
				<div class="form-group">
					<label for="email">
						이메일 <small class="text-yomul">임시 비밀번호를 발급하여 이메일로 전송합니다.</small>
					</label>
					<input id="email" name="email" class="w-100 form-control" type="email" required>
				</div>
				<button id="btn_submit" class="btn btn-block btn-yomul" type="submit">비밀번호 초기화</button>
			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
