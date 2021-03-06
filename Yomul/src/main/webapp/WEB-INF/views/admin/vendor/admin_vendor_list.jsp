<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 업체 관리</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
	$(document).ready(function() {
		var page = ${page};
		var search = '${search!=null?search:""}';
		
		loadVendorList(page, search);
		loadPagination(page, search);

		// 하단 버튼 클릭
		$("button.btn-outline-yomul").on("click", function() {
			var nickname = $("input[name='no']:checked").val();
			var link = $(this).attr("data-link");
			location.href = link + "?search=" + nickname;
		});
	});

	function loadPagination(page, search) {
		var total = ${totalPage};
		var start = (page % 10 == 0) ? (Math.floor(page / 10) - 1) * 10 + 1 : Math.floor(page / 10) * 10 + 1;
		var end = (start + 9 > total) ? total : page + 9;
		var html = "";
		for (var i = start; i <= end && i <= total; i++) {
			html += '<li id="' + i + '" class="page-item">';
			html += '<a class="page-link" href="/yomul/admin_vendor_list?page=' + i + '&search=' + search + '">' + i + '</a>';
			html += '</li>';
		}
		$("#page-prev").after(html);

		$("li#" + page + ".page-item").addClass("active");
		$("#page-prev a").attr("href", "?page=" + ((start - 10 <= 0) ? 1 : start - 10));
		$("#page-next a").attr("href", "?page=" + ((start + 10 > total) ? total : (start + 10)));
	}

	// 업체 목록 로드
	function loadVendorList(page, search) {
		$.ajax({
			url : "/yomul/admin_vendor_list_ajax",
			method : "GET",
			data : {
				"page" : page
				<c:if test="${search != null}">
				, "search" : search
				</c:if>
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				var html = "";
				for (var i = 0; i < result.length; i++) {
					var vendor = result[i];
					html += '<tr>';
					html += '	<td class="align-middle">';
					html += '		<input type="radio" name="no" value="'+vendor.name+'"></input>';
					html += '	</td>';
					html += '	<td class="align-middle">' + vendor.no + '</td>';
					html += '	<td class="align-middle">' + vendor.owner + '</td>';
					html += '	<td class="align-middle">' + vendor.name + '</td>';
					html += '	<td class="align-middle">' + vendor.category + '</td>';
					html += '	<td class="align-middle">' + vendor.tel + '</td>';
					html += '	<td class="align-middle">' + vendor.addr + '</td>';
					html += '	<td class="align-middle">' + vendor.customers + '</td>';
					html += '	<td class="align-middle">';
					html += '		<button type="button" class="btn btn-sm btn-yomul" data-toggle="modal" data-target="#deleteModal" data-no="' + vendor.no + '" '+ (vendor.withdrawal == 0 ? 'disabled' : '') +'>탈퇴</button>';
					html += '	</td>';
					html += '</tr>';
				}
				$("tbody").html(html);
			}
		});
	}

	// 업체 삭제
	function deleteVendor() {
		$.ajax({
			url : "/yomul/admin_delete_vendor",
			method : "POST",
			data : {
				no : $("#modal-no").text()
			},
			success : function(result) {
				var json = JSON.parse(result);
				if (json.result == 1) {
					alert("업체 삭제 성공");
					location.reload();
				} else {
					alert("업체 삭제 실패");
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
			<h2 class="my-3 mx-0">업체 관리</h2>

			<!-- 검색창 -->
			<form action="/yomul/admin_vendor_list" method="get">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 20; left: 23px; top: 8px;"></label>
					</div>
					<input type="text" class="form-control pl-4 rounded" placeholder="검색" id="search" name="search" value="${search }">
				</div>
			</form>


			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th scope="col" class="align-middle"></th>
						<th scope="col" class="align-middle">업체번호</th>
						<th scope="col" class="align-middle">회원번호</th>
						<th scope="col" class="align-middle">업체명</th>
						<th scope="col" class="align-middle">카테고리</th>
						<th scope="col" class="align-middle">전화번호</th>
						<th scope="col" class="align-middle">주소</th>
						<th scope="col" class="align-middle">단골</th>
						<th scope="col" class="align-middle">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 들어갈 자리 -->
				</tbody>
			</table>
		</div>
	</section>

	<!-- 페이지네이션 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li id="page-prev" class="page-item">
				<a class="page-link" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li id="page-next" class="page-item">
				<a class="page-link" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>

	<br>
	<br>
	<nav class="navbar navbar-expand-sm bg-white fixed-bottom bg-white border-top">
		<div class="collapse navbar-collapse" id="navbarText"></div>
		<ul class="navbar-nav">
			<li class="nav-item">
				<button type="button" class="btn btn-outline-yomul ml-2" data-link="/yomul/admin_near_home">소식 보기</button>
			</li>
			<li class="nav-item">
				<button type="button" class="btn btn-outline-yomul ml-2" data-link="/yomul/admin_reviews_list">후기 보기</button>
			</li>
		</ul>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<span id="modal-no" class="modal-no"></span>번 업체를 삭제하시겠습니까?
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-yomul" onclick="deleteVendor()">삭제</button>
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
