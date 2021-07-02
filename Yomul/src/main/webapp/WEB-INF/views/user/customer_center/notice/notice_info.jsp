<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#notice_info .content {
		width: 750px;
		margin: 50px auto;
	}
	
	#notice_info .notice_title {
	}
	
	#notice_info h4 {
	}
	
	#notice_info p {
		color: gray;
	}
	
	#notice_info .notice_content {
		margin: 50px 0;
	}
	
	#notice_info hr {
		border-width: 1px 0 0 0;
		border-color: lightgray;
		margin: 25px 0;
	}
	
	#notice_info .btn_back {
		display: inline-block;
	}
</style>
<jsp:include page="../../../head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div id="notice_info" class="content">
		<div class="notice_title">
			<h4 class="font-weight-bold">제모옥~~~</h4>
			<p class="font-weight-bold">2021.07.02</p>
		</div>
		<hr>
		<div class="notice_content">
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
			내요옹~~~<br>
		</div>
		<hr>
		<div class="text-center">
			<button class="btn btn-yomul btn_back font-weight-bold">목록으로 돌아가기</button>
		</div>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
