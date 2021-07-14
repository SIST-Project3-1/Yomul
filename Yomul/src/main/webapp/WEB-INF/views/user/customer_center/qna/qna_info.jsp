<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${qna.title }</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
#qna_info {
	width: 750px;
	margin: 50px auto;
}

#qna_info hr {
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
	<section id="qna_info">
		<div>
			<h4 class="d-inline-block font-weight-bold">${qna.title}</h4>
			<p class="font-weight-bold text-secondary">${qna.wdate}</p>
		</div>
		<hr>
		<div class="my-5 mx-0">
			<c:forEach var="img" items="${images}">
				<div>
					<img alt="" src="/yomul/upload/${img.getSavedFilename() }">
				</div>
			</c:forEach>
			${qna.content}
		</div>
		<hr>
		<c:if test="${qna.rdate !=null }">
			<div class="my-5 mx-0">
				<h4 class="font-weight-bold">답변</h4>
				<p class="font-weight-bold text-secondary">${qna.rdate}</p>
				<div>${qna.rcontent}</div>
			</div>
			<hr>
		</c:if>
		<div class="text-center">
			<a class="btn btn-yomul px-3 font-weight-bold" href="/yomul/qna_delete/${qna.no}">삭제</a>
			<a class="btn btn-yomul px-3 font-weight-bold" href="/yomul/customer_qna">목록</a>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>