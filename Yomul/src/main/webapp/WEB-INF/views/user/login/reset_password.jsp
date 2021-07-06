<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="login">
		<div class="container col-md-6 mt-3">
			<h1 class="mb-3">비밀번호 재설정</h1>
			<form name="join_form">
				<div class="form-group">
					<label for="email">이메일</label>
					<input id="email" name="email" class="w-100 form-control" type="email" required>
				</div>
				<button class="btn btn-block btn-yomul" type="submit">비밀번호 재설정</button>
			</form>
		</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
