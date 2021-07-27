<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 상세</title>
<%@ include file="../../../head.jsp"%>
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
	div.button #btn_list {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}
	div.button #btn_update {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}
	div.button #btn_delete {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}
</style>
<script>
	$(document).ready(function() {
		// 목록 버튼 클릭
		$("#btn_list").click(function() {
			location.href = "../admin_notice_list";
		});
		$("#btn_update").click(function() {
			location.href = "../admin_notice_update/${vo.no }";
		});
		$("#btn_delete").click(function() {
			location.href = "../admin_notice_delete/${vo.no }";
		});
	});
</script>
</head>
<body>
	<%@ include file="../../admin_header.jsp"%>
	
	<section id="notice_info">
		<div>
			<h4 class="font-weight-bold">${vo.getTitle() }</h4>
			<p class="font-weight-bold text-secondary">${vo.getNdate() }</p>
		</div>
		<hr>
		<div class="my-5 mx-0">
			<c:forEach var="fname" items="${files }">
				<img src="/yomul/image/${fname }" class="img-fluid">
			</c:forEach>
				${vo.getContent() }
		</div>
		<hr>
		<div class="button">
			<button type="button" id="btn_list" class="btn btn-yomul d-inline-block font-weight-bold">목록으로 돌아가기</button>
			<button type="button" id="btn_update" class="btn btn-yomul d-inline-block font-weight-bold">수정</button>
			<button type="button" id="btn_delete" class="btn btn-yomul d-inline-block font-weight-bold">삭제</button>
		</div>
	</section>
	
</body>
</html>
