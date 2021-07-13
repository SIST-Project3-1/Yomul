<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 문의 내역</title>
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
			<c:forEach var="qna" items="${qnaList}">
				<li>
					<a class="m-0 text-decoration-none" href="customer_qna/${qna.no}">
						<p class="d-inline-block p-0 mb-1 mr-1 text-body">${qna.title}</p>
						<kbd class="bg-yomul">${qna.rdate==null?"답변대기":"답변완료"}</kbd>
						<p class="text-secondary">${qna.wdate}</p>
						<hr>
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>

	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>