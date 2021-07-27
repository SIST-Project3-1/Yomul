<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 내 근처 관리</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var page = 1;
	var search = '${search!=null?search:""}';
	var ajaxFlag = true;

	$(document).ready(function() {
		getData(page);
		getData(++page);
	});

	// 스크롤 페이징
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		var dHeight = $(document).height();
		var wHeight = $(window).height();
		if (ajaxFlag && (scroll + 200 >= dHeight - wHeight)) {
			getData(++page);
		}
	});

	// 내 근처 글 목록 불러오기
	function getData(page) {
		$.ajax({
			url : "/yomul/near_home_ajax",
			method : "get",
			data : {
				"page" : page
				<c:if test="${search != null}">
					, "search" : search
				</c:if>
			},
			async : false,
			success : function(json) {
				if (json.length == 0) {
					ajaxFlag = false;
				}
				var html = "";
				for (var i = 0; i < json.length; i++) {
					near = json[i];
					html += '<tr>';
					html += '	<td>';
					html += '		' + near.no;
					html += '	</td>';
					html += '	<td>';
					html += '		' + near.category;
					html += '	</td>';
					html += '	<td>';
					html += '		<a href="/yomul/near_info/' + near.no + '">' + near.title + '</a>';
					html += '	</td>';
					html += '	<td>';
					html += '		<a href="admin_member_list?search=' + near.writer_nickname + '">' + (near.vno == null ? near.writer_nickname : near.vname) + '</a>';
					html += '	</td>';
					html += '	<td>' + near.ndate + '</td>';
					html += '</tr>';
				}
				$("tbody").append(html);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../admin_header.jsp"%>
	<!--  BODY  -->

	<section id="admin_near_home" class="container">
		<div class="container">
			<h2 class="my-3 mx-0">내 근처 관리</h2>

			<!-- 검색창 -->
			<form action="/yomul/admin_near_home" method="get">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 20; left: 23px; top: 8px;"></label>
					</div>
					<input type="text" class="form-control pl-4 rounded" placeholder="검색" id="search" name="search" value="${search}">
				</div>
			</form>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>