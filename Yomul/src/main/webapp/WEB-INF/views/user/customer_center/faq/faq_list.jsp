<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 FAQ</title>
<!-- HEAD -->
<%@ include file="../../../head.jsp"%>
<style>
	#faq_list {
		width: 1120px;
		margin: 0 auto;
	}
	
	#faq_list .top {
		padding: 60px 100px;
		background-color: rgb(255, 208, 206);
	}
	
	#faq_list .center {
		width: 900px;
		margin: 20px auto;
	}

	#faq_list .list {
		list-style-type: none;
	}
	
	#faq_list .category {
		cursor: pointer;
	}
	
	#faq_list hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 20px 0;
	}
</style>
<script>
	$(document).ready(function() {
		// 문의하기 버튼 클릭
		$("#btn_question").click(function() {
			location.href = "../customer_qna/write";
		});
		
		// 카테고리 클릭
		$(".category").click(function() {
			// 선택된 카테고리의 색상 변경
			$(".category").removeClass("text-yomul");
			$(this).addClass("text-yomul");
			
			var faqlist = $(".faq_info");
			
			if($(this).attr("category") == "all") {
				faqlist.removeClass("d-none");
			} else { // 모든 faq에 d-none을 추가하고, 선택된 faq에만 d-none을 삭제한다
				for(var i=0;i<faqlist.length;i++) {
					if(!$(faqlist[i]).hasClass("d-none")) {
						$(faqlist[i]).addClass("d-none");
					}
					
					if($(this).attr("category") == $(faqlist[i]).attr("category")) {
						$(faqlist[i]).removeClass("d-none");
					}
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../../header.jsp"%>
	
	<!--  BODY  -->
	<section id="faq_list">
		<div class="top">
			<h4 class="font-weight-bold">고객센터</h4>
			<div class="mt-4 mb-2">
			<p>운영시간: 평일 09:00 ~ 18:00</p>
			</div>
			<button type="button" id="btn_question" class="btn btn-yomul px-4 py-2">문의하기</button>
		</div>
		<div class="center">
			<ul class="list font-weight-bold p-0">
				<li class="d-flex justify-content-between">
					<p class="category text-decoration-none text-reset text-yomul" category="all">전체</p>
					<c:forEach items="${categories }" var="cvo">
						<p class="category text-decoration-none text-reset" category="${cvo.getNo() }">${cvo.getContent() }</p>
					</c:forEach>
				</li>
				<hr>
				<c:forEach var="fvo" items="${faqlist }" varStatus="status">
				<li class="faq_info" category="${fvo.getCategory() }">
					<a class="text-decoration-none text-reset" data-toggle="collapse" href="#faq${status.index }" aria-expanded="false" aria-controls="#faq${status.index }">${fvo.getTitle() }</a>
					<p class="collapse mt-2" id="faq${status.index }">${fvo.getContent() }</p>
					<hr>
				</li>
				</c:forEach>
			</ul>
		</div>
	</section>
	
	<!-- FOOTER -->
	<%@ include file="../../footer.jsp"%>
</body>
</html>