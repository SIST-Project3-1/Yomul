<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html class="" lang="ko">
<head>
<meta charset="UTF-8">
<title>오늘 시작하는 인테리어, 오늘의집</title>
<link rel="shortcut icon" href="/assets/bookmark_icon/favicon_144x144.png" />
<link href="https://static.ohou.se/assets/favicon-186ac0d991a44c522f984d86e6a50d24c65b7b3a02a004ba7e13f5722aabd952.png" rel="shortcut icon" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap&subset=korean" rel="stylesheet">

<link rel="stylesheet" media="all" href="https://static.ohou.se/assets/v3/bucket_ui/bucket_ui-cf437a161bdb44b28d08d72550bb85e52b07cf425b26f21c6c412cc524af5a4c.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/assets/v3/layout/application_simplified-292aaabc44d7729c34b0c1af5b3aa9b030c551b99804d8f9ee75b0a53eaf76a2.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/assets/v3/bucket_ui/components-aba4a2f67926f213a42ac70be01cb690e099b8322468e5f451fb06854a9eac80.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/5-4fb73fc5.chunk.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/ExpertReviewForm-1178b640.chunk.css" />

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<main role="main">
		<div data-react-class="ExpertReviewForm"
			data-react-props="{&quot;url&quot;:&quot;/expert_reviews/new?source=6&quot;,&quot;data&quot;:{&quot;sido&quot;:null,&quot;sigungu&quot;:null,&quot;residence&quot;:null,&quot;service_at&quot;:null,&quot;phone&quot;:&quot;010-2603-6035&quot;,&quot;area&quot;:null,&quot;available_write&quot;:true,&quot;expert_user&quot;:{&quot;profile_img_url&quot;:&quot;&quot;,&quot;nickname&quot;:&quot;&quot;,&quot;address&quot;:&quot;&quot;},&quot;cards&quot;:[]},&quot;additionalData&quot;:[{&quot;url&quot;:&quot;/expert_reviews/reward_policy&quot;,&quot;data&quot;:{&quot;reward_policy&quot;:{&quot;default_point&quot;:500,&quot;card_total_point&quot;:5000,&quot;contract_total_point&quot;:5000,&quot;address_total_point&quot;:10000,&quot;address_point&quot;:5000,&quot;card_point&quot;:4500,&quot;contract_point&quot;:0,&quot;contract_via_ohouse_multiplier&quot;:10}}}],&quot;user&quot;:{&quot;id&quot;:12569383,&quot;nickname&quot;:&quot;Hwisaek&quot;,&quot;profileImageUrl&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/users/profile_images/1613691853_PEVtUtLv.jpeg&quot;,&quot;userableType&quot;:&quot;NormalUser&quot;,&quot;userableId&quot;:12602711,&quot;isAdmin&quot;:false},&quot;admin&quot;:null}"
			data-hydrate="t" class="page">
			<div class="expert-review-form-wrap">
				<form class="expert-review-form">
					<header class="expert-review-form__header-wrap">
						<div class="expert-review-form__header expert-review-form__header">
							<div class="expert-review-form__header__logo-wrap">
								<a class="expert-review-form__header__logo" aria-label="오늘의집" href="/"><svg width="2.93333em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 88 30">
										<g fill="none" fill-rule="evenodd">
										<path fill="#35C5F0" d="M23 0H5C2.41 0 0 2.41 0 5v20c0 2.59 2.41 5 5 5h20c2.59 0 5-2.41 5-5V5c0-2.59-2.41-5-5-5h-2z"></path>
										<path fill="#FFF" d="M21.99 15.62a1.98 1.98 0 1 1 0-3.97 1.98 1.98 0 0 1 0 3.97zm-1.48 5.2H9.07v-7.57l5.72-3.98 3.28 2.28a4.42 4.42 0 0 0 2.44 6.26v3.02zM21.99 9.2c-.5 0-1 .09-1.44.24l-4.74-3.3a1.77 1.77 0 0 0-2.03 0l-7.1 4.95c-.48.33-.76.87-.76 1.45v9.68c0 .98.8 1.77 1.77 1.77h14.2c.98 0 1.77-.8 1.77-1.77v-4.47A4.44 4.44 0 0 0 22 9.19z"></path>
										<g fill="currentColor">
										<path
											d="M46.37 22.26h-3.42v-3.11a1 1 0 1 0-2.02 0v3.1H37.5a1.01 1.01 0 0 0 0 2.03h8.86a1 1 0 1 0 0-2.02M39.62 11.12c0-3.2 1.45-3.67 2.32-3.67.86 0 2.31.47 2.31 3.67v.25c0 3.2-1.45 3.67-2.31 3.67-.87 0-2.32-.48-2.32-3.67v-.25zm2.32 5.94c2.67 0 4.33-2.18 4.33-5.7v-.24c0-3.51-1.66-5.7-4.33-5.7-2.68 0-4.34 2.19-4.34 5.7v.25c0 3.5 1.66 5.69 4.34 5.69zM59.7 11.95H48.87a1.01 1.01 0 1 0 0 2.02H59.7a1 1 0 1 0 0-2.02M58.62 22.72c-4.92 1.28-6.57.55-7.05.18-.32-.24-.46-.56-.46-1.03v-.6h7.13a1 1 0 0 0 1.01-1.01v-3.53a1 1 0 0 0-1-1.01H50.1a1 1 0 1 0 0 2.02h7.13v1.5H50.1c-.55 0-1 .46-1 1.02v1.61c0 1.1.42 2 1.23 2.63.83.64 2.04.96 3.62.96 1.43 0 3.16-.26 5.17-.78a1 1 0 1 0-.5-1.96M50.61 10.2h7.52a1.01 1.01 0 1 0 0-2.02h-6.5V5.77a1.01 1.01 0 1 0-2.02 0v3.42a1 1 0 0 0 1 1.01M86.43 5.1c-.56 0-1.01.45-1.01 1v8.15a1.01 1.01 0 1 0 2.02 0V6.11c0-.56-.45-1.01-1.01-1.01M81.33 13.99a1.01 1.01 0 0 0 1.9-.7 7.6 7.6 0 0 0-2.34-3.12l2.56-2.85a1.01 1.01 0 0 0-.75-1.69h-6.3a1 1 0 0 0 0 2.02h4.03l-1.85 2.06v.01l-2.92 3.24a1.01 1.01 0 0 0 1.5 1.35l2.37-2.63a5.58 5.58 0 0 1 1.8 2.3M84.85 23.2h-4.87a.57.57 0 0 1-.57-.58v-1.35h6v1.35c0 .32-.24.57-.56.57m1.58-6.51c-.56 0-1.01.45-1.01 1v1.57h-6v-1.56a1 1 0 0 0-2.03 0v4.93a2.59 2.59 0 0 0 2.59 2.59h4.87a2.59 2.59 0 0 0 2.59-2.59V17.7a1 1 0 0 0-1.01-1.01M66.02 7.45c1.53 0 1.61 2.94 1.61 3.53 0 .6-.08 3.54-1.61 3.54-1.54 0-1.62-2.95-1.62-3.54 0-.59.08-3.53 1.62-3.53m0 9.09c1.22 0 2.24-.65 2.87-1.83.5-.93.76-2.22.76-3.73 0-1.5-.26-2.8-.76-3.72a3.19 3.19 0 0 0-2.87-1.83c-1.23 0-2.25.65-2.88 1.83-.5.93-.76 2.22-.76 3.72s.26 2.8.76 3.73a3.19 3.19 0 0 0 2.88 1.83"></path>
										<path d="M72.23 5.1c-.56 0-1.01.45-1.01 1v12.36c-1.34.42-4 .79-7.21.79h-1.54a1.01 1.01 0 0 0 0 2.02h1.54c1.83 0 5-.16 7.2-.71v3.36a1.01 1.01 0 0 0 2.03 0V6.11c0-.56-.46-1.01-1.01-1.01"></path></g></g></svg></a>
							</div>
							<h1>시공업체 리뷰 쓰기</h1>
							<div class="expert-review-form__header__point-info">
								<style data-emotion="css 1wo29da-Container">
.css-1wo29da-Container {
	color: #424242;
	text-align: center;
	line-height: 21px;
	font-size: 15px;
}
</style>
								<div class="css-1wo29da-Container e5i6id3">
									<style data-emotion="css uaal4z-NormalText">
.css-uaal4z-NormalText {
	font-weight: normal;
	margin-bottom: 20px;
	white-space: pre-line;
}
</style>
									<div class="css-uaal4z-NormalText e5i6id2">
										잠시 소중한 경험을 남겨주시면 <br />다른 오늘의집 유저들에게 큰 도움이 됩니다.
									</div>
									<style data-emotion="css hmf8ql-BoldText">
.css-hmf8ql-BoldText {
	font-weight: bold;
}
</style>
									<div class="css-hmf8ql-BoldText e5i6id1">[누구나 리뷰 쓰고 10,000포인트 받기]</div>
									<div class="css-uaal4z-NormalText e5i6id2">기본2,000p +사진4,000p +상세주소4,000p</div>
									<div class="css-hmf8ql-BoldText e5i6id1">[오늘의집 계약고객은 최대 50,000포인트]</div>
									<div class="css-uaal4z-NormalText e5i6id2">
										기본20,000p +사진15,000p +상세주소15,000p
										<style data-emotion="css khcjy2-InfoText">
.css-khcjy2-InfoText {
	font-size: 13px;
	color: #757575;
}
</style>
										<div class="css-khcjy2-InfoText e5i6id0">*단, 계약금액 100만원 이하인 경우는 최대 10,000p</div>
									</div>
								</div>
							</div>
						</div>
					</header>
					<section class="expert-review-form__content">
						<div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 전문가 상호 / 작업자명</div>
								<div class="expert-user-form__form-group__input">
									<input type="text" placeholder="집순이인테리어" value="" class="form-control" />
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 전문가 연락처</div>
								<div class="expert-user-form__form-group__description">업체/전문가를 확인할 수 있는 방법을 알려주세요.</div>
								<div class="expert-user-form__form-group__input">
									<div class="expert-review-form__content__info-row">
										<input type="tel" placeholder="대표 번호" value="" class="form-control" />
									</div>
									<div class="expert-review-form__content__info-row">
										<input type="text" placeholder="이메일" value="" class="form-control" />
									</div>
									<div class="expert-review-form__content__info-row">
										<input type="text" placeholder="위치(예: OO구 OO동)" value="" class="form-control" />
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">고객님의 핸드폰 번호를 알려주세요.</div>
								<div class="expert-user-form__form-group__description">허위 리뷰를 가려내고 포인트를 지급하는 용도로만 사용됩니다.</div>
								<div class="expert-user-form__form-group__input">
									<div class="input-group telephone-input expert-review-form__telephone-input">
										<input type="tel" class="form-control telephone-input__input" size="1" maxLength="3" value="010" placeholder="010" /><span class="telephone-input__dash">-</span><input type="tel" class="form-control telephone-input__input" size="1" maxLength="4" value="2603" placeholder="1234" /><span class="telephone-input__dash">-</span><input type="tel" class="form-control telephone-input__input" size="1" maxLength="4" value="6035" placeholder="5678" />
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">친절도</div>
								<div class="expert-user-form__form-group__description">전문가님은 상담하실 때와 시공을 진행하실 때 항상 친절하셨나요?</div>
								<div class="expert-user-form__form-group__input">
									<ul class="rating-input">
										<li><label class="rating-input__star" aria-label="별점 1점"><input type="radio" value="1" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 2점"><input type="radio" value="2" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 3점"><input type="radio" value="3" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 4점"><input type="radio" value="4" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 5점"><input type="radio" value="5" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
									</ul>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 가격</div>
								<div class="expert-user-form__form-group__description">전문가님이 진행해주신 시공의 가격은 전반적으로 만족스러우셨나요?</div>
								<div class="expert-user-form__form-group__input">
									<ul class="rating-input">
										<li><label class="rating-input__star" aria-label="별점 1점"><input type="radio" value="1" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 2점"><input type="radio" value="2" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 3점"><input type="radio" value="3" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 4점"><input type="radio" value="4" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 5점"><input type="radio" value="5" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
									</ul>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">퀄리티</div>
								<div class="expert-user-form__form-group__description">전문가님이 진행해주신 인테리어 시공의 최종 퀄리티는 만족스러웠나요?</div>
								<div class="expert-user-form__form-group__input">
									<ul class="rating-input">
										<li><label class="rating-input__star" aria-label="별점 1점"><input type="radio" value="1" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 2점"><input type="radio" value="2" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 3점"><input type="radio" value="3" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 4점"><input type="radio" value="4" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 5점"><input type="radio" value="5" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
									</ul>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">전문성</div>
								<div class="expert-user-form__form-group__description">작업 기간 엄수, 자재 변경 이슈, 돌발 상황 대처 등 전문가님의 전문성은 어땠나요?</div>
								<div class="expert-user-form__form-group__input">
									<ul class="rating-input">
										<li><label class="rating-input__star" aria-label="별점 1점"><input type="radio" value="1" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 2점"><input type="radio" value="2" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 3점"><input type="radio" value="3" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 4점"><input type="radio" value="4" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 5점"><input type="radio" value="5" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
									</ul>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">책임감</div>
								<div class="expert-user-form__form-group__description">인테리어 시공이 완료된 후 뒷정리와 A/S서비스 등 전문가님의 책임감은 어떻게 평가하시나요?</div>
								<div class="expert-user-form__form-group__input">
									<ul class="rating-input">
										<li><label class="rating-input__star" aria-label="별점 1점"><input type="radio" value="1" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 2점"><input type="radio" value="2" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 3점"><input type="radio" value="3" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 4점"><input type="radio" value="4" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
										<li><label class="rating-input__star" aria-label="별점 5점"><input type="radio" value="5" /> <svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36">
													<path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg></label></li>
									</ul>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">총평</div>
								<div class="expert-user-form__form-group__description">인테리어 시공 전문가님의 서비스와 작업물 전반에 대하여 간단한 총평을 부탁드립니다. (최소 60자)</div>
								<div class="expert-user-form__form-group__input">
									<textarea style="min-height: 120px; height: 0" placeholder="처음 상담부터 친절하셨고, 작업도 꼼꼼하게 해주셨어요. 주변 사람들과 비교해보니 퀄리티 대비 가격도 합리적인 편이었습니다. 5개월 정도 지났는데 현재까지 하자는 없고, A/S도 약속해 주셔서 걱정 없이 지내고 있습니다. 주변에 엄청 추천하고 있어요!" class="form-control text-area-input"></textarea>
								</div>
							</div>
						</div>
						<div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">
									시공 사진<span class="expert-review-form__group-header__optional">(선택)</span>
								</div>
								<div class="expert-user-form__form-group__description">시공 전/후 이미지 혹은 완성 이미지를 공유해주세요! (최대 10장)</div>
								<div class="expert-user-form__form-group__input">
									<div class="photo-input-wrap expert-review-form__photo-input">
										<ul class="photo-input">
											<li class="photo-input__upload"><button class="photo-input__upload__button" type="button">
													<span class="content"><svg class="icon" width="24" height="24" preserveAspectRatio="xMidYMid meet">
															<path fill="#424242" fill-rule="nonzero" d="M6 4.9l1.2-3c.1-.3.4-.6.8-.6h8c.4 0 .7.3.8.6l1.2 3h5.1c.5 0 .9.4.9.9v16c0 .5-.4.9-.9.9H1a.9.9 0 0 1-.9-1v-16c0-.4.4-.8.9-.8h5zM12 19a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11z"></path></svg>
														<div>사진 올리기</div></span>
												</button></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">
									시공 주소<span class="expert-review-form__group-header__optional">(선택)</span>
								</div>
								<div class="expert-user-form__form-group__description">상세 주소는 비공개이니 안심하세요.</div>
								<div class="expert-user-form__form-group__input">
									<div class="address-input">
										<input type="text" class="form-control address-input__input" readonly="" value="" />
										<button class="address-input__button btn btn-sm btn-priority" type="button">주소찾기</button>
									</div>
									<textarea placeholder="상세 주소를 입력해주세요 (선택)" class="form-control text-area-input" style="height: 0"></textarea>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">
									시공 계약서 추가<span class="expert-review-form__group-header__optional">(선택)</span>
								</div>
								<div class="expert-user-form__form-group__description">계약서 및 견적서 등의 실제 시공 했음을 확인할 수 있는 자료를 첨부해주세요. (확인용으로만 사용되며 외부에 절대로 노출되지 않습니다.)</div>
								<div class="expert-user-form__form-group__input">
									<div class="file-input empty">
										<button class="file-input__button btn btn-sm btn-priority" type="button">파일첨부</button>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 시기</div>
								<div class="expert-user-form__form-group__input">
									<div class="expert-review-form__month-input input-group">
										<div class="input-group select-input expert-review-form__month-input__input">
											<select class="form-control empty"><option selected="" value="" disabled="">연도 선택</option>
												<option value="0">2021년</option>
												<option value="1">2020년</option>
												<option value="2">2019년</option>
												<option value="3">2018년</option>
												<option value="4">2017년</option>
												<option value="5">2016년</option>
												<option value="6">2015년</option>
												<option value="7">2014년</option>
												<option value="8">2013년</option>
												<option value="9">2012년</option>
												<option value="10">2011년</option>
												<option value="11">2010년</option>
												<option value="12">2009년</option>
												<option value="13">2008년</option>
												<option value="14">2007년</option>
												<option value="15">2006년</option>
												<option value="16">2005년</option>
												<option value="17">2004년</option>
												<option value="18">2003년</option>
												<option value="19">2002년</option>
												<option value="20">2001년</option></select><span class="select-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
													<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
										</div>
										<div class="input-group select-input expert-review-form__month-input__input">
											<select class="form-control empty"><option selected="" value="" disabled="">월 선택</option>
												<option value="0">1월</option>
												<option value="1">2월</option>
												<option value="2">3월</option>
												<option value="3">4월</option>
												<option value="4">5월</option>
												<option value="5">6월</option>
												<option value="6">7월</option>
												<option value="7">8월</option>
												<option value="8">9월</option>
												<option value="9">10월</option>
												<option value="10">11월</option>
												<option value="11">12월</option></select><span class="select-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
													<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
										</div>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 지역</div>
								<div class="expert-user-form__form-group__input">
									<div class="panel-input">
										<div class="drop-down panel-drop-down panel-input__input-wrap">
											<button class="panel-input__input form-control empty" type="button">지역을 선택해주세요</button>
											<span class="panel-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
													<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
										</div>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">건물 유형</div>
								<div class="expert-user-form__form-group__input">
									<div class="input-group select-input">
										<select class="form-control empty"><option selected="" value="" disabled="">유형 선택</option>
											<option value="0">원룸&amp;오피스텔</option>
											<option value="1">아파트</option>
											<option value="2">빌라&amp;연립</option>
											<option value="3">단독주택</option>
											<option value="4">사무공간</option>
											<option value="5">상업공간</option>
											<option value="6">기타</option></select><span class="select-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
												<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 분야</div>
								<div class="expert-user-form__form-group__input">
									<div class="input-group select-input">
										<select class="form-control empty"><option selected="" value="" disabled="">분야 선택</option>
											<option value="0">종합리모델링</option>
											<option value="1">도배/장판</option>
											<option value="2">타일/욕실</option>
											<option value="3">페인트/필름</option>
											<option value="4">마루/바닥</option>
											<option value="5">도어/창호</option>
											<option value="6">전기/조명</option>
											<option value="7">주방/가구</option>
											<option value="8">전문디자인</option>
											<option value="9">기타</option></select><span class="select-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
												<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 평수</div>
								<div class="expert-user-form__form-group__input">
									<div class="input-group select-input">
										<select class="form-control empty"><option selected="" value="" disabled="">평수 선택</option>
											<option value="0">10평 미만</option>
											<option value="1">10평대</option>
											<option value="2">20평대</option>
											<option value="3">30평대</option>
											<option value="4">40평대</option>
											<option value="5">50평 이상</option></select><span class="select-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
												<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
									</div>
								</div>
							</div>
							<div class="expert-user-form__form-group">
								<div class="expert-user-form__form-group__label">시공 가격</div>
								<div class="expert-user-form__form-group__input">
									<div class="input-group select-input">
										<select class="form-control empty"><option selected="" value="" disabled="">가격 선택</option>
											<option value="0">100만원 이하</option>
											<option value="1">100~500만원</option>
											<option value="2">500~1000만원</option>
											<option value="3">1000~2000만원</option>
											<option value="4">2000~3000만원</option>
											<option value="5">3000만원 이상</option></select><span class="select-input__icon"><svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
												<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
									</div>
								</div>
							</div>
						</div>
						<div></div>
						<div class="expert-review-form__done-wrap">
							<button class="button button--color-blue button--size-50 button--shape-4 expert-review-form__done" type="submit">완료</button>
						</div>
					</section>
				</form>
			</div>
		</div>
	</main>
	<div id="modal-root"></div>
	<div id="toast-message-root"></div>
	<div id="flash_messages"></div>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
