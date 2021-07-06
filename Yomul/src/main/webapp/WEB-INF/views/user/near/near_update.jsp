<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<link rel="stylesheet" href="http://localhost:9000/yomul/css/near.css">
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!--  BODY  -->
	<div id="near_write" class="near-write">
		<div class="near-write-content">
			<!-- 선택한 사진 전체 미리보기 -->
			<div class="near-write-preview">
		
			</div>
			
			<!-- 사진 -->
			<div class="near-write-img">
				<button type="button" onclick="document.getElementById('file').click();">
					<svg  class="" width="48" height="48" viewBox="0 0 48 48" fill="currentColor" preserveAspectRatio="xMidYMid meet">
					<path d="M11.952 9.778l2.397-5.994A1.778 1.778 0 0 1 16 2.667h16c.727 0 1.38.442 1.65 1.117l2.398 5.994h10.174c.982 0 1.778.796 1.778 1.778v32c0 .981-.796 1.777-1.778 1.777H1.778A1.778 1.778 0 0 1 0 43.556v-32c0-.982.796-1.778 1.778-1.778h10.174zM24 38c6.075 0 11-4.925 11-11s-4.925-11-11-11-11 4.925-11 11 4.925 11 11 11z"></path>
					</svg>
					<span class="">사진 올리기</span>
					<span class="">(*최대 10장까지)</span>
				</button>
				<input type="file" id="file" style="display:none" >
			</div>
			
			
			<!-- 글 작성 -->
			<div class="near-write-form" >
				<form name="near_write" action="" method="post">
					<table>
						<tr>
							<td><label>제목</label><input type="text"></td>
						</tr>
						<tr>
							<td><label>가격</label><input type="text"></td>
						</tr>
						<tr>
							<td><label>전화번호</label><input type="text"></td>
						</tr>
						<tr>
							<td><textarea></textarea></td>
						</tr>
					</table>
				</form>
				<input type="checkbox">  채팅 안 받기
				<button type="button">저장</button>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>