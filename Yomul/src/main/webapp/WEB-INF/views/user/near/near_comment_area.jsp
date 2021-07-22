<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script>
$(document).ready(function(){
	ano = $("#article_no").val(); // 글 번호
	vno = $("#vendor_no").val(); // 업체 번호
	
	// 댓글 작성
	$("#btn_write_comment").click(function() {
		writeComment();
	});
	
	// 댓글 입력란에서 엔터키 눌러도 잘 작성되도록 함
	$("input[type='text']").keydown(function() {
		if(event.keyCode == 13) {
			event.preventDefault();
			writeComment();
		}
	})
	
	// 댓글 페이지 이동
	$(".page").click(function() {
		clickCommentPage($(this).attr("value"));
	});
	
	// 좋아요 버튼 클릭
	$(".btn_comment_like").click(function() {
		clickCommentLike(this)
	});
	
	// 댓글 신고 버튼 클릭
	$(".btn_comment_report").click(function() {
		clickCommentReport(this)
	});
});

// 댓글 작성
function writeComment() {
	var formData = new FormData($("#write_comment_form")[0]);
	formData.append("ano", ano);
	
	$.ajax({
		url : "/yomul/write_comment_proc",
		method : "POST",
		data : formData,
		enctype : "multipart/form-data",
		contentType : false,
		processData : false,
		success : function(result) {
			if(result == -1) { // 로그인 필요
				alert("로그인이 필요합니다.");
				location.href = "/yomul/login";
			}else if(result == 0) { // 작성 실패
				alert("댓글 작성에 실패했습니다.");
			}else { // 작성 성공
				clickCommentPage(1);
				$("input").val("");
			}
		}
	});
}

// 좋아요 버튼 클릭
function clickCommentLike(btn) {
	var no = $(btn).val();
	var likeCount = $(btn).html();
	
	$.ajax({
		url : "/yomul/like_proc?ano=" + no,
		method : "GET",
		success : function(result) {
			if (result == -1) { // 로그인 필요
				alert("로그인이 필요합니다.");
			}else if(result == 0) { // 이미 추천한 경우
				alert("이미 추천하셨습니다.");
			}else { // 추천 성공
				$(btn).html("좋아요 " + result);
				//btn.addClass("color-yomul");
			}
		}
	});
}

// 신고 버튼 클릭
function clickCommentReport(btn) {
	var no = $(btn).val();
	
	$.ajax({
		url : "/yomul/report_proc?ano=" + no,
		method : "GET",
		success : function(result) {
			if (result == -1) { // 로그인 필요
				alert("로그인이 필요합니다.");
			}else if(result == 0) { // 이미 추천한 경우
				alert("이미 신고하셨습니다.");
			}else { // 추천 성공
				alert("신고가 완료되었습니다.");
			}
		}
	});
}

// 댓글 페이지 이동
function clickCommentPage(page) {
	var pageInfo;
	
	$.ajax({
		url : "/yomul/comment_pagination_proc?ano=" + ano + "&page=" + page,
		method : "GET",
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success : function(result) {
			if (result != null) {
				var commentsHtml = parseComments(result[0]);
				var pageHtml = parseCommentPage(result[1]);
				
				$("#comment_count").html(result[1].count);
				$("#comment_content_box").html(commentsHtml).trigger("pagecreate");
				$("#comment_page_box").html(pageHtml).trigger("create");
			} else {
				alert("댓글 페이지 이동 에러");
			}
		}
	});
}

// ajax로 받은 댓글 정보로 댓글 출력
function parseComments(commentInfo) {
	var commentsHtml = "";
	var cinfo = "";
	
	for(var i=0;i<commentInfo.length;i++) {
		cinfo = commentInfo[i];

		commentsHtml += "<div>";
		commentsHtml += "	<img src='/yomul/upload/" + cinfo.img + "'>";
		commentsHtml += "	<div>";
		commentsHtml += "		<div>";
		commentsHtml += "			<label>" + cinfo.writer + "</label>";
		commentsHtml += "			<span>" + cinfo.content + "</span>";
		commentsHtml += "		</div>";
		commentsHtml += "		<div>";
		commentsHtml += "			<label>" + cinfo.wdate + "</label>";
		commentsHtml += "			<label class='near-info-point'>·</label>";
		commentsHtml += "			<button type='button' class='near-info-chat-like'>";
		commentsHtml += 				"좋아요 " + cinfo.likes;
		commentsHtml += "			</button>";
		commentsHtml += "			<label class='near-info-point'>·</label>";
		commentsHtml += "			<button type='button' class='near-info-chat-report'>신고</button>";
		commentsHtml += "		</div>";
		commentsHtml += "	</div>";
		commentsHtml += "</div>";
	}
	
	return commentsHtml;
}

// ajax로 받은 페이지네이션 정보로 페이지네이션 출력
function parseCommentPage(pageInfo) {
	var pageHtml = "";
	
	if(pageInfo.first) {
		pageHtml += "<div class='page' value='1'>처음</div>";
	}
	if(pageInfo.prev) {
		pageHtml += "<div class='page' value="+ pageInfo.prev +">이전</div>";
	}
	for(var i=pageInfo.start;i<=pageInfo.end;i++) {
		pageHtml += "<div class='page";
		if(i == pageInfo.nowPage) {
			pageHtml += "-now";
		}
		pageHtml += "' value=" + i + ">" + i + "</div>";
	}
	if(pageInfo.next) {
		pageHtml += "<div class='page' value="+ pageInfo.next +">다음</div>";
	}
	if(pageInfo.last) {
		pageHtml += "<div class='page' value="+ pageInfo.totalPage +">맨뒤</div>";
	}
	
	pageHtml += "<script>";
	pageHtml += "$('.page').click(function() {";
	pageHtml += "	clickCommentPage($(this).attr('value'));";
	pageHtml += "});";
	pageHtml += "</" + "script>";
	
	return pageHtml;
}

// 이미지 확장자 확인
function checkFile(input) {
	var ext = $(input).val().split(".").pop().toLowerCase();
	return $.inArray(ext, ["jpg", "jpeg", "png", "gif"]) != -1;
}
</script>
<style>
	#near_info .page {
		display: inline;
		background: none;
		border: none;
		color: gray;
		border: 1px solid transparent;
		text-decoration: none;
		padding: 2px 7px;
		margin: 0;
		cursor: pointer;
	}
	
	#near_info .page:hover {
		color: rgb(255, 99, 95);
		border: 1px solid lightgray;
	}
	
	#near_info .page-now {
		display: inline;
		color: rgb(255, 99, 95);
		border: 1px solid lightgray;
		padding: 2px 7px;
		margin: 0;
		font-weight: bold;
	}
	
	#near_info .color-yomul {
		color: rgb(255, 99, 95);
	}
</style>
<!--  댓글  -->
<div class="near-info-chat">
	<div class="near-info-chat-title">
		<h3>댓글</h3><h3 id="comment_count">${commentPageInfo.count }</h3>
	</div>
	<c:if test="${not empty sessionScope.member }">
		<form id="write_comment_form" class="near-info-chat-writer" novalidate>
			<img src="http://localhost:9000/yomul/upload/${sessionScope.member.profileImg }">
			<div>
				<input type="text" id="comment_text" name="content" placeholder="댓글을 남겨 보세요." required>
				<div class="near-info-chat-button">
					<button class="comment-feed__form__photo" type="button" onclick="document.getElementById('comment_file').click();">
						<svg width="24" height="20" viewBox="0 0 24 20" preserveAspectRatio="xMidYMid meet">
							<path fill="#292929" fill-rule="nonzero" d="M3.22 20C1.446 20 0 18.547 0 16.765V6.176c0-1.782 1.446-3.235 3.22-3.235h3.118L7.363.377A.586.586 0 0 1 7.903 0h8.195c.24.003.453.152.54.377l1.024 2.564h3.118c1.774 0 3.22 1.453 3.22 3.235v10.589C24 18.547 22.554 20 20.78 20H3.22zm0-1.176h17.56a2.037 2.037 0 0 0 2.05-2.06V6.177c0-1.15-.904-2.058-2.05-2.058h-3.512a.585.585 0 0 1-.54-.368l-1.024-2.574H8.296L7.27 3.75a.585.585 0 0 1-.54.368H3.22a2.037 2.037 0 0 0-2.05 2.058v10.589c0 1.15.904 2.059 2.05 2.059zM12 17.059c-3.064 0-5.561-2.51-5.561-5.588 0-3.08 2.497-5.589 5.561-5.589s5.561 2.51 5.561 5.589c0 3.079-2.497 5.588-5.561 5.588zm0-1.177a4.392 4.392 0 0 0 4.39-4.411A4.392 4.392 0 0 0 12 7.059a4.392 4.392 0 0 0-4.39 4.412A4.392 4.392 0 0 0 12 15.882z"></path>
						</svg>
					</button>
					<input type="file" id="comment_file" name="file" class="d-none" accept=".gif, .jpg, .jpeg, .png">
					<button type="button" id="btn_write_comment" class="comment-feed__form__submit">등록</button>
				</div>
			</div>
		</form>
	</c:if>
	<div id="comment_content_box" class="near-info-chat-content">
		<c:forEach var="cvo" items="${comments }">
			<div>
				<img src="/yomul/upload/${cvo.img }">
				<div>
					<div>
						<label>${cvo.writer }</label>
						<span>${cvo.content }</span>
					</div>
					<div>
						<label>${cvo.wdate }</label>
						<label class="near-info-point">·</label>
						<button type="button" class="btn_comment_like near-info-chat-like" value="${cvo.no }">좋아요 ${cvo.likes }</button>
						<label class="near-info-point">·</label>
						<button type="button" class="btn_comment_report near-info-chat-report" value="${cvo.no }">신고</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 댓글 페이징  -->
<div class="near-info-page" id="comment_page_box">
	<!-- 첫 페이지 버튼 -->
	<c:if test="${commentPageInfo.first != 0 }">
		<div class="page" value="1">처음</div>
	</c:if>
	<!-- 이전 페이지 버튼 -->
	<c:if test="${commentPageInfo.prev != 0 }">
		<div class="page" value="${commentPageInfo.prev }">이전</div>
	</c:if>
	<!-- 페이지 숫자 이동 버튼 -->
	<c:forEach var="pno" begin="${commentPageInfo.start }" end="${commentPageInfo.end }" step="1">
		<div class="page<c:if test="${pno == commentPageInfo.nowPage }">-now</c:if>" value="${pno }">${pno }</div>
	</c:forEach>
	<!-- 다음 페이지 버튼 -->
	<c:if test="${commentPageInfo.next != 0 }">
		<div class="page" value="${commentPageInfo.next }">다음</div>
	</c:if>
	<!-- 맨뒤 페이지 버튼 -->
	<c:if test="${commentPageInfo.last != 0}">
		<div class="page" value="${commentPageInfo.totalPage }">맨뒤</div>
	</c:if>
</div>