<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- HEAD -->
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../../admin_header.jsp"></jsp:include>

	<!--  BODY  -->
	<section id="sample">
		<div class="content">
			<section class="board_list">
				<h3 class="line_title">
					<span> <img src="" alt="NOTICE">
					</span> [관리자] 공지사항
				</h3>
				<table class="content_layout">
					<tr>
						<td colspan="3"><a href='/yomul/admin_notice_write'>
								<button type="button">글쓰기</button>
						</a></td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					
					<tr>
					<td>1</td>
					<td><a href='/yomul/admin_notice_info'>글제목이당</a></td>
					<td>1972.11.21</td>
					</tr>
					<!-- 
					
					 -->
				</table>
			</section>
		</div>
	</section>


</body>
</html>