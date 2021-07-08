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
#admin_near_home {
	width: 750px;
	margin: 0 auto;
}

#admin_near_home .list {
	list-style-type: none;
}

#admin_near_home li:hover {
	opacity: 0.5;
}

#admin_near_home hr {
	border-width: 1px 0 0 0;
	border-color: lightgray;
	margin: 25px 0;
}

</style>
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<!--  BODY  -->

	<section id="admin_near_home">
			<!-- 검색창 -->
		<div class="near-home-search">
			<form class="form-inline ml-auto">
				<label for="search_bar" class="bi bi-search" style="position:relative; z-index:20; left:23px;"></label>
				<div class="input-group flex-nowrap">
					<input class="form-control mr-sm-2 pl-4" type="search" placeholder="검색" size="60">
				</div>
			</form>	
		</div>
	
		<div class="list">
			<h2 class="my-5 mx-0">내근처</h2>
			<table class="content_layout">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>

				<tr>
					
					<td><a href="admin_near_info">제목</a></td>
					<td><a href="admin_member_list">정글러</a></td>
					<td>1972.11.21</td>
				</tr>
				<hr>
				<!-- 
					
					 -->
			</table>
	</section>
</body>
</html>