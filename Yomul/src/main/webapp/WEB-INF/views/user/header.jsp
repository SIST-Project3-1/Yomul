<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="layout-navigation-bar">
	<div data-sticky-enabled="false" data-sticky-disabled="true" data-sticky-always="true" data-sticky-ignore="true" data-direction="top" data-offset="0" class="sticky-container layout-navigation-primary-wrap">
		<div class="sticky-child layout-navigation-primary" style="position: relative">
			<div class="layout-navigation-primary__content">
				<div class="layout-navigation-primary__leftmost">
					<button class="layout-navigation-bar-icon layout-navigation-bar-drawer-button" title="메뉴" aria-label="메뉴" type="button">
						<svg class="icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
										<path fill="currentColor" d="M3 4h18v2H3V4zm0 7h18v2H3v-2zm0 7h18v2H3v-2z"></path></svg>
					</button>
				</div>
				<div class="layout-navigation-primary__left">
					<a class="layout-navigation-logo layout-navigation__bar__logo" aria-label="오늘의집" href="/">
						<svg class="icon" width="74" height="30" viewBox="0 0 74 30" preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path fill="#000" d="M14.2 25.17H9.28V20.7a1.45 1.45 0 0 0-2.9 0v4.47H1.44a1.45 1.45 0 1 0 0 2.9H14.2a1.45 1.45 0 0 0 0-2.9M4.5 9.15c0-4.6 2.08-5.28 3.33-5.28 1.24 0 3.33.69 3.33 5.28v.36c0 4.6-2.09 5.28-3.33 5.28-1.25 0-3.34-.69-3.34-5.28v-.36zm3.33 8.54c3.84 0 6.23-3.13 6.23-8.18v-.36c0-5.05-2.39-8.18-6.23-8.18-3.85 0-6.24 3.13-6.24 8.18v.36c0 5.05 2.39 8.19 6.24 8.19zm25.54-7.34H17.81a1.45 1.45 0 0 0 0 2.9h15.56a1.45 1.45 0 1 0 0-2.9m-1.55 15.5c-7.08 1.83-9.45.79-10.14.25-.45-.35-.65-.8-.65-1.48v-.87h10.25c.8 0 1.46-.65 1.46-1.45v-5.08c0-.8-.66-1.45-1.46-1.45h-11.7a1.45 1.45 0 1 0 0 2.9h10.25v2.18H19.57c-.8 0-1.45.65-1.45 1.45v2.32a4.6 4.6 0 0 0 1.78 3.78c1.2.93 2.94 1.39 5.21 1.39 2.05 0 4.54-.38 7.44-1.13a1.45 1.45 0 1 0-.73-2.82M20.3 7.83h10.8a1.45 1.45 0 1 0 0-2.9h-9.35V1.45a1.45 1.45 0 1 0-2.9 0v4.93c0 .8.65 1.45 1.45 1.45"></path>
										<rect width="3" height="15" x="70" fill="#000" rx="1.5"></rect>
										<path fill="#000" d="M64.5 13.28a1.45 1.45 0 0 0 2.73-1c-.05-.13-1-2.68-3.38-4.5l3.7-4.1a1.45 1.45 0 0 0-1.09-2.42h-9.05a1.45 1.45 0 1 0 0 2.9h5.8l-6.88 7.64a1.45 1.45 0 1 0 2.16 1.95l3.41-3.8a8 8 0 0 1 2.6 3.33M69.56 26.52h-7.01a.82.82 0 0 1-.82-.82v-1.95h8.65v1.95c0 .45-.37.82-.82.82m2.27-9.37c-.8 0-1.45.65-1.45 1.45v2.25h-8.65V18.6a1.45 1.45 0 1 0-2.9 0v7.1a3.73 3.73 0 0 0 3.72 3.72h7.01a3.73 3.73 0 0 0 3.72-3.72v-7.1c0-.8-.65-1.45-1.45-1.45M42.46 3.87c2.22 0 2.33 4.24 2.33 5.08 0 .85-.11 5.09-2.33 5.09-2.21 0-2.32-4.24-2.32-5.08 0-.86.11-5.09 2.32-5.09m0 13.07c1.76 0 3.23-.93 4.14-2.62.71-1.34 1.1-3.2 1.1-5.36s-.39-4.02-1.1-5.37A4.6 4.6 0 0 0 42.46.97c-1.76 0-3.22.93-4.13 2.62-.72 1.35-1.1 3.2-1.1 5.37s.38 4.01 1.1 5.36a4.59 4.59 0 0 0 4.13 2.62"></path>
										<path fill="#000" d="M51.4.49c-.8 0-1.45.65-1.45 1.45v17.78c-1.93.6-5.75 1.13-10.38 1.13h-2.2a1.45 1.45 0 0 0 0 2.9h2.2c2.64 0 7.21-.23 10.38-1.02v4.84a1.45 1.45 0 0 0 2.9 0V1.94c0-.8-.65-1.45-1.45-1.45"></path></g></svg>
					</a>
				</div>
				<nav class="layout-navigation-primary__menu">
					<a class="layout-navigation-primary__menu__item" href="/yomul/">홈</a>
					<a class="layout-navigation-primary__menu__item" href="/">동네생활</a>
					<a class="layout-navigation-primary__menu__item" href="/">내 근처</a>
					<a class="layout-navigation-primary__menu__item" href="/">채팅</a>
					<a class="layout-navigation-primary__menu__item" href="/">마이페이지</a>
				</nav>
				<div class="layout-navigation-primary__right">
					<div class="layout-navigation-bar-search">
						<div class="layout-navigation-search" id="id-1">
							<div class="layout-navigation-search__header">
								<div id="id-1-combobox" class="layout-navigation-search__combobox" role="combobox" aria-haspopup="listbox" aria-expanded="false">
									<div class="layout-navigation-search__input">
										<input type="text" class="layout-navigation-search__input__text" value="" autoComplete="off" size="1" id="id-1-input" aria-autocomplete="list" placeholder="오늘의집 통합검색" aria-label="오늘의집 통합검색" />
										<svg class="layout-navigation-search__input__icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" preserveAspectRatio="xMidYMid meet">
														<path d="M22 22l-5-5"></path>
														<circle cx="11" cy="11" r="8"></circle></svg>
										<div class="layout-navigation-search__input__extra">
											<div class="drop-down layout-navigation-search-image">
												<button class="layout-navigation-search-image__button" type="button" title="이미지 검색" aria-label="이미지 검색">
													<svg class="icon" width="1em" height="1em" fill="none" viewBox="-1 -1 24 24" preserveAspectRatio="xMidYMid meet">
																	<path fill="currentColor" fill-rule="evenodd" d="M7.62.83c-.37 0-.7.22-.84.55l-.96 2.2H1.83C.83 3.58 0 4.4 0 5.42v12.83c0 1.01.82 1.83 1.83 1.83h18.34c1 0 1.83-.82 1.83-1.83V5.42c0-1.02-.82-1.84-1.83-1.84h-4l-.95-2.2a.92.92 0 00-.84-.55H7.62zm7.96 11a4.58 4.58 0 11-9.16 0 4.58 4.58 0 019.16 0z" clip-rule="evenodd"></path></svg>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="layout-navigation-bar-icon layout-navigation-bar-search-button" title="검색" aria-label="검색" type="button">
						<svg class="icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" preserveAspectRatio="xMidYMid meet">
										<path d="M22 22l-5-5"></path>
										<circle cx="11" cy="11" r="8"></circle></svg>
					</button>
					<a class="layout-navigation-bar-icon" title="장바구니" aria-label="장바구니" href="/cart">
						<svg class="icon" width="24" height="24" viewBox="0 0 24 24" stroke="currentColor" fill="none" stroke-linejoin="round" stroke-width="2" preserveAspectRatio="xMidYMid meet">
										<path stroke-linecap="round" d="M4 5h18l-2.6 10.5a2 2 0 0 1-2 1.5H8.6a2 2 0 0 1-2-1.5L4 5zm4 15.5a1.5 1.5 0 1 1 3 0 1.5 1.5 0 1 1-3 0zm7 0a1.5 1.5 0 1 1 3 0 1.5 1.5 0 1 1-3 0z"></path>
										<path d="M1 2h3v3"></path></svg>
					</a>
					<div class="layout-navigation-bar-login">
						<a class="layout-navigation-bar-login__item" href="/users/sign_in?redirect_to=%2Fcustomer_center">로그인</a>
						<a class="layout-navigation-bar-login__item" href="/normal_users/new">회원가입</a>
					</div>
					<div class="drop-down layout-navigation-bar-upload-button">
						<button class="layout-navigation-bar-upload-button__button" type="button">
							글쓰기
							<svg class="icon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
											<path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path></svg>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div data-sticky-enabled="true" data-sticky-disabled="false" data-sticky-always="true" data-sticky-ignore="false" data-direction="top" data-offset="0" class="sticky-container layout-navigation-secondary-wrap" style="position: relative; top: -50px; height: nullpx; transition: .1s top">
		<div class="sticky-child layout-navigation-secondary" style="position: fixed; transform: scaleZ(0px); left: 0px; right: 0px; top: -51px">
			<div class="layout-navigation-secondary__content">
				<nav class="layout-navigation-secondary__menu"></nav>
				<div class="layout-navigation-app-download layout-navigation__bar__app-download">
					<a class="layout-navigation-app-download__link" href="/3d_intro">
						<svg class="icon" width="20" height="20" viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path fill="#35C5F0" d="M16.41 0H3.59A3.59 3.59 0 0 0 0 3.59v12.82A3.59 3.59 0 0 0 3.59 20h12.82A3.59 3.59 0 0 0 20 16.41V3.59A3.59 3.59 0 0 0 16.41 0"></path>
										<path fill="#FFF" d="M14.75 10.34c-.74 0-1.33-.6-1.33-1.34 0-.74.6-1.34 1.33-1.34s1.32.6 1.32 1.34c0 .74-.59 1.34-1.32 1.34zm-1 3.53H6.12V8.75l3.82-2.7 2.2 1.55a3.01 3.01 0 0 0-.35 1.4 3 3 0 0 0 1.98 2.83v2.04zm1-7.87c-.34 0-.66.06-.97.17l-3.17-2.24a1.18 1.18 0 0 0-1.35 0L4.5 7.28a1.2 1.2 0 0 0-.51.98v6.54c0 .66.53 1.2 1.19 1.2h9.5a1.2 1.2 0 0 0 1.18-1.2v-3.02A3 3 0 0 0 17.7 9c0-1.65-1.32-3-2.96-3z"></path></g></svg>
						3D인테리어
						<svg class="icon-beta" width="30" height="14" preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<rect width="30" height="14" fill="#757575" rx="7"></rect>
										<path fill="#FFF" fill-rule="nonzero" d="M7.1 10.59c1.52 0 2.24-.82 2.24-1.96 0-1-.53-1.48-1.33-1.64v-.03c.76-.26 1.05-.78 1.05-1.5 0-1.09-.64-1.73-2.12-1.73H4.69v6.86h2.4zm-.37-3.94h-.9V4.64h.95c.74 0 1.13.25 1.13.99 0 .78-.5 1.02-1.18 1.02zm.2 3.02h-1.1v-2.2h1.04c.82 0 1.26.3 1.26 1.09 0 .75-.42 1.11-1.2 1.11zm7.65.92v-.97h-2.92V7.54h2.22v-.96h-2.22V4.7h2.86v-.97h-4.01v6.86h4.07zm3.8 0V4.7h1.83v-.97h-4.83v.97h1.85v5.89h1.15zm2.92 0l.58-1.74h2.39l.58 1.74h1.2l-2.3-6.86h-1.18l-2.34 6.86h1.07zm2.68-2.66h-1.83l.9-2.74h.03l.9 2.74z"></path></g></svg>
					</a>
				</div>
			</div>
		</div>
	</div>
</header>