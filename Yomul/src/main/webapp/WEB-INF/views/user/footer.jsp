<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	footer {
		background-color: rgb(255, 208, 206);
	}
	
	footer .footer-content {
		max-width: 1200px;
	}
	
	footer .vertical_line {
		display: inline;
		width: 1px;
		border-left: 1px solid gray;
	}
	
	footer h5 {
		display: inline;
	}
</style>
<footer class="text-muted text-center mt-5">
	<section class="footer-content container d-inline-block p-4 w-100">
		<div class="text-center mb-3">
			<a href="/yomul/customer_center" class="d-inline text-muted">
				<h5>고객센터</h5>
			</a>
			<div class="vertical_line mr-1"></div>
			<a href="/yomul/customer_notices" class="d-inline text-muted">
				<h5>공지사항</h5>
			</a>
			<div class="vertical_line mr-1"></div>
			<a href="/yomul/customer_qna" class="d-inline text-muted">
				<h5>문의하기</h5>
			</a>
			<div class="vertical_line mr-1"></div>
			<a href="/yomul/vendor_signup" class="d-inline text-muted">
				<h5>업체등록</h5>
			</a>
		</div>
		<div class="d-flex">
			<a href="https://github.com/Hwisaek/Yomul" class="text-muted">
				<h4 class="bi bi-github d-inline"></h4>
			</a>
		</div>
		<small class="d-flex">프로젝트명: 요거 물건이네!</small> <small class="d-flex">프로젝트 기간: 21.06.28 ~ 21.07.28</small> <small class="d-flex">개발자: 홍준수, 강진슬, 박준성, 오다빈, 이창민, 주동성</small>
	</section>
</footer>