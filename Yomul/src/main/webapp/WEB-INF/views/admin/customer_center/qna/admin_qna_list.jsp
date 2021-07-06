<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
<style>
	#admin_qna_list {
		width: 750px;
		margin: 0 auto;
	}
	
	#admin_qna_list .select {
		width: 105px;
	}
	
	#admin_qna_list .list {
		list-style-type: none;
	}
	
	#admin_qna_list li:hover {
		opacity: 0.5;
	}
	
	#admin_qna_list hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../admin_header.jsp"></jsp:include>
	
	<!--  BODY  -->
	<section id="admin_qna_list">
		<h3 class="my-5 mx-0 font-weight-bold">문의 내역 관리</h3>
		<div class="row justify-content-end">
			<div class="col-2">
				<select class="select form-control pl-1">
					<option value="all">전체</option>
					<option value="wait">답변대기</option>
				</select>
			</div>
			<div class="col-2">
				<select class="select form-control pl-1">
					<option value="all">유형</option>
					<option value="wait">답변대기</option>
				</select>
			</div>
		</div>
		<ul class="list p-0 mt-3">
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
	<jsp:include page="../../admin_footer.jsp"></jsp:include>
</body>
</html>