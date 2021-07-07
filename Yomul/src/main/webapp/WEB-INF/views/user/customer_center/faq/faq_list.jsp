<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 FAQ</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
<style>
	#faq_list {
		width: 1120px;
		margin: 0 auto;
	}
	
	#faq_list .top {
		padding: 60px 100px;
		background-color: rgb(255, 208, 206);
	}
	
	#faq_list .center {
		width: 900px;
		margin: 20px auto;
	}

	#faq_list .list {
		list-style-type: none;
	}
	
	#faq_list hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 20px 0;
	}
</style>
<script>
	$(document).ready(function() {
		// 문의하기 버튼 클릭
		$("#btn_question").click(function() {
			location.href = "customer_qna/write";
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<!--  BODY  -->
	<section id="faq_list">
		<div class="top">
			<h4 class="font-weight-bold">고객센터</h4>
			운영시간 어쩌구저쩌구~~<br>
			<button type="button" id="btn_question" class="btn btn-yomul px-4 py-2">문의하기</button>
		</div>
		<div class="center">
			<ul class="list p-0">
				<li class="font-weight-bold">
					<a class="text-decoration-none text-reset" href="#전체">전체</a>
					<a class="text-decoration-none text-reset" href="#">카테고리~</a>
					<a class="text-decoration-none text-reset" href="#">카테고리~</a>
				</li>
				<hr>
				<li>
					<a class="text-decoration-none text-reset" data-toggle="collapse" href="#faq1" aria-expanded="false" aria-controls="#faq1">faq 제목~~~~~~</a>
					<p class="collapse" id="faq1">faq 상세~</p>
				</li>
				<hr>
				<li>
					<a class="text-decoration-none text-reset" data-toggle="collapse" href="#faq2" aria-expanded="false" aria-controls="#faq2">faq 제목~~~~~~</a>
					<p class="collapse" id="faq2">faq 상세~</p>
				</li>
				<hr>
			</ul>
		</div>
	</section>
	
	<!-- FOOTER -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>