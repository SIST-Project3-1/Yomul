<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 목록</title>
<!-- HEAD -->
<style>
#admin_notice_list {
	width: 1200px;
	margin: 0 auto;
}

#admin_notice_list .list {
	list-style-type: none;
}

#admin_notice_list li:hover {
	opacity: 0.5;
}

#admin_notice_list hr {
	border-width: 1px 0 0 0;
	border-color: lightgray;
	margin: 25px 0;
}

#admin_notice_list .noticeList {
	padding: 25px 80px;
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 20px;
	border: 2px solid white;
	display: block;
}

div.list #btn-yomul {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
	width: 200px;
}
</style>
<%@ include file="../../../head.jsp"%>
<script>
		var page = ${page};
	$(document).ready(function() {
		loadPagination(page);
		//버튼 클릭
		$("#btn-yomul").click(function() {
			location.href = "admin_notice_write";
		});
	});
	
	function loadPagination(page) {
		var total = ${total};
		var start = (page % 10 == 0) ? (Math.floor(page / 10) - 1) * 10 + 1 : Math.floor(page / 10) * 10 + 1;
		var end = (start + 9 > total) ? total : page + 9;
		var html = "";
		for (var i = start; i <= end && i <= total; i++) {
			html += '<li id="' + i + '" class="page-item">';
			html += '<a class="page-link" href="/yomul/admin_notice_list?page=' + i + '">' + i + '</a>';
			html += '</li>';
		}
		$("#page-prev").after(html);

		$("li#" + page + ".page-item").addClass("active");
		$("#page-prev a").attr("href", "?page=" + ((start - 10 <= 0) ? 1 : start - 10));
		$("#page-next a").attr("href", "?page=" + ((start + 10 > total) ? total : (start + 10)));
	};
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>
	<!--  BODY  -->
	<section id="admin_notice_list">
		<div class="list">
			<div class="article">
				<div class="container">

					<h2 class="my-5 mx-0">공지사항 관리</h2>
					<div class="row">
						<div class="table-responsive">
							<a href="/yomul/admin_notice_write">
								<button type="button" id="btn-yomul"
									class="btn btn-block btn-yomul">글쓰기</button>
							</a>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo" items="${list }">
									<tr>
										<td>${vo.getNo() }</td>
										<td class="p-0 m-0 text-body"><a
											href="admin_notice/${vo.getNo() }">${vo.getTitle() }</a></td>
										<td class="text-secondary">${vo.getNdate() }</td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
			<!-- 페이지네이션 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li id="page-prev" class="page-item">
				<a class="page-link" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li id="page-next" class="page-item">
				<a class="page-link" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
	</section>
</body>
</body>
</html>