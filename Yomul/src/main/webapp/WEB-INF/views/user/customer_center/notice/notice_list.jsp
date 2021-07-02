<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		margin: 50px 0;
	}

	.content {
		margin: 100px;
	}
	
	.list {
		text-align: center;
		list-style-type: none;
		padding: 0;
	}
	
	li {
		padding: 0;
		margin: 0;
		cursor: pointer;
	}
	
	li:hover {
		opacity: 0.5;
	}
	
	a {
		text-decoration: none;
		margin:0;
	}
	
	p {
		text-align: left;
		display: block;
		padding: 0;
		margin: 5px 0;
	}
	
	.title {
		color: black;
	}
	
	.date {
		color: gray;
	}
	
	hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
</style>
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body id="notice_list">
	<jsp:include page="../../header.jsp"></jsp:include>
	<div class="content">
		<h2>공지사항</h2>
		<ul class="list">
			<li>
				<a class="notice_link" href="#">
					<p class="title">제목~~~~</p>
					<p class="date">2021.07.02</p>
					<hr>
				</a>
			</li>
			<li>
				<a class="notice_link" href="#">
					<p class="title">제목~~~~</p>
					<p class="date">2021.07.02</p>
					<hr>
				</a>
			</li>
			<li>
				<a class="notice_link" href="#">
					<p class="title">제목~~~~</p>
					<p class="date">2021.07.02</p>
					<hr>
				</a>
			</li>
		</ul>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>