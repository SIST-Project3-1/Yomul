<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../admin_header.jsp"%>
	<!--  BODY  -->
	<section id="admin_product_list">
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
								<tr>
									<td>1</td>
									<td><a href="admin_notice_info">정글러</td>
									<td>1972.11.21</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</body>
</html>