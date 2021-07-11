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
			location.href = "../customer_qna/write";
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
			<div class="mt-4 mb-2">
			<p>운영시간: 평일 09:00 ~ 18:00</p>
			</div>
			<button type="button" id="btn_question" class="btn btn-yomul px-4 py-2">문의하기</button>
		</div>
		<div class="center">
			<ul class="list font-weight-bold p-0">
				<li class="d-flex justify-content-between">
					<a class="text-decoration-none text-reset" href="/yomul/customer_center">전체</a>
					<c:forEach items="${categories }" var="vo">
						<a class="text-decoration-none text-reset" href="/yomul/customer_center/${vo.getNo() }">${vo.getContent() }</a>
					</c:forEach>
				</li>
				<hr>
				<c:forEach var="vo" items="${faqlist }" varStatus="status">
				<li>
					<a class="text-decoration-none text-reset" data-toggle="collapse" href="#faq${status.index }" aria-expanded="false" aria-controls="#faq${status.index }">${vo.getTitle() }</a>
					<p class="collapse mt-2" id="faq${status.index }">${vo.getContent() }</p>
				</li>
				<hr>
				</c:forEach>
			</ul>
		</div>
	</section>
	
	<!-- FOOTER -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>