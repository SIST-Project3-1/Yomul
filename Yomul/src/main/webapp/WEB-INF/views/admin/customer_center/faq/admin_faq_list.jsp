<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 목록</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
<style>
div.faq {
	width: 80%;
	margin: auto;
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
	<jsp:include page="../../admin_header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="sample">
		<div class="faq">
			<div class="article">
				<div class="container">
					<a class="btn btn-yomul" href="admin_faq_write" role="button">글쓰기</a>
					<div class="row">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>키워드</th>
										<th>제목</th>
										<th>내용</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tr>
									<td>1</td>
									<td>운영정책</td>
									<td>커뮤니티 가이드라인</td>
									<td>당근마켓은 동네 이웃간의 연결을 도와 따듯하고 활발한 교류가 있는 지역사회를 만들기 위해 노력하고
										있어요</td>
									<td><a class="btn btn-yomul" href="admin_faq_update"
										role="button">수정</a></td>
									<td><a class="btn btn-yomul" href="#" role="button">삭제</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td>운영정책</td>
									<td>커뮤니티 가이드라인</td>
									<td>당근마켓은 동네 이웃간의 연결을 도와 따듯하고 활발한 교류가 있는 지역사회를 만들기 위해 노력하고
										있어요</td>
									<td><a class="btn btn-yomul" href="admin_faq_update"
										role="button">수정</a></td>
									<td><a class="btn btn-yomul" href="#" role="button">삭제</a></td>
								</tr>
								</tbody>
							</table>
							<div class="pagenation">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1">이전</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">다음</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>