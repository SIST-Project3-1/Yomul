<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
	#qna_list {
		width: 750px;
		margin: 0 auto;
	}
	
	#qna_list .list {
		list-style-type: none;
	}
	
	#qna_list li:hover {
		opacity: 0.5;
	}
	
	#qna_list hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../header.jsp"%>
	
	<!--  BODY  -->
	<section id="qna_list">
		<h3 class="my-5 mx-0 font-weight-bold">문의 내역</h3>
		<ul class="list p-0">
			<li class="p-0 m-0">
				<a class="m-0 text-decoration-none" href="customer_qna/1">
					<p class="d-inline-block p-0 mb-1 mr-1 text-body">제목~~~~</p>
					<kbd class="bg-yomul">답변대기</kbd>
					<p class="text-secondary">2021.07.02</p>
					<hr>
				</a>
			</li>
			<li>
				<a class="m-0 text-decoration-none" href="customer_qna/1">
					<p class="d-inline-block p-0 mb-1 mr-1 text-body">제목~~~~</p>
					<kbd class="bg-yomul">답변완료</kbd>
					<p class="text-secondary">2021.07.02</p>
					<hr>
				</a>
			</li>
			<li>
				<a class="m-0 text-decoration-none" href="customer_qna/1">
					<p class="d-inline-block p-0 mb-1 mr-1 text-body">제목~~~~</p>
					<kbd class="bg-yomul">답변완료</kbd>
					<p class="text-secondary">2021.07.02</p>
					<hr>
				</a>
			</li>
		</ul>
	</section>
	
	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>