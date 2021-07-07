<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 목록</title>
<link rel="stylesheet" href="http://localhost:9000/yomul/css/near.css">
<!-- HEAD -->
<jsp:include page="../../head.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- MYPAGE HEADER -->
	<%@include file="vendor_header.jsp"%>
	<script type="text/javascript">
		$("#vendor_header_news").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
		$("#vendor_header_news_insert").addClass("active").removeClass("text-muted").css("color", "rgb(255, 99, 95)");
	</script>

	<!--  BODY  -->
	<%@include file="near_write.jsp"%>
	
	<!-- FOOTER -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>