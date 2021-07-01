<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="shortcut icon" href="/assets/bookmark_icon/favicon_144x144.png" />
<link rel="shortcut icon" href="/assets/favicon.png" />

<title>요청하신 페이지를 찾을 수 없습니다.(404)</title>
<style>
html, body {
	background-color: #fafafa !important;
	margin: 0;
	color: #424242;
}

#navigation {
	width: 100%;
	height: 40px;
	padding: 15px 0;
	background-color: white;
	border-bottom: 1px solid #eeeeee;
	position: relative;
}

#navigation>a {
	display: block;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

#inform, #send_mail {
	padding: 40px;
	width: 80%;
	background-color: white;
	border-radius: 25px;
	text-align: center;
	box-sizing: border-box;
}

.error {
	font-size: 100px;
	font-weight: bold;
	color: #35c5f0;
}

.content {
	font-size: 24px;
}

.detail {
	margin: 30px 0;
	font-size: 16px;
	line-height: 24px;
}

#open_mail {
	margin: 0 auto;
	width: 150px;
	height: 50px;
	background-color: #35c5f0;
	border-radius: 10px;
	box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.2);
	color: white;
	font-size: 20px;
	line-height: 50px;
	cursor: pointer;
}

#open_mail:hover {
	transform: translate(0, 5px);
	box-shadow: none;
}

#inform {
	margin: 50px auto 0;
	position: relative;
	z-index: 100;
}

#send_mail {
	margin: 20px auto 100px;
	text-align: left;
	transform: translate(0, -100%) rotate(-90deg) scale(0);
	transition: all 0.3s ease-in;
}

#send_mail.open {
	transform: translate(0, 0) rotate(0deg) scale(1);
}

form>input[type=text] {
	display: block;
	margin: 20px 0;
	width: 33%;
	padding: 0 15px;
	box-sizing: border-box;
	font-size: 16px;
	line-height: 38px;
	border: 1px solid #dcdcdc;
	height: 38px;
}

form>textarea {
	display: block;
	margin: 20px 0;
	width: 100%;
	height: 178px;
	padding: 10px 15px;
	box-sizing: border-box;
	font-size: 16px;
	line-height: 28px;
	border: 1px solid #dcdcdc;
	resize: none;
}

form>input:focus, form>textarea:focus {
	outline: 0;
}

form>input[type=button] {
	display: block;
	width: 100px;
	height: 40px;
	border: none;
	background-color: #35c5f0;
	border-radius: 4px;
	color: white;
	font-size: 15px;
	text-align: center;
	cursor: pointer;
}

@media only screen and (max-width: 767px) {
	#navigation {
		padding: 5px 0;
	}
	form>input[type=text] {
		width: 100%;
	}
}
</style>
<script>
	function openMail() {
		var mailbox = document.getElementById("send_mail");

		if (mailbox.classList.contains('open')) {
			mailbox.classList.remove('open');
		} else {
			mailbox.classList.add('open');
		}
	}

	function clickSubmit() {
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$/;
		if (!re.test(document.getElementById("contact_email").value)) {
			alert('이메일 형식이 올바르지 않습니다');
			return false;
		}

		var url = window.location.href;
		var user_input = document.getElementById("contact_message").value;
		document.getElementById("contact_message").value = user_input + "\n\n\n" + "오류 발생 위치 : " + url + "\n" + "버전 정보 : " + navigator.userAgent;

		document.getElementById("new_contact").submit();
	}
</script>
</head>

<body>
	<div id="navigation">
		<a href="/">
			<img src="/assets/icon_map/v3/ic-wordmark-nav.png" srcset="/assets/icon_map/v3/ic-wordmark-nav@2x.png 2x,
					 /assets/icon_map/v3/ic-wordmark-nav@3x.png 3x" class="ic-wordmark-temp">

		</a>
	</div>

	<div id="inform">
		<div class="error">404</div>
		<div class="content">요청하신 페이지를 찾을 수 없습니다!</div>
		<div class="detail">
			방문하시려는 페이지의 주소가 잘못 입력되었거나, 삭제되어 사용하실 수 없습니다.
			<br>
			입력하신 주소가 정확한지 다시 한번 확인해 주세요.
		</div>
		<div id="open_mail" onclick="openMail()">보고할래요</div>
	</div>

	<div id="send_mail">
		<div class="content">오늘의집 팀원에게 오류를 알려주세요~!</div>
		<form class="new_contact" id="new_contact" action="/contacts?error_page=true" accept-charset="UTF-8" method="post">
			<input name="utf8" type="hidden" value="✓">
			<input type="hidden" name="authenticity_token" value="WAn8XaN7pw702A7kw8N1TH3xkCRuYcSdBBS8bJT6LYfqAa61GFF2aAQ7i0mCFXcrxGOgcO9On8LyjJUhi5Jv2w==">

			<input type="hidden" name="contact[type]" id="contact_type" value="404에러">
			<input placeholder="이름" type="text" name="contact[name]" id="contact_name" required>
			<input placeholder="이메일" title="이메일 형식을 지켜주세요" type="text" name="contact[email]" id="contact_email" required>
			<textarea placeholder="오류가 생긴 과정을 알려주세요" name="contact[message]" id="contact_message" required></textarea>

			<input type="button" name="commit" value="보내기" id="submit_value" class="btn" onclick="clickSubmit()">
		</form>
	</div>

</body>
</html>