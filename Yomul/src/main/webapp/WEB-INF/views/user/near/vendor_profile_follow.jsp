<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단골</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
var page = 1;
var ajaxFlag = true;
var a = "";

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
		url : "/yomul/vendor_profile_follow_pagination",
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
				html += "<div class='media' id='vendor-profile-follow-img'>";
				html += "	<img src='/yomul/upload/";
				if(vo.profileImg == "__") {
					html += "default.jpg";
				}else {
					html += vo.profileImg;
				}
				html += "' class='mr-3'>";
				html += "	<div class='media-body'>";
				html += "		<h5 class='mt-0'>" + vo.nickname + "</h5>";
				html += "	</div>";
				html += "</div>";
			}

			$("#vendor_profile_follow").append(html).trigger("create");
		}
	});
}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!-- MYPAGE HEADER -->
	<%@include file="vendor_header.jsp"%>
	<script type="text/javascript">
		$("#vendor_header_profile").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_profile_follow").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<input id="vendor_no" class="d-none" value="${no }" disabled>
	<div id="vendor_profile_follow" class="vendor-profile-follow-content">
		<c:forEach var="vo" items="${list }">
			<div class="media" id="vendor-profile-follow-img">
				<img src="/yomul/upload/${vo.profileImg }" class="mr-3">
				<div class="media-body">
				 <h5 class="mt-0">${vo.nickname }</h5>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>