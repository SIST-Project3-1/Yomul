<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<style>
	#notice_info {
		width: 750px;
		margin: 50px auto;
	}
	
	#notice_info hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<section id="notice_info">
		<div>
			<h4 class="font-weight-bold">제모옥~~~</h4>
			<p class="font-weight-bold text-secondary">2021.07.02</p>
		</div>
		<hr>
		<div class="my-5 mx-0">
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
		</div>
		<hr>
		<div class="text-center">
			<button class="btn btn-yomul d-inline-block font-weight-bold">목록으로 돌아가기</button>
		</div>
	</section>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
