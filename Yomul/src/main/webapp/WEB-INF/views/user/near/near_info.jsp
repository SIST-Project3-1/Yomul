<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script>
	$(document).ready(function() {
		ano = $("#article_no").val(); // 글 번호
		vno = $("#vendor_no").val(); // 업체 번호

		// 단골일 경우 단골 버튼 색상 변경
		$("#btn_regular").on("click", function() {
			clickCustomer();
		});

		// 신고 버튼 클릭
		$(".btn_report").click(function() {
			clickReport(this)
		});
	});

	// 단골 추가/취소
	function clickCustomer() {
		$.ajax({
			url : "/yomul/near_info/add_vendor_customer_proc?no=" + vno,
			method : "GET",
			success : function(result) {
				if (result == -1) { // 로그인 필요
					alert("로그인이 필요합니다.");
				} else if (result == 0) { // 이미 단골인 경우 취소
					$(this).css('color', 'gray').css('background-color', 'rgb(240, 244, 245)');
				} else { // 단골 추가 완료
					$(this).css('color', 'white').css('background-color', 'rgb(255, 99, 95)');
					$("#vcCount").html(result);
				}
			}
		});
	}

	// 신고 버튼 클릭
	function clickReport(btn) {
		$.ajax({
			url : "/yomul/report_proc?ano=" + ano,
			method : "GET",
			success : function(result) {
				if (result == -1) { // 로그인 필요
					alert("로그인이 필요합니다.");
				} else if (result == 0) { // 이미 추천한 경우
					alert("이미 신고하셨습니다.");
				} else { // 추천 성공
					alert("신고가 완료되었습니다.");
				}
			}
		});
	}
</script>
<style>
#near_info .vendor_info>label {
	color: black;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<input type="hidden" id="article_no" value="${vo.no }">
	<div id="near_info" class="near-info-content">
		<div class="near-info-left">
			<!--  타이틀  -->
			<div class="near-info-left-title">
				<h6>${vo.category }</h6>
				<h3>${vo.title }</h3>
			</div>

			<!--  이미지  -->
			<c:if test="${vo.files != 0 }">
				<div class="near-info-left-img">
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach begin="1" end="${articleImages.size() }" varStatus="status">
								<li data-target="#carouselExampleIndicators" data-slide-to="<c:choose><c:when test="${status.first }">0</c:when><c:otherwise>1</c:otherwise></c:choose>"
									class="<c:if test="${status.first }">active</c:if>"></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner" style="width: 500px; height: 500px;">
							<c:forEach var="articleImg" items="${articleImages }" varStatus="status">
								<div class="carousel-item <c:if test="${status.first }">active</c:if>">
									<img src="/yomul/upload/${articleImg }" class="d-block w-100" style="width: 500px; height: 500px;">
								</div>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</c:if>

			<!--  내용  -->
			<div class="near-info-left-content">
				<p>${vo.content }</p>
				<div>
					<!-- <label>2021년 07월 05일 23:22</label> -->
					<label>${vo.ndate }</label>
					<label class="near-info-point">·</label>
					<label>조회 ${vo.hits }</label>
					<label class="near-info-point">·</label>
					<button type="button" class="btn_report near-info-report" value="${vo.no }">신고</button>
				</div>
			</div>
			<div class="near-info-line"></div>

			<!--  댓글  -->
			<c:import url="near_comment_area.jsp" />
		</div>

		<!--  작성자 정보  -->
		<div class="near-info-right" id="near_info_right">
			<input type="hidden" id="vendor_no" value="${vo.vno }">
			<div class="near-info-right-writer">
				<a href="/yomul/vendor_profile_info/${vo.vno }" class="vendor_info">
					<img src="http://localhost:9000/yomul/upload/default.jpg">
					<label>${vo.writer }</label>
				</a>
				<button type="button" id="btn_regular" value="false">
					<p>+</p>
					단골
					<p id="vcCount">${vendorCustomerCount }</p>
				</button>
			</div>
			<div class="near-info-right-price">
				<label>가격</label>
				<label>${vo.price }원</label>
			</div>
			<a href="/yomul/chat" class="btn near-info-inquiry <c:if test="${vo.chatCheck != 0 }">disabled</c:if>">채팅문의</a>
			<c:if test="${sessionScope.member.authority == 'ADMIN'|| loginNo == vo.writer}">
			
			
				<button id="updateNear" type="button" class="btn btn-outline-yomul mt-3">글 수정</button>
				<button id="deleteNear" type="button" class="btn btn-outline-yomul mt-3">글 삭제</button>

				<script type="text/javascript">
					$("#deleteNear").on("click", function() {
						$.ajax({
							url : "/yomul/admin_near_delete?no=${vo.no}",
							method : "GET",
							success : function(result) {
								if (result == 1) {
									alert("글을 삭제했습니다.");
									location.href = "/yomul/near_home";
								} else {
									alert("삭제에 실패했습니다.");
								}
							}
						});
					});
					$("#updateNear").on("click", function() {
						$(location).attr("href","/yomul/near_update/${vo.no }");
					});
				</script>
			</c:if>
		</div>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>