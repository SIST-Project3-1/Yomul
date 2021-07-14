<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<!-- HEAD -->
<%@ include file="../head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form_check_pw").on("submit", function(e) {
			e.preventDefault();

			$.ajax({
				url : "${ajaxLink}",
				method : "POST",
				data : new FormData(this), // 필수
				processData : false, // 필수 
				contentType : false, // 필수
				success : function(result) {
					if (result == 1) {
						alert("${successMsg}");
						location.href = "${successLink}";
					} else {
						alert("${failMsg}");
					}
				}
			});
			return false;
		})
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="header.jsp"%>

	<!--  BODY  -->
	<section id="check_pw">
		<form id="form_check_pw">
			<c:forEach var="data" items="${formData}">
				<input type="hidden" name="${data.key}" value="${data.value}">
			</c:forEach>
			<div class="container mt-4" style="width: 800px;">
				<h2 class="mb-3 text-center">
					<strong>${bodyMsg}</strong>
				</h2>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" required>
				</div>
				<div class="text-center mt-5 row">
					<button type="submit" class="btn btn-lg btn-yomul col-lg mr-lg-3">${btnName}</button>
					<a href="${cancleLink}" class="btn btn-lg btn-outline-yomul col-lg ml-lg-3">취소</a>
				</div>
			</div>
		</form>
	</section>

	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>
</body>
</html>