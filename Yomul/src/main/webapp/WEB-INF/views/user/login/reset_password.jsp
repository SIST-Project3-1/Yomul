<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 비밀번호 재설정</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="login">
		<div class="container col-md-6 mt-3">
			<h1 class="mb-3">비밀번호 재설정</h1>
			<form id="form_reset_password" action="reset_password_proc" method="get">
				<div class="form-group">
					<label for="email">
						이메일 <small class="text-yomul">임시 비밀번호를 발급하여 이메일로 전송합니다.</small>
					</label>
					<input  name="from" class="w-100 form-control" type="email" value="아이디" style="display:none;">
					<input  id="email" name="to" class="w-100 form-control" type="email" required>
					<input  name="subject" class="w-100 form-control" type="hidden" value="관리자">
					<input  name="contents" class="w-100 form-control" type="hidden" value="새비밀번호">
				</div>
				<button id="btn_submit" class="btn btn-block btn-yomul" type="submit">비밀번호 재설정</button>
			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>
