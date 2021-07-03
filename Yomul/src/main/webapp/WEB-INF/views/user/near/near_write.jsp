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
				<img src="http://localhost:9000/yomul/image/이미지준비중.jpg">
			</div>
			
			<!-- 글 작성 -->
			<div class="near-write-form" >
				<form name="near_write" action="" method="post">
					<table>
						<tr>
							<td><label>제목</label><input type="text" value="제목을 입력해 주세요"></td>
						</tr>
						<tr>
							<td><label>가격</label><input type="text" value="가격 (선택사항)"></td>
						</tr>
						<tr>
							<td><label>전화번호</label><input type="text" value="전화번호 (선택사항)"></td>
						</tr>
						<tr>
							<td><textarea>이웃들에게 홍보하고 싶은 내용을 입력해주세요</textarea></td>
						</tr>
					</table>
				</form>
						<input type="checkbox">  채팅 안 받기
						<button type="button">완료</button>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>