<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 목록</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
div.faq {
	width: 80%;
	margin: auto;
}
.admin-faq-list-top {
	display:flex;
}
.admin-faq-list-top a{
	width:80px; height:36px;
	margin:18px 0 0 20px;
}
.admin-faq-list-search {
	margin-left:10px;
}
.container table{
	table-layout: fixed;
}
.container tr{
	text-align: center;
}
.container th, .container td{
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
	line-height: 40px;
}
.container td >span{
	font-weight:bold;
}
div.pagenation {
	display: block;
	text-algin: center;
}
div.faq th, div.faq a.btn {
	white-space: nowrap;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="admin_faq_list">
		<div class="faq">
			<div class="admin-faq-list-top">
				<h2 class="my-3 mx-0">FAQ 관리</h2>
				<a class="btn btn-yomul" href="admin_faq_write" role="button">글쓰기</a>
			</div>
		
			<div class="article">
				<!-- 검색창 -->
				<form action="/yomul/admin_member_list" method="get">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 20; left: 23px; top: 8px;"></label>
						</div>
						<input type="text" class="form-control pl-4 rounded" placeholder="검색" id="search" name="search">
					</div>
				</form>
				
				<!-- FAQ 목록 -->
				<div class="container">
					<div class="row">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="col-sm-1">번호</th>
										<th class="col-sm-2">카테고리</th>
										<th class="col-sm-4">제목</th>
										<th class="col-sm-4">내용</th>
										<th class="col-sm-1">수정</th>
										<th class="col-sm-1">삭제</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${list}">
									<tr>
										<td>${list.no}</td>
										<td>${list.category}</td>
										<td><span>Q.&nbsp;</span>${list.title}</td>
										<td><span>A.&nbsp;</span>${list.content}</td>
										<td><a class="btn btn-yomul" href="admin_faq_update" role="button">수정</a></td>
										<td><a class="btn btn-yomul" href="#" role="button">삭제</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 페이지네이션 -->
			<div class="pagenation">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li id="page-prev" class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li id="page-next" class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>

</body>
</html>