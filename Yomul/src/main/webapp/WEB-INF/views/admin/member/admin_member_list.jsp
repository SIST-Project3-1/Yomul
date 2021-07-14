<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 회원 관리</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
	$(document).ready(function() {
		getMemberList();

		// 하단 버튼 클릭
		$("button.btn-outline-yomul").on("click", function() {
			var no = $("input[name='no']:checked").val();
			var link = $(this).attr("data-link");
			location.href = link + "?no=" + no;
		});
	});

	// 회원 목록 로드
	function getMemberList() {
		$.ajax({
			url : "/yomul/admin_member_list_ajax",
			method : "GET",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				var html = "";
				for (var i = 0; i < result.length; i++) {
					var member = result[i];
					html += '<tr>';
					html += '	<td class="align-middle">';
					html += '		<input type="radio" name="no" value="'+member.no+'"></input>';
					html += '	</td>';
					html += '	<td class="align-middle">' + member.email + '</td>';
					html += '	<td class="align-middle">' + member.nickname + '</td>';
					html += '	<td class="align-middle">' + member.phone + '</td>';
					html += '	<td class="align-middle">' + member.mdate + '</td>';
					html += '	<td class="align-middle">';
					html += '		<button type="button" class="btn btn-sm btn-yomul" data-toggle="modal" data-target="#deleteModal" data-no="'+member.no+'">탈퇴</button>';
					html += '	</td>';
					html += '</tr>';
				}
				$("tbody").html(html);
			}
		});
	}

	// 회원 삭제
	function deleteMember() {

		$.ajax({
			url : "/yomul/admin_delete_member",
			method : "POST",
			data : {
				no : $("#modal-no").text()
			},
			success : function(result) {
				var json = JSON.parse(result);
				if (json.result == 1) {
					alert("회원 삭제 성공");
					location.reload();
				} else {
					alert("회원 삭제 실패");
				}
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../admin_header.jsp"%>

	<!--  BODY  -->
	<section id="admin_member_list">
		<div class="container">
			<h2 class="my-3 mx-0">회원 관리</h2>

			<!-- 검색창 -->
			<form action="/yomul/admin_member_list" method="get">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 20; left: 23px; top: 8px;"></label>
					</div>
					<input type="text" class="form-control pl-4 rounded" placeholder="검색" id="search" name="search">
				</div>
			</form>


			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th scope="col" class="align-middle"></th>
						<th scope="col" class="align-middle">E-mail</th>
						<th scope="col" class="align-middle">닉네임</th>
						<th scope="col" class="align-middle">전화번호</th>
						<th scope="col" class="align-middle">가입일</th>
						<th scope="col" class="align-middle">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="align-middle">
							<input type="radio" name="no" value="Q1"></input>
						</td>
						<td class="align-middle">123@naver.com</td>
						<td class="align-middle">정글차이</td>
						<td class="align-middle">정글러</td>
						<td class="align-middle">010-0000-0000</td>
						<td class="align-middle">1972.11.21</td>
						<td class="align-middle">
							<button type="button" class="btn btn-sm btn-yomul" data-toggle="modal" data-target="#deleteModal" data-no="Q1">탈퇴</button>
						</td>
					</tr>
				</tbody>
			</table>

		</div>
	</section>

	<br>
	<br>
	<nav class="navbar navbar-expand-sm bg-white fixed-bottom bg-white border-top">
		<div class="collapse navbar-collapse" id="navbarText"></div>
		<ul class="navbar-nav">
			<li class="nav-item">
				<button type="button" class="btn btn-outline-yomul" data-link="/yomul/admin_product_list">물건보기</button>
			</li>
			<li class="nav-item">
				<button type="button" class="btn btn-outline-yomul" data-link="/yomul/admin_town_list">동네생활 글 보기</button>
			</li>
			<li class="nav-item">
				<button type="button" class="btn btn-outline-yomul" data-link="/yomul/admin_near_home">내근처 글 보기</button>
			</li>
		</ul>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<span id="modal-no" class="modal-no"></span>번 회원을 삭제하시겠습니까?
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-yomul" onclick="deleteMember()">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#deleteModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var no = button.data('no');
			var modal = $(this);
			modal.find('.modal-no').text(no);
			modal.find('.modal-body input').val(no);
		});
	</script>
</body>
</html>