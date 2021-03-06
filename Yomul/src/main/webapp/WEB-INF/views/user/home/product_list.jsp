<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 물건 목록</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var page = 1;
	var search = '${search!=null?search:""}';
	var ajaxFlag = true;

	$(document).ready(function() {
		getData(page);
	});

	// 스크롤 페이징
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		var dHeight = $(document).height();
		var wHeight = $(window).height();
		if (ajaxFlag && (scroll + 800 >= dHeight - wHeight)) {
			getData(++page);
		}
	});

	// 문의 목록 불러오기
	function getData(page) {
		$.ajax({
			url : "/yomul/product_list_ajax",
			method : "get",
			data : {
				"page" : page
				<c:if test="${search != null}">
					, "search" : search
				</c:if>
			},
			success : function(json) {
				if (json.length == 0) {
					ajaxFlag = false;
				}
				var html = "";
				for (var i = 0; i < json.length; i++) {
					product = json[i];
					html += '<div class="near-card-form-card">';
					html += '<div class="card" style="width: 18rem;">';
					html += ' 	<img src="/yomul/upload/' + product.img +'" class="card-img-top">';
					html += ' 	<div class="card-body">';
					html += '	 	<a href="/yomul/product_info?no=' + product.no + '">';
					html += '		    <h5 class="card-title">' + product.title + '</h5>';
					html += '		    <p class="card-text">' + product.content + '</p>';
					html += '	 	</a>';
					html += ' 	</div>';
					html += ' 	<div class="near-card-form-bottom">';
					html += '	    <label>좋아요 ' + product.likes + '</label>';
					html += ' 	</div>';
					html += '</div>';
					html += '</div>';
				}
				$("#near_card_form").append(html);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="product_list">
		<!-- 검색창 -->
		<form action="/yomul/product_list" method="get">
			<div class="input-group mt-3 container">
				<div class="input-group-prepend">
					<label for="search_bar" class="bi bi-search" style="position: relative; z-index: 20; left: 23px; top: 8px;"></label>
				</div>
				<input type="text" class="form-control pl-4 rounded" placeholder="검색" id="search" name="search" value="${search}">
			</div>
		</form>

		<div id="near_card_form" class="near-card-form-content"></div>
	</section>


	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>