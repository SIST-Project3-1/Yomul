<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
	#notice_list {
		width: 750px;
		margin: 0 auto;
	}
	
	#notice_list .list {
		list-style-type: none;
	}
	
	#notice_list li:hover {
		opacity: 0.5;
	}
	
	#notice_list hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<section id="notice_list">
		<h2 class="my-5 mx-0">공지사항</h2>
		<ul class="list p-0">
			<c:forEach var="vo" items="${list }">
				<li class="p-0 m-0">
					<a class="m-0 text-decoration-none" href="customer_notices/${vo.getNo() }">
						<p class="p-0 m-0 text-body">${vo.getTitle() }</p>
						<p class="text-secondary">${vo.getDate() }</p>
						<hr>
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
