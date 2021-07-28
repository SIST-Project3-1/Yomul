<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
var page = 1;
var ajaxFlag = true;

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
		url : "/yomul/vendor_reviews_pagination",
		method : "get",
		data : {
			"no" : $("#vendor_no").val(),
			"page" : page
		},
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success : function(json) {
			if (json.length == 0) {
				ajaxFlag = false;
			}
			var html = "";
			for (var i = 0; i < json.length; i++) {
				vo = json[i];
				html += "<div class='card vendor-reviews-card'>";
				html += "	<div class='card-body'>";
				html += "		<div class='vendor-reviews-regular'>";
				html += "			<img src='/yomul/upload/";
				if(vo.profileImg == "__") {
					html += "default.jpg";
				}else {
					html += vo.profileImg;
				}
				html += "' class='card-img-top'>";
				html += "			<h5 class='card-title'>" + vo.nickname + "<h5>";
				html += "		</div>";
				html += "		<a href='/yomul/reviews_info/" + vo.no + "'>";
				html += "			<p class='card-text'>" + vo.content + "</p>";
				html += "		</a>";
				html += "	</div>";
				html += "</div>";
			}

			$("#vendor_reviews").append(html).trigger("create");
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
		$("#vendor_header_reviews").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		
	</script>

	<!--  BODY  -->
	<input type="hidden" id="vendor_no" value="${no }">
	<div id="vendor_reviews" class="vendor-reviews-content card-columns">
		<c:forEach var="vo" items="${list }">
			<div class="card vendor-reviews-card">
			 	<div class="card-body">
				 	<div class="vendor-reviews-regular">
					 	<img src="/yomul/upload/${vo.profileImg }" class="card-img-top">
					    <h5 class="card-title">${vo.nickname }</h5>
				 	</div>
		    		<a href="/yomul/reviews_info/${vo.no }">
			    		<p class="card-text">${vo.content }</p>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>