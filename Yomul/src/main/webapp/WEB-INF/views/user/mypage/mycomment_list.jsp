<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var page = 1;
	var ajaxFlag = true;

	$(document).ready(function() {
		getData(page);

		$("#btn_comment_delete").on("click", function() {
			$.ajax({
				url : "/yomul/mypage/delete_comment",
				method : "POST",
				data : {
					"no" : $("#modal_content_no").text()
				},
				success : function(result) {
					if (result == 1) {
						alert("댓글 삭제에 성공했습니다.");
						location.href = "/yomul/mypage/mycomment_list";
					} else {
						alert("댓글 삭제에 실패했습니다.");
					}
				}
			});
		});
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
			url : "/yomul/mypage/mycomment_list_ajax",
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
					var comment = json[i];
					html += '<a href="/yomul/town_info" class="d-block text-dark text-decoration-none">';
					html += '	<p class="text-truncate">' + comment.content + '</p>';
					html += '</a>';
					html += '<div class="d-flex">';
					html += '	<span id="article_author">' + comment.nickname + '</span>';
					html += '	<span class="border mx-2"></span>';
					html += '	<span id="article_date">' + comment.wdate + '</span>';
					html += '	<button class="btn btn-sm btn-outline-yomul ml-auto" type="button" data-toggle="modal" data-target="#comment_delete_modal" data-comment_no="'+comment.no+'" data-comment_content="'+comment.content+'">삭제</button>';
					html += '</div>';
					html += '<hr>';
				}
				$("#mycomment_list").append(html);
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
		$("#mypage_header_mycomment_list").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<section id="mycomment_list" class="container mt-3"></section>

	<!-- Modal -->
	<div class="modal fade" id="comment_delete_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<span id="modal_content_no"></span>
						번 댓글을 삭제하시겠습니까?
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span id="modal_content_content"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-yomul" id="btn_comment_delete">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#comment_delete_modal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); // Button that triggered the modal
			var comment_no = button.data('comment_no'); // Extract info from data-* attributes
			var comment_content = button.data('comment_content');
			var modal = $(this);
			modal.find('#modal_content_no').text(comment_no);
			modal.find('#modal_content_content').text(comment_content);
		});
	</script>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>