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
	width: 1200px;
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

div.button #btn_product {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}

div.button #btn_town {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}

div.button #btn_near {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}

div.button #btn_delete {
	background-color: rgb(255, 99, 95);
	color: white;
	border-radius: 10px;
	border: 2px solid white;
	display: block;
}

div.list th, div.list a.btn {
	white-space: nowrap;
}
</style>
<%@ include file="../../head.jsp"%>
<script>
	$(document).ready(function() {
		// 목록 버튼 클릭
		$("#btn_product").click(function() {
			location.href = "admin_product_list";
		});
		$("#btn_town").click(function() {
			location.href = "admin_town_list";
		});
		$("#btn_near").click(function() {
			location.href = "admin_near_home";
		});
		$("#btn_delete").click(function() {
			location.href = "admin_member_list";
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../admin_header.jsp"%>
	<!--  BODY  -->


	<section id="admin_member_list">
		<div class="list">
			<div class="article">
				<div class="container">

					<!-- 검색창 -->
					<div class="near-home-search">
						<form class="form-inline ml-auto">
							<label for="search_bar" class="bi bi-search"
								style="position: relative; z-index: 20; left: 23px;"></label>
							<div class="input-group flex-nowrap">
								<input class="form-control mr-sm-2 pl-4" type="search"
									placeholder="검색" size="60">
							</div>
						</form>
					</div>

					<h2 class="my-5 mx-0">회원 관리</h2>
					<div class="row">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th></th>
										<th>E-mail</th>
										<th>닉네임</th>
										<th>이름</th>
										<th>전화번호</th>
										<th>가입일</th>
									</tr>
								</thead>
								<tr>
									<td><input type="radio" name="chk_id"></input></td>
									<td>123@naver.com</td>
									<td>정글차이</td>
									<td>정글러</td>
									<td>010-0000-0000</td>
									<td>1972.11.21</td>
								</tr>
								</tbody>
							</table>
							<table>
								<td><div class="button">
										<button type="button" id="btn_product"
											class="btn btn-block btn-yomul">물건보기</button>
									</div></td>
								<td><div class="button">
										<button type="button" id="btn_town"
											class="btn btn-block btn-yomul">동네생활 글 보기</button>
									</div></td>
								<td><div class="button">
										<button type="button" id="btn_near"
											class="btn btn-block btn-yomul">내근처 글 보기</button>
									</div></td>
								<td><div class="button">
										<button type="button" id="btn_delete"
											class="btn btn-block btn-yomul">삭제</button>
									</div></td>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
</body>
</html>