<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#notice_list h2 {
		margin: 50px 0;
	}

	#notice_list .content {
		width: 750px;
		margin: 0 auto;
	}
	
	#notice_list .list {
		list-style-type: none;
		padding: 0;
	}
	
	#notice_list li {
		padding: 0;
		margin: 0;
		cursor: pointer;
	}
	
	#notice_list li:hover {
		opacity: 0.5;
	}
	
	#notice_list a {
		text-decoration: none;
		margin:0;
	}
	
	#notice_list p {
		text-align: left;
		display: block;
		padding: 0;
		margin: 0;
	}
	
	#notice_list .notice_title {
		color: black;
	}
	
	#notice_list .notice_date {
		color: gray;
	}
	
	#notice_list hr {
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
				<a class="notice_link" href="customer_notices/1">
					<p class="notice_title">제목~~~~</p>
					<p class="notice_date">2021.07.02</p>
					<hr>
				</a>
			</li>
			<li>
				<a class="notice_link" href="customer_notices/1">
					<p class="notice_title">제목~~~~</p>
					<p class="notice_date">2021.07.02</p>
					<hr>
				</a>
			</li>
			<li>
				<a class="notice_link" href="customer_notices/1">
					<p class="notice_title">제목~~~~</p>
					<p class="notice_date">2021.07.02</p>
					<hr>
				</a>
			</li>
		</ul>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>