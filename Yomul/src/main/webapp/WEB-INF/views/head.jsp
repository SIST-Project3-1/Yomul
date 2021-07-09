<%@page import="com.yomul.api.APIKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%-- Bootstrap --%>
<link rel="stylesheet" href="/yomul/css/bootstrap.min.css">
<link rel="stylesheet" href="/yomul/css/bootstrap-icons/bootstrap-icons.css">
<script src="/yomul/js/bootstrap.min.js"></script>
<script src="/yomul/js/bs-custom-file-input.min.js"></script>
<script>
	$(document).ready(function() {
		bsCustomFileInput.init()
	})
</script>

<%-- Kakao API --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=APIKey.KAKAO_API_JAVASCRIPT_KEY%>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=APIKey.KAKAO_API_JAVASCRIPT_KEY%>&libraries=services,clusterer,drawing"></script>

<%--JS --%>
<script src="/yomul/js/jquery-3.6.0.min.js"></script>
<script src="/yomul/js/commons.js"></script>

<%-- CSS --%>
<link rel="stylesheet" href="/yomul/css/commons.css">
<link rel="stylesheet" href="/yomul/css/near.css">