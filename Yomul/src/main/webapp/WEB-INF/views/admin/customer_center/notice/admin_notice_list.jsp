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
	width: 750px;
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
}
</style>
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../admin_header.jsp"></jsp:include>
	<!--  BODY  -->
	<section id="admin_notice_list">
		<div class="list">
			<h2 class="my-5 mx-0">공지사항</h2>
			<table class="content_layout">
				<tr>
					<td colspan="3"><a href='/yomul/admin_notice_write'>
							<button type="button" id="btn-yomul" class="btn btn-block btn-yomul">글쓰기</button>
					</a></td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>

				<tr>
					<td>1</td>
					<td><a href='/yomul/admin_notice_info'>글제목이당</a></td>
					<td>1972.11.21</td>
				</tr>
				<hr>
				<!-- 
					
					 -->
			</table>
		</div>
	</section>
</body>
</html>