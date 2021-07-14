<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
	#qna_info {
		width: 750px;
		margin: 50px auto;
	}
	
	#qna_info hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
<script>
	$(document).ready(function() {
		// 목록 버튼 클릭
		$("#btn_list").click(function() {
			location.href = "../customer_qna";
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../header.jsp"%>
	
	<!--  BODY  -->
	<section id="qna_info">
		<div>
			<h4 class="d-inline-block font-weight-bold">제모옥~~~</h4>
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
		<div class="my-5 mx-0">
			<h4 class="d-inline-block font-weight-bold">답변드립니다~</h4>
			<p class="d-inline-block font-weight-bold text-secondary">2021.07.04</p>
			<div>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			</div>
		</div>
		<hr>
		<div class="text-center">
			<button type="button" id="btn_list" class="btn btn-yomul d-inline-block px-3 font-weight-bold">목록으로 돌아가기</button>
		</div>
	</section>
	
	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>