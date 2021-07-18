<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 QnA 관리</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
a.text-decoration-none:hover {
	opacity: 0.5;
}
</style>
<script type="text/javascript">
	var page = 1;
	var ajaxFlag = true;

	var reply = ${reply};
	var category = ${category};

	$(document).ready(function() {

		getData(page);

		$("#category option[value=" + category + "]").prop("selected", true);
		$("#reply option[value=" + reply + "]").prop("selected", true);

		$("#reply").on("change", function() {
			reply = $("#reply  option:selected").val();
			location.href = "/yomul/admin_qna_list?reply=" + reply + (category != null ? "&category=" + category : "");
		});

		$("#category").on("change", function() {
			category = $("#category option:selected").val();
			location.href = "/yomul/admin_qna_list?category=" + category + (reply != null ? "&reply=" + reply : "");
		});
	});

	// 스크롤 페이징
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		var dHeight = $(document).height();
		var wHeight = $(window).height();
		if (ajaxFlag && (scroll + 200 >= dHeight - wHeight)) {
			getData(++page);
		}
	});

	// 문의 목록 불러오기
	function getData(page) {
		$.ajax({
			url : "/yomul/customer_qna_ajax",
			method : "get",
			data : {
				"page" : page,
				"category" : category,
				"reply" : reply
			},
			success : function(json) {
				if (json.length == 0) {
					ajaxFlag = false;
				}
				var html = "";
				for (var i = 0; i < json.length; i++) {
					qna = json[i];
					html += '<a href="/yomul/admin_qna_info?no=' + qna.no + '" class="text-decoration-none">';
					html += '	<p class="d-inline-block p-0 mb-1 mr-1 text-body">' + qna.title + '</p>';
					if(qna.secret == 'on'){
						html += '<i class="bi bi-lock-fill text-dark"></i>';
					}
					html += '	<kbd class="bg-yomul">' + (qna.rdate == null ? "답변대기" : "답변완료") + '</kbd>';
					html += '	<p class="text-secondary">' + qna.wdate + '</p>';
					html += '</a>';
					html += '<hr>';
				}
				$("#admin_qna_list").append(html);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="admin_qna_list" class="container">
		<h3 class="my-5 mx-0 font-weight-bold">문의 내역 관리</h3>
		<div class="row justify-content-end">
			<div class="col-2">
				<select id="reply" class="select form-control pl-1">
					<option value="">전체</option>
					<option value="0">답변대기</option>
					<option value="1">답변완료</option>
				</select>
			</div>
			<div class="col-5">
				<select id="category" class="select form-control pl-1">
					<option value="">유형</option>
					<c:forEach var="category" items="${categories}">
						<option value="${category.no}"><a href="/yomul/admin_qna_list?">${category.content}</a></option>
					</c:forEach>
				</select>
			</div>
		</div>
	</section>
</body>
</html>