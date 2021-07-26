<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 목록</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
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
			url : "/yomul/vendor_news_pagination",
			method : "get",
			data : {
				"no" : $("#vendor_no").val(),
				"page" : page
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(json) {
				if (json.length == 0) {
					ajaxFlag = false;
				}
				var html = "";
				for (var i = 0; i < json.length; i++) {
					vo = json[i];
					console.log(vo.img);
					html += "<div class='media' id='vendor-news-list-news'>";
					if (vo.img == "__") {
						html += "<img src='/yomul/upload/default.jpg' class='mr-3'>";
					} else {
						html += "<img src='/yomul/upload/" + "default.jpg" + "' class='mr-3'>";
					}
					html += "<div class='media-body'>";
					html += "<a href='/yomul/near_info/" + vo.no + "' class='vendor-news-list-info'>";
					html += "    <h5 class='mt-0' style='padding-top:5px;'>" + vo.title + "</h5>";
					html += "	<p>" + vo.content + "</p>";
					html += "</a>";
					html += "<label>조회 " + vo.hits + "</label>";
					html += "<label class='near-info-point' style='color:lightgray;'>·</label>";
					html += "<label>좋아요 " + vo.likes + "</label>";
					html += "</div>";
					<c:if test="${owner == sessionScope.member.no }">
					html += "<div class='vendor_news_list_update'>";
					html += "	<a href='/yomul/vendor_news_update/" + vo.no + "'>수정</a>";
					html += "</div>";
					</c:if>
					html += "</div>";
				}

				$("#vendor_news_list").append(html).trigger("create");
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<c:import url="vendor_header.jsp" />
	<script type="text/javascript">
		$("#vendor_header_news").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_news_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<input type="hidden" id="vendor_no" value="${no }">
	<div id="vendor_news_list" class="vendor-news-list-content" style="padding-bottom: 100px;">
		<c:forEach var="vo" items="${list }">
			<div class="media" id="vendor-news-list-news">
				<img src="/yomul/upload/default.jpg" class="mr-3">
				<div class="media-body">
					<a href="/yomul/near_info/${vo.no }" class="vendor-news-list-info">
						<h5 class="mt-0" style="padding-top: 5px;">${vo.title }</h5>
						<p>${vo.content }</p>
					</a>
					<label>조회 ${vo.hits }</label>
					<label class="near-info-point" style="color: lightgray;">·</label>
					<label>좋아요 ${vo.likes }</label>
				</div>
				<c:if test="${owner == sessionScope.member.no }">
					<div class="vendor_news_list_update">
						<a href="/yomul/vendor_news_update/${vo.no }">수정</a>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>