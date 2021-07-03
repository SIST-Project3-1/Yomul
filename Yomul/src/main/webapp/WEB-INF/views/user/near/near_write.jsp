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
	<div id="near_write" class="content">
		<!-- 선택한 사진 전체 미리보기 -->
		<div>
	
		</div>
		
		<!-- 사진 -->
		<div>
	
		</div>
		
		<!-- 글 작성 -->
		<div>
			<form name="near_write" action="" method="post" >
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
						<td><textarea name="bcontent"></textarea></td>
					</tr>
					<tr>
						<td><input type="checkbox">채팅 안 받기</td>
					</tr>
					<tr>
						<td><button type="button">완료</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>