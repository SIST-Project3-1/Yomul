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
#admin_member_list {
	width: 750px;
	margin: 0 auto;
}

#admin_member_list .list {
	list-style-type: none;
}

#admin_member_list li:hover {
	opacity: 0.5;
}

#admin_member_list hr {
	border-width: 1px 0 0 0;
	border-color: lightgray;
	margin: 25px 0;
}
div.button #btn-yomul {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}
</style>
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<!--  BODY  -->
	<section id="admin_member_list">
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
			<h2 class="my-5 mx-0">사용자 관리</h2>
			<table class="content_layout">
				<tr>
					<th></th>
					<th>E-mail</th>
					<th>닉네임</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>가입일</th>
				</tr>

				<tr>
					<td><input type="radio" name="chk_id"></input></td>
					<td>123@naver.com</td>
					<td>정글차이</td>
					<td>정글러</td>
					<td>010-0000-0000</td>
					<td>1972.11.21</td>
				</tr>
				<hr>
				<!-- 
					
					 -->
			</table>
		</div>
		<table>
		<td><div class="button">
			<button type="button" id="btn-yomul"class="btn btn-block btn-yomul">물건보기</button>
		</div></td>
		<td><div class="button">
			<button type="button" id="btn-yomul"class="btn btn-block btn-yomul">글 보기</button>
		</div></td>
		<td><div class="button">
			<button type="button" id="btn-yomul"class="btn btn-block btn-yomul">삭제</button>
		</div></td>
		</table>
	</section>
</body>
</html>