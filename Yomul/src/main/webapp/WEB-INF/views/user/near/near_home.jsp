<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 근처</title>
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body id="near_home">
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- 검색창 -->
	<div>
		<input type="text">
		<button>검색</button>
	</div>
	
	<!-- 키워드 -->
	<div>
		<h3>키워드</h3>
		<% 
		String keyword[] = {"부동산","카페","요가","휴대폰","마사지","미용실","왁싱"}; 
		for(String str : keyword){
		%>
		<label><%= str %></label>
		<% } %>
	</div>
	
	<!-- 내 근처 소식 -->
	<div>
		<div>
			<h3>내 근처 소식</h3>
			<a href="#">더보기</a>
		</div>
		<div>
			<div>
				<img src="#">
			</div>
			<div>
				<h3>타이틀</h3>
				<p>내용</p>
				<p>작성자</p>
			</div>
		</div>
	</div>
	
	<!-- 이웃들의 추천가게 -->
	<div>
		<h3>이웃들의 추천가게</h3>
		<div>
			<div>
				<img src="#">
			</div>
			<div>
				<h3>타이틀</h3>
				<p>내용</p>
				<p>작성자</p>
				<p>후기</p>
				<p>단골</p>
			</div>
			<div>
				<h3>고객명</h3>
				<p>후기</p>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>