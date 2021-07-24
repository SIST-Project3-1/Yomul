<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
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
			url : "/yomul/mypage/favorite_list_ajax",
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
					var favorite = json[i];
					html += '<a href="/yomul/product_info?no='+favorite.no+'" class="text-decoration-none text-dark">';
					html += '<div class="rounded border p-2 m-2">';
					html += '	<div class="row">';
					html += '		<div class="col-md-4 text-center">';
					html += '			<img class="rounded-circle mb-3" src="/yomul/upload/'+favorite.img+'" style="width: 200px; height: 200px;">';
					html += '		</div>';
					html += '		<div class="col-md my-auto">';
					html += '			<h4 class="mb-3">' + favorite.title + '</h4>';
					html += '			<div class="mb-3">';
					html += '				<span>Hwisaek</span>';
					html += '				<span class="border mx-2"></span>';
					html += '				<span>' + favorite.price + '원</span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '</a>';
				}
				$("#favorite_list_content").append(html);
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
		$("#mypage_header_favorite_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="favorite_list" class="mt-3">
		<!--  상세 내역 -->
		<div id="favorite_list_content" class="container p-4 mt-3"></div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>