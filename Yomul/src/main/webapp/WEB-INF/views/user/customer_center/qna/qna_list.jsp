<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 문의 내역</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
#qna_list .list {
	list-style-type: none;
}

#qna_list li:hover {
	opacity: 0.5;
}

#qna_list hr {
	border-width: 1px 0 0 0;
	border-color: lightgray;
	margin: 25px 0;
}
</style>
<script type="text/javascript">
	var page = 1;
	var ajaxFlag = true;

	// 스크롤 페이징
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		var dHeight = $(document).height();
		var wHeight = $(window).height();
		if (ajaxFlag && (scroll + 200 >= dHeight - wHeight)) {
			getData(++page);
		}
	});

	// 문의 목록 불러오기
	function getData(page) {
		$.ajax({
			url : "customer_qna_ajax",
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
					qna = json[i];
					html += '<li>';
					html += '	<a class="m-0 text-decoration-none" href="/yomul/customer_qna/'+qna.no+'">';
					html += '		<p class="d-inline-block p-0 mb-1 mr-1 text-body">' + qna.title + '</p>';
					if (qna.secret == "on") {
						html += '	<i class="bi bi-lock-fill text-dark"></i>';
					}
					html += '		<kbd class="bg-yomul">' + (qna.rdate == null ? "답변대기" : "답변완료") + '</kbd>';
					html += '		<p class="text-secondary">' + qna.wdate + '</p>';
					html += '		<hr>';
					html += '	</a>';
					html += '</li>';
				}
				$("#qnaList").append(html);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../header.jsp"%>

	<!--  BODY  -->
	<section id="qna_list" class="container">
		<h3 class="mt-3 font-weight-bold">문의 내역</h3>
		<div class="text-right">
			<a class="btn btn-yomul" href="/yomul/customer_qna/write">문의하기</a>
		</div>
		<ul id="qnaList" class="list p-0">
			<c:forEach var="qna" items="${qnaList}">
				<li>
					<a class="m-0 text-decoration-none" href="/yomul/customer_qna/${qna.no}">
						<p class="d-inline-block p-0 mb-1 mr-1 text-body">${qna.title}</p>
						<c:if test='${qna.secret.equals("on") }'>
							<i class="bi bi-lock-fill text-dark"></i>
						</c:if>
						<kbd class="bg-yomul">${qna.rdate==null?"답변대기":"답변완료"}</kbd>
						<p class="text-secondary">${qna.wdate}</p>
						<hr>
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>

	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>