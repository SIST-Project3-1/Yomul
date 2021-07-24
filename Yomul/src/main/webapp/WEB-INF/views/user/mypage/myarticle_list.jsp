<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글</title>
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
			url : "/yomul/mypage/myarticle_list_ajax",
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
					var article = json[i];
					html += '<a href="/yomul/near_info/'+article.no+'" class="d-block text-dark text-decoration-none">';
					html += '	<h4>' + article.title + '</h4>';
					html += '	<p>' + article.content + '</p>';
					html += '	<span id="article_author">' + article.writer_nickname + '</span>';
					html += '	<span class="border mx-2"></span>';
					html += '	<span id="article_date">' + article.ndate + '</span>';
					html += '	<span class="border mx-2"></span>';
					html += '	<span id="article_comment_count">댓글 ' + article.comments + '</span>';
					html += '	<span class="border mx-2"></span>';
					html += '	<span id="article_hit_count">조회 ' + article.hits + '</span>';
					html += '</a>';
					html += '<hr>';
				}
				$("#myarticle_list").append(html);
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
		$("#mypage_header_myarticle").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#mypage_header_myarticle_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="myarticle_list" class="mt-3 container"></section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>