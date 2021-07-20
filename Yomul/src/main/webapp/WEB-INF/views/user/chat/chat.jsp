<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 채팅</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var member_no = "${sessionScope.member.no}";
	var chat_from = "${sessionScope.member.no}";
	var chat_to = null;

	$(document).ready(function() {
		var first = $("button.card:first").attr("data-chat_from")
		$("button.card:first").addClass("bg-dark text-white");
		chat_to = $("button.card:first").attr("data-chat_from");
		getChatHistory(first);
		$("#chat-msg").focus();

		// 채팅 상대 클릭
		$("button.card").on("click", function() {
			$("button.card").removeClass("bg-dark text-white");
			$(this).addClass("bg-dark text-white");
			chat_to = $(this).attr("data-chat_from");
			getChatHistory(chat_to);
			$("#chat-msg").val("");
			$("#chat-msg").focus();
		});
		
		
	// 채팅하기
		$("#form_chat").on("submit", function(e) {
			var content = $("#chat-msg").val();
			e.preventDefault();

			$.ajax({
				url : "/yomul/chat_proc",
				method : "POST",
				data : {
					"chat_from" : chat_from,
					"chat_to" : chat_to,
					"content" : content
				}, // 필수
				success : function(result) {
					if (result == 1) {
						$("#chat-msg").val("");
						getChatHistory(chat_to);
						$("#chat-msg").focus();
					} else {
						alert("채팅 전송 실패");
						$("#chat-msg").focus();
					}
				}
			});
			return false;
		})
	});


	// 채팅 내역 가져오기
	function getChatHistory(chat_to) {
		$.ajax({
			url : "/yomul/chat_history_ajax",
			method : "GET",
			data : {
				"chat_from" : member_no,
				"chat_to" : chat_to
			}, // 필수
			success : function(json) {
				var html = "";
				for (var i = 0; i < json.length; i++) {
					chat = json[i];
					if (chat.chat_from == member_no) { // 내가 보낸 채팅
						html += '<div class="text-right my-3">';
						html += '	<small class="text-muted">' + chat.cdate + '</small>';
						html += '	<div class="chat-me">' + chat.content + '</div>';
						html += '</div>';
					} else { // 상대가 보낸 채팅
						html += '<div class="text-left my-3">';
						html += '	<div class="chat-you">' + chat.content + '</div>';
						html += '	<small class="text-muted">' + chat.cdate + '</small>';
						html += '</div>';
					}
				}

				$("#chat-content").empty();
				$("#chat-content").append(html);
				$('#chat-content').scrollTop($('#chat-content')[0].scrollHeight);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="chat" class="mt-3">
		<div class="container" style="height: 85vh;">
			<div class="row border rounded p-2 h-100">
				<!--  채팅 대상 -->
				<div class="col-3 border-right overflow-auto h-100">
					<h3>채팅</h3>
					<c:forEach var="chat" items="${chatList}">
						<button type="button" class="card btn text-left my-2 p-3 w-100" data-chat_from="${chat.chat_from }">
							<div>
								<img class="rounded-circle" src="https://via.placeholder.com/50">
								<span class="ml-2">
									<strong>${chat.chat_from}</strong>
								</span>
							</div>
						</button>
					</c:forEach>
				</div>

				<!-- 채팅 내용 -->
				<div id="chat-panel" class="col-9 h-100">
					<div id="chat-content" class="overflow-auto" style="height: 75vh;"></div>
					<div id="chat-input">
						<hr>
						<form id="form_chat" action="#" method="post" class="w-100">
							<div class="input-group mb-3 w-100">
								<input id="chat-msg" type="text" class="form-control" placeholder="채팅을 입력해주세요..." aria-describedby="btn_chat" required>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit" id="btn_chat">전송</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>