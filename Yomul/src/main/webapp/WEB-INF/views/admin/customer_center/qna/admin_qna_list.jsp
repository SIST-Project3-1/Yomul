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
	
	#admin_qna_list .list {
		list-style-type: none;
	}
	
	#admin_qna_list li:hover {
		cursor: Pointer;
		opacity: 0.5;
	}
	
	#admin_qna_list hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
<script>
	$(document).ready(function() {
		$("li").click(function() {
			location.href = "customer_qna/" + $(this).attr("no");
		})
	});
</script>
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
			<div class="col-5">
				<select class="select form-control pl-1">
					<option value="0">유형</option>
					<option value="1">거래 환불/분쟁 및 사기 신고</option>
					<option value="2">계정 문의</option>
					<option value="3">판매 금지/거래 품목 문의</option>
					<option value="4">매너평가, 매너온도, 거래후기 관련 문의</option>
					<option value="5">게시글 노출, 미노출 문의</option>
					<option value="6">채팅, 알림 문의</option>
					<option value="7">앱 사용/거래 방법 문의</option>
					<option value="8">동네 생활(커뮤니티) 문의</option>
					<option value="9">지역 광고 문의</option>
					<option value="10">비즈프로필(등록, 이용) 문의</option>
					<option value="11">검색 문의</option>
					<option value="12">기타 문의</option>
					<option value="13">오류 제보</option>
					<option value="14">개선/제안</option>
				</select>
			</div>
		</div>
		<ul class="list p-0 mt-3">
			<li no="3">
				<p class="d-inline-block p-0 mb-1 mr-1 text-body">제목~~~~</p>
				<kbd class="bg-yomul">답변대기</kbd>
				<p class="text-secondary">2021.07.02</p>
				<hr>
			</li>
			<li no="2">
				<p class="d-inline-block p-0 mb-1 mr-1 text-body">제목~~~~</p>
				<kbd class="bg-yomul">답변완료</kbd>
				<p class="text-secondary">2021.07.02</p>
				<hr>
			</li>
			<li no="1">
				<p class="d-inline-block p-0 mb-1 mr-1 text-body">제목~~~~</p>
				<kbd class="bg-yomul">답변완료</kbd>
				<p class="text-secondary">2021.07.02</p>
				<hr>
			</li>
		</ul>
	</section>
	
	<!-- FOOTER -->
	<jsp:include page="../../admin_footer.jsp"></jsp:include>
</body>
</html>