<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 업체 관리 - 후기</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<style>
.container th, .container td{
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
	line-height: 40px;
}
#td_content{
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
}
#td_content a{
    text-decoration:none;
    color:black;
}
#td_content a:hover{
    color:rgb(255, 99, 95);
}
</style>
<script>
	$(document).ready(function() {
		var page = ${page};
		var search = '${search!=null?search:""}';
		
		loadReviewsList(page, search);
		loadPagination(page, search);

	});

	function loadPagination(page, search) {
		var total = ${totalPage};
		var start = (page % 10 == 0) ? (Math.floor(page / 10) - 1) * 10 + 1 : Math.floor(page / 10) * 10 + 1;
		var end = (start + 9 > total) ? total : page + 9;
		var html = "";
		for (var i = start; i <= end && i <= total; i++) {
			html += '<li id="' + i + '" class="page-item">';
			html += '<a class="page-link" href="/yomul/admin_reviews_list?page=' + i + '&search=' + search + '">' + i + '</a>';
			html += '</li>';
		}
		$("#page-prev").after(html);

		$("li#" + page + ".page-item").addClass("active");
		$("#page-prev a").attr("href", "?page=" + ((start - 10 <= 0) ? 1 : start - 10));
		$("#page-next a").attr("href", "?page=" + ((start + 10 > total) ? total : (start + 10)));
	}

	// 후기 목록 로드
	function loadReviewsList(page, search) {
		$.ajax({
			url : "/yomul/admin_reviews_list_ajax",
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
					var reviews = result[i];
					html += '<tr>';
					html += '	<td>' + reviews.no + '</td>';
					html += '	<td>' + reviews.vendor_no + '</td>';
					html += '	<td>' + reviews.vendorname + '</td>';
					html += '	<td>' + reviews.member_no + '</td>';
					html += '	<td>' + reviews.nickname + '</td>';
					html += '	<td id="td_content"><a href="reviews_info/'+ reviews.no +'">' + reviews.content + '</a></td>';
					html += '	<td>';
					html += '		<button type="button" class="btn btn-sm btn-yomul" data-toggle="modal" data-target="#deleteModal" data-no="'+ reviews.no +'">삭제</button>';
					html += '	</td>';
					html += '</tr>';
				}
				$("tbody").html(html);
			}
		});
	}

	// 후기 삭제
	function deleteVendor() {

		$.ajax({
			url : "/yomul/admin_delete_reviews",
			method : "POST",
			data : {
				no : $("#modal-no").text()
			},
			success : function(result) {
				var json = JSON.parse(result);
				if (json.result == 1) {
					alert("후기 삭제 성공");
					location.reload();
				} else {
					alert("후기 삭제 실패");
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
			<h2 class="my-3 mx-0">후기 관리</h2>

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
						<th class="col-sm-1">글번호</th>
						<th class="col-sm-1">업체번호</th>
						<th class="col-sm-2">업체명</th>
						<th class="col-sm-1">회원번호</th>
						<th class="col-sm-2">작성자</th>
						<th class="col-sm-3">내용</th>
						<th class="col-sm-1">삭제</th>
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

	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<span id="modal-no" class="modal-no"></span>번 후기를 삭제하시겠습니까?
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
