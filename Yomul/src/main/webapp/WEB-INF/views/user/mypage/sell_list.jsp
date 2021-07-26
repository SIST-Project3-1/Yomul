<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 목록</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var page = 1;
	var ajaxFlag = true;

	$(document).ready(function() {
		getData(page);
	});

	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		var dHeight = $(document).height();
		var wHeight = $(window).height();
		if (ajaxFlag && (scroll + 200 >= dHeight - wHeight)) {
			getData(++page);
		}
	});

	function getData(page) {
		$.ajax({
			url : "/yomul/mypage/sell_list_ajax",
			method : "get",
			data : {
				"page" : page
			},
			success : function(json) {
				if (json.length == 0) {
					ajaxFlag = false;
				}
				var html = "";
				for (var i = 0; i < json.length; i++) {
					var product = json[i];
					html += '<div class="rounded border p-2 my-4">';
					html += '<h4>';
					html += '	<span>' + product.pdate + '</span>';
					html += '	<span>' + product.no + ' </span>';
					html += '	<span>' + (product.state == "SOLD" ? "판매완료" : "판매중") + '</span>';
					html += '</h4>';
					html += '<hr>';
					html += '<div class="row">';
					html += '	<div class="col-md-4 text-center">';
					html += '		<img class="rounded-circle mb-3" src="/yomul/upload/' + (product.img == null ? "default.jpg" : product.img) + '" style="width: 200px; height: 200px;">';
					html += '	</div>';
					html += '	<div class="col-md my-auto">';
					html += '		<a href="/yomul/product_info?no=' + product.no + '" class="text-decoration-none text-dark">';
					html += '			<h4 class="mb-3">' + product.title + '</h4>';
					html += '			<div class="mb-3">';
					html += '				<span>${sessionScope.member.nickname}</span>';
					html += '				<span class="border mx-2"></span>';
					html += '				<span>' + product.price + '원</span>';
					html += '			</div>';
					html += '		</a>';
					html += '	</div>';
					html += '</div>';
					html += '</div>';
				}
				$("#sellListContent").append(html);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<%@include file="mypage_header.jsp"%>
	<script type="text/javascript">
		$("#mypage_header_order_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#mypage_header_sell_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="sell_list" class="mt-3">
		<div class="d-flex justify-content-around container rounded border p-4" style="height: 100%; display: flex; align-items: center;">
			<div class="text-center">
				<h3 class="font-weight-bold">판매중</h3>
				<h5>${sellingCount}</h5>
			</div>
			<div>
				<h2>
					<i class="bi bi-chevron-right"></i>
				</h2>
			</div>
			<div class="text-center">
				<h3 class="font-weight-bold">판매완료</h3>
				<h5>${soldCount}</h5>
			</div>
		</div>

		<!--  상세 내역 -->
		<div id="sellListContent" class="container px-0">
			<div class="rounded border p-2 my-4">
				<h4>
					<span>2021년 07월 04일 </span>
					<span>1241234 </span>
					<span>판매완료</span>
				</h4>
				<hr>
				<div class="row">
					<div class="col-md-4 text-center">
						<img class="rounded-circle mb-3" src="/yomul/upload/default.jpg" style="width: 200px; height: 200px;">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>