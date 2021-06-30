<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>오늘 시작하는 인테리어, 오늘의집</title>
<!-- phone 즐겨찾기 아이콘 설정 -->
<link rel="alternate" href="android-app://net.bucketplace/http/ohou.se/deep" />
<link rel="apple-touch-icon" sizes="57x57" href="/assets/bookmark_icon/favicon_57x57.png" />
<link rel="apple-touch-icon" sizes="72x72" href="/assets/bookmark_icon/favicon_72x72.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/assets/bookmark_icon/favicon_114x114.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/assets/bookmark_icon/favicon_144x144.png" />
<link rel="shortcut icon" href="/assets/bookmark_icon/favicon_144x144.png" />
<link href="https://static.ohou.se/assets/favicon-186ac0d991a44c522f984d86e6a50d24c65b7b3a02a004ba7e13f5722aabd952.png" rel="shortcut icon" />

<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="sHKgWExAaiAvAd5e9sncH3DVwVS1Jt0wHw38+/CwkSYGNIGSnBoSCabu77BEX1F4QzcIzspz0srxKf4U9+UHuw==" />

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" media="screen" href="https://static.ohou.se/assets/v3/layout/application_react-790a108e6a9b26136290c8bea25696fec3e4701284512f9eed313b7dbb352615.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/17-308f2ccf.chunk.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/App-a3b0be05.chunk.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/templates-ContactUs-221a95cd.chunk.css" />

<!--[if lte IE 9]>
  <script>
    alert("본 서비스는 Microsoft Explorer 11 이하는 지원하지 않습니다. 브라우저를 업그레이드하고 사용하시거나 앱을 다운받아 사용하실 수 있습니다. 확인을 누르면 앱 다운로드 링크로 연결됩니다.");
    window.location.href = "https://play.google.com/store/apps/details?id=net.bucketplace&hl=kor";
  </script>
  <![endif]-->
</head>
<body>
	<div data-react-class="App"
		data-react-props="{&quot;url&quot;:&quot;/customer_center&quot;,&quot;host&quot;:&quot;ohou.se&quot;,&quot;data&quot;:{},&quot;additional_data&quot;:[{&quot;url&quot;:&quot;/web_navigation&quot;,&quot;data&quot;:{&quot;app_download_banner&quot;:{&quot;selling&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/banners/download/162495486706180517.png&quot;,&quot;selling_width&quot;:800,&quot;selling_height&quot;:240,&quot;mobile_selling&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/banners/download/162495485853859829.png&quot;,&quot;mobile_selling_width&quot;:1080,&quot;mobile_selling_height&quot;:552,&quot;non_selling&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;non_selling_width&quot;:0,&quot;non_selling_height&quot;:0,&quot;mobile_non_selling&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;mobile_non_selling_width&quot;:0,&quot;mobile_non_selling_height&quot;:0,&quot;story&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;story_width&quot;:0,&quot;story_height&quot;:0,&quot;mobile_story&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;mobile_story_width&quot;:0,&quot;mobile_story_height&quot;:0,&quot;card&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;card_width&quot;:0,&quot;card_height&quot;:0,&quot;mobile_card&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;mobile_card_width&quot;:0,&quot;mobile_card_height&quot;:0,&quot;mobile_navigation&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/banners/download/162495484621840469.png&quot;,&quot;mobile_navigation_width&quot;:1500,&quot;mobile_navigation_height&quot;:300},&quot;store_pc_top_banner&quot;:{&quot;id&quot;:38,&quot;type&quot;:&quot;StoreTopBanner&quot;,&quot;contents&quot;:[{&quot;content_type&quot;:&quot;outbound&quot;,&quot;content_id&quot;:null,&quot;content_url&quot;:&quot;https://ohou.se/competitions/222&quot;,&quot;cover_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/store/banners/store_top_banners/162495481352319298.png&quot;,&quot;pc_gradient_color&quot;:&quot;#00c7f5&quot;}]},&quot;store_feeds&quot;:[{&quot;id&quot;:1,&quot;feed_title&quot;:&quot;프리미엄&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreWeddingFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;inbound&quot;,&quot;id&quot;:null,&quot;url&quot;:&quot;https://ohou.se/productions/feed?theme=wedding&quot;}},{&quot;id&quot;:133,&quot;feed_title&quot;:&quot;오늘의딜&quot;,&quot;update_alert&quot;:false,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;TodayDeal&quot;,&quot;id&quot;:null,&quot;url&quot;:&quot;https://ohou.se/commerces/today_deals&quot;}},{&quot;id&quot;:139,&quot;feed_title&quot;:&quot;지정일배송&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;Exhibition&quot;,&quot;id&quot;:1763,&quot;url&quot;:&quot;https://ohou.se/exhibitions/1763&quot;}},{&quot;id&quot;:141,&quot;feed_title&quot;:&quot;소파AtoZ&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;Exhibition&quot;,&quot;id&quot;:1766,&quot;url&quot;:&quot;https://ohou.se/exhibitions/1766&quot;}},{&quot;id&quot;:138,&quot;feed_title&quot;:&quot;여름이불쿠폰&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;Exhibition&quot;,&quot;id&quot;:1755,&quot;url&quot;:&quot;https://ohou.se/exhibitions/1755&quot;}}],&quot;store_hamburger&quot;:{&quot;categories&quot;:[{&quot;id&quot;:10000000,&quot;title&quot;:&quot;가구&quot;,&quot;hash&quot;:&quot;0&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957395536835601.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161957395536835601.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957395536835601.png/1280/none&quot;,&quot;count&quot;:98599,&quot;has_featured_html&quot;:false},{&quot;id&quot;:18000000,&quot;title&quot;:&quot;패브릭&quot;,&quot;hash&quot;:&quot;1&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854256250450.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272854256250450.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854256250450.png/1280/none&quot;,&quot;count&quot;:59736,&quot;has_featured_html&quot;:false},{&quot;id&quot;:11000000,&quot;title&quot;:&quot;홈데코/조명&quot;,&quot;hash&quot;:&quot;2&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854884271631.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272854884271631.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854884271631.jpg/1280/none&quot;,&quot;count&quot;:104685,&quot;has_featured_html&quot;:false},{&quot;id&quot;:14000000,&quot;title&quot;:&quot;가전&quot;,&quot;hash&quot;:&quot;3&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161216975678557539.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161216975678557539.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161216975678557539.jpg/1280/none&quot;,&quot;count&quot;:21754,&quot;has_featured_html&quot;:false},{&quot;id&quot;:13000000,&quot;title&quot;:&quot;수납/정리&quot;,&quot;hash&quot;:&quot;11&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855244407144.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272855244407144.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855244407144.png/1280/none&quot;,&quot;count&quot;:15897,&quot;has_featured_html&quot;:false},{&quot;id&quot;:12000000,&quot;title&quot;:&quot;생활&quot;,&quot;hash&quot;:&quot;4&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855493684929.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272855493684929.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855493684929.png/1280/none&quot;,&quot;count&quot;:32208,&quot;has_featured_html&quot;:false},{&quot;id&quot;:16000000,&quot;title&quot;:&quot;주방&quot;,&quot;hash&quot;:&quot;5&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855727364568.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272855727364568.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855727364568.png/1280/none&quot;,&quot;count&quot;:77966,&quot;has_featured_html&quot;:false},{&quot;id&quot;:23000000,&quot;title&quot;:&quot;생필품&quot;,&quot;hash&quot;:&quot;21&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908153618086793.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161908153618086793.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908153618086793.jpg/1280/none&quot;,&quot;count&quot;:9307,&quot;has_featured_html&quot;:false},{&quot;id&quot;:19000000,&quot;title&quot;:&quot;DIY/공구&quot;,&quot;hash&quot;:&quot;6&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957416847026150.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161957416847026150.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957416847026150.png/1280/none&quot;,&quot;count&quot;:13095,&quot;has_featured_html&quot;:false},{&quot;id&quot;:17000000,&quot;title&quot;:&quot;시공/서비스&quot;,&quot;hash&quot;:&quot;7&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856052872341.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272856052872341.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856052872341.png/1280/none&quot;,&quot;count&quot;:1472,&quot;has_featured_html&quot;:false},{&quot;id&quot;:15000000,&quot;title&quot;:&quot;반려동물&quot;,&quot;hash&quot;:&quot;8&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856259758368.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272856259758368.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856259758368.png/1280/none&quot;,&quot;count&quot;:8546,&quot;has_featured_html&quot;:false},{&quot;id&quot;:20000000,&quot;title&quot;:&quot;캠핑&quot;,&quot;hash&quot;:&quot;20&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908155875260311.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161908155875260311.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908155875260311.jpg/1280/none&quot;,&quot;count&quot;:2373,&quot;has_featured_html&quot;:false},{&quot;id&quot;:22000000,&quot;title&quot;:&quot;홈트레이닝&quot;,&quot;hash&quot;:&quot;22&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908182476349756.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161908182476349756.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908182476349756.png/1280/none&quot;,&quot;count&quot;:2112,&quot;has_featured_html&quot;:false},{&quot;id&quot;:27000000,&quot;title&quot;:&quot;유아/아동&quot;,&quot;hash&quot;:&quot;26&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255156423021446.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/162255156423021446.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255156423021446.png/1280/none&quot;,&quot;count&quot;:6952,&quot;has_featured_html&quot;:false},{&quot;id&quot;:26000000,&quot;title&quot;:&quot;렌탈&quot;,&quot;hash&quot;:&quot;25&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255158657578618.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/162255158657578618.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255158657578618.png/1280/none&quot;,&quot;count&quot;:1734,&quot;has_featured_html&quot;:false}],&quot;shortcut_items&quot;:[{&quot;id&quot;:89,&quot;link_url&quot;:&quot;https://ohou.se/productions/feed?theme=wedding&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;프리미엄&quot;,&quot;update_alert&quot;:true},{&quot;id&quot;:90,&quot;link_url&quot;:&quot;https://ohou.se/commerces/ranks&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;베스트&quot;,&quot;update_alert&quot;:false},{&quot;id&quot;:93,&quot;link_url&quot;:&quot;https://ohou.se/commerces/today_deals&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;오늘의딜&quot;,&quot;update_alert&quot;:true},{&quot;id&quot;:92,&quot;link_url&quot;:&quot;https://ohou.se/exhibitions&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;기획전&quot;,&quot;update_alert&quot;:false},{&quot;id&quot;:94,&quot;link_url&quot;:&quot;https://ohou.se/competitions/feed&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;이벤트&quot;,&quot;update_alert&quot;:false}]},&quot;cart_count&quot;:0,&quot;unseen_notification&quot;:0,&quot;login_user&quot;:null,&quot;login_admin&quot;:null,&quot;following_feed&quot;:{&quot;new_badge&quot;:false,&quot;dot_badge&quot;:false}}}],&quot;user&quot;:null,&quot;is_admin&quot;:false,&quot;admin&quot;:null,&quot;api_gateway&quot;:&quot;https://api.ohou.se&quot;}"
		data-hydrate="t" class="page"
	>
		<div class="layout">
			<div class="layout-top-banner">
				<div class="layout-top-banner-mobile layout-top-banner-mobile--unloaded">
					<button class="layout-top-banner-mobile__button" type="button" aria-label="오늘의집 앱으로 보기">
						<div class="layout-top-banner-mobile__button__image" style="background-image: url(&amp;#x27;https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/download/162495484621840469.png?gif=1&amp;amp;w=480&amp;#x27;); background-size: contain; background-repeat: no-repeat"></div>
					</button>
					<button class="layout-top-banner-mobile__close" type="button" aria-label="닫기">
						<svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
							<path d="M6.8 6l4.2 4.2-.8.8L6 6.8 1.8 11l-.8-.8L5.2 6 1 1.8l.8-.8L6 5.2 10.2 1l.8.8L6.8 6z"></path></svg>
					</button>
				</div>
				<div class="layout-top-banner-pc">
					<a class="layout-top-banner-pc__backdrop-left" tabindex="-1" draggable="false" style="background-color: #00c7f5" href="/competitions/222"></a>
					<a class="layout-top-banner-pc__backdrop-right" tabindex="-1" draggable="false" style="background-color: #00c7f5" href="/competitions/222"></a>
					<button class="layout-top-banner-pc__close" type="button" aria-label="닫기">
						<svg class="icon" width="24" height="24" fill="currentColor" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
							<path d="M12 11.3l8.13-8.14.7.7L12.72 12l8.13 8.13-.7.7L12 12.72l-8.13 8.13-.7-.7L11.28 12 3.16 3.87l.7-.71L12 11.29z"></path></svg>
					</button>
				</div>
			</div>
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
								<a class="layout-navigation-primary__menu__item" href="/">커뮤니티</a>
								<a class="layout-navigation-primary__menu__item" href="/store">스토어</a>
								<a class="layout-navigation-primary__menu__item" href="/experts">인테리어시공</a>
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
			<div id="contact-us">
				<div class="container--my-page">
					<article id="customer-center" class="customer-center">
						<h1 class="customer-center__title">고객센터</h1>
						<div class="row">
							<section class="col-12 col-md-6 customer-center__contact">
								<address>
									운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)
									<br />
									이메일 :
									<a href="/contacts/new" style="text-decoration: underline">이메일 문의하기</a>
									<button class="customer-center__contact__btn-copy-email" type="button">이메일 주소 복사</button>
									<br />
									전화 :
									<a href="tel:1670-0876" style="text-decoration: underline">1670-0876</a>
								</address>
								<button class="btn btn-md btn-priority customer-center__contact__btn-inquiry" type="button">1:1 채팅 상담하기</button>
							</section>
							<section class="col-12 col-md-6 customer-center__faq">
								<ul class="customer-center__faq__list">
									<li>
										<a class="customer-center__faq__item" href="/customer_center#배송관련__배송은+얼마나+걸리나요">배송은 얼마나 걸리나요?</a>
									</li>
									<li>
										<a class="customer-center__faq__item" href="/customer_center#취소+환불__주문+취소는+어떻게+하나요">주문 취소는 어떻게 하나요?</a>
									</li>
									<li>
										<a class="customer-center__faq__item" href="/customer_center#서비스+기타__제품의+자세한+정보는+어떻게+알+수+있나요">제품의 자세한 정보를 알고 싶어요.</a>
									</li>
									<li>
										<a class="customer-center__faq__item" href="/customer_center#반품+교환__제품이+불량입니다.+반품+혹은+교환은+어떻게+하나요">제품이 불량일 때는?</a>
									</li>
								</ul>
							</section>
						</div>
					</article>
					<section class="col-12 customer-center__contact--mobile">
						<p class="customer-center__contact--mobile__operating">운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)</p>
						<button class="btn btn-xs btn-normal customer-center__contact--mobile__button" type="button">1:1 채팅 상담하기</button>
						<a class="btn btn-xs btn-normal customer-center__contact--mobile__button" href="/contacts/new">이메일 문의하기</a>
						<a href="tel:1670-0876" class="btn btn-xs btn-normal customer-center__contact--mobile__button">전화 문의하기</a>
					</section>
				</div>
				<div class="container--my-page">
					<article id="faq" class="faq">
						<nav class="faq__nav">
							<ul class="faq__nav__list">
								<li class="faq__nav__item faq__nav__item--active">
									<a href="/customer_center#전체">전체</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#주문+결제">주문/결제</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#배송관련">배송관련</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#취소+환불">취소/환불</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#반품+교환">반품/교환</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#증빙서류발급">증빙서류발급</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#회원정보변경">회원정보변경</a>
								</li>
								<li class="faq__nav__item">
									<a href="/customer_center#서비스+기타">서비스/기타</a>
								</li>
							</ul>
						</nav>
						<article class="faq__contents">
							<section class="faq__contents__group">
								<section id="주문+결제__주문+내역은+어떻게+확인할+수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										주문 내역은 어떻게 확인할 수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑]을 통해 확인 가능합니다</p>
									</div>
								</section>
								<section id="주문+결제__결제+방법은+어떤+것이+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										결제 방법은 어떤 것이 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>신용카드 및 체크카드, 무통장 입금, 휴대폰 소액결제, 네이버페이를 이용해 결제 가능합니다.</p>
									</div>
								</section>
								<section id="주문+결제__비회원주문+및+전화주문이+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										비회원주문 및 전화주문이 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>전화주문은 준비중에 있습니다.</p>
										<p>비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</p>
									</div>
								</section>
								<section id="주문+결제__신용카드+무이자+할부가+되나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										신용카드 무이자 할부가 되나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</p>
									</div>
								</section>
								<section id="주문+결제__신용카드+결제+후+할부+개월+수를+변경+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										신용카드 결제 후 할부 개월 수를 변경 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>결제 후 결제 정보 변경은 불가능 합니다.</p>
										<p>단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</p>
									</div>
								</section>
								<section id="주문+결제__가상계좌+은행을+변경+할+수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										가상계좌 은행을 변경 할 수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>한번 발급 받은 계좌번호는 변경이 불가능합니다.</p>
										<p>재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</p>
									</div>
								</section>
								<section id="주문+결제__주문+후+결제+방법을+변경하고+싶은데+어떻게+해야+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>결제 후 결제 정보 변경은 불가능 합니다.</p>
										<p>단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</p>
									</div>
								</section>
								<section id="주문+결제__결제+시+에러+메시지가+나오는+경우+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										결제 시 에러 메시지가 나오는 경우 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 채팅 상담하기]를 통해 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="주문+결제__신용카드+안전결제(ISP)는+무엇인가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										신용카드 안전결제(ISP)는 무엇인가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>국민카드, BC카드는 인터넷 안전결제(ISP)로 결제가 진행됩니다.</p>
										<p>결제진행시 나타나는 안내에 따라 결제하실 카드번호와 사용하시는 이메일 및 비밀번호를 입력하여 인터넷 안전결제(ISP)등록 후 결제를 진행해 주시면 됩니다.</p>
										<p>단, 30만원 이상 결제 시에는 공인인증서가 필요합니다.</p>
									</div>
								</section>
								<section id="주문+결제__가상계좌+입금은+언제+확인+되나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										가상계좌 입금은 언제 확인 되나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>입금 후 24시간 이내에 확인됩니다.</p>
										<p>24시간 이후에도 입금확인이 되지 않는 경우 결제 금액과 입금한 금액이 같은지, 올바른 계좌로 입금하였는지 확인 후</p>
										<p>[나의쇼핑 &gt; 고객센터 &gt; 1:1 채팅 상담하기]를 통해 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="주문+결제__가상계좌+입금인을+다르게+적은경우+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										가상계좌 입금인을 다르게 적은경우 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>입금인이 달라도 가상계좌번호만 같으면 문제없습니다.</p>
									</div>
								</section>
							</section>
							<section class="faq__contents__group">
								<section id="배송관련__배송비는+얼마인가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										배송비는 얼마인가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집은 상품정보 중계 및 판매 매체이며, 판매 업체 별로 배송비 정책이 상이합니다각 상품상세페이지에서 배송비를 확인하실 수 있습니다.</p>
									</div>
								</section>
								<section id="배송관련__배송확인은+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										배송확인은 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필의 [나의쇼핑]을 통해 배송단계를 한눈에 보실 수 있습니다.</p>
										<p>또한 배송이 시작되면 카카오톡 알림톡 또는 SMS로 안내메시지가 발송됩니다.</p>
									</div>
								</section>
								<section id="배송관련__배송은+얼마나+걸리나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										배송은 얼마나 걸리나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>상품 배송 기간은 배송 유형에 따라 출고 일자 차이가 있습니다.자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능하며, 배송 유형 별 기본 출고 기간은 아래와 같습니다.</p>
										<p>∙ 일반 택배 / 화물 택배 : 결제 후 1~3 영업일 이내 출고됩니다.</p>
										<p>∙ 업체 직접 배송 : 배송 지역에 따라 배송 일자가 상이할 수 있으므로 상품 상세 페이지에서 확인 해주세요.</p>
										<p></p>
										<p>※ 영업일은 주말, 공휴일을 제외한 기간입니다.</p>
										<p>※ 제조사의 사정에 따라 출고일은 지연될 수 있는 점 양해 부탁드립니다.</p>
									</div>
								</section>
								<section id="배송관련__여러+상품을+묶음+배송+받으려면+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										여러 상품을 묶음 배송 받으려면 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>각 상품별로 배송처가 상이할 수 있기 때문에 묶음 배송은 어렵습니다.</p>
										<p>단, 배송처가 같은 경우 배송처의 정책에 따라 가능 할 수 있습니다.</p>
									</div>
								</section>
								<section id="배송관련__원하는+날짜로+맞춰서+배송을+받을수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										원하는 날짜로 맞춰서 배송을 받을수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>각 배송처 정책에 따라 상이할 수 있습니다.</p>
									</div>
								</section>
								<section id="배송관련__배송+시작+알림+메시지를+받았는데,+배송추적이+되지+않습니다.+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										배송 시작 알림 메시지를 받았는데, 배송추적이 되지 않습니다. 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>송장번호 등록 후 1영업일 이내 또는 실제 상품배송이 진행됨과 동시에 배송추적이 가능합니다.</p>
										<p></p>
										<p>※ 배송처에서 배송이 시작되기 전, 송장을 먼저 출력 후 송장번호를 입력하는 경우가 있습니다.</p>
									</div>
								</section>
								<section id="배송관련__배송조회를+해보면+배송완료로+확인되는데+택배를+받지+못했습니다.+어떻게+해아하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										배송조회를 해보면 배송완료로 확인되는데 택배를 받지 못했습니다. 어떻게 해아하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>경비실 또는 무인택배함을 먼저 확인 부탁드립니다.</p>
										<p>별도의 위탁 장소가 없는 경우 배송기사님께서 임의의 장소에 보관하셨을 수 있으니, 기사님께 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="배송관련__해외배송이+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										해외배송이 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>현재는 국내배송만 진행하고 있습니다.</p>
									</div>
								</section>
							</section>
							<section class="faq__contents__group">
								<section id="취소+환불__주문+취소는+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										주문 취소는 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>판매처에서 주문을 확인하기 전이라면 언제든 취소하실 수 있으며, [나의 쇼핑 &gt; 주문배송내역 조회 &gt; 주문상세보기]에서 직접 주문취소하실 수 있습니다.</p>
										<p></p>
										<p>※ 이미 판매처에서 상품을 확인해 준비 중이라면, 직접 취소가 어렵습니다. 상세 페이지에 확인되는 판매자 연락처 또는 오늘의집 고객센터로 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="취소+환불__취소+후+환불은+언제되나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										취소 후 환불은 언제되나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>신용카드 및 체크카드의 경우 카드사에서 확인 절차를 거치는 관계로 평균 3~7일 영업일 이내 환불처리가 완료됩니다.</p>
										<p>무통장 입금의 경우 평균 3영업일 이내 요청 하신 계좌로 환불됩니다.</p>
										<p>휴대폰 소액결제의 경우 평균 3영업일 이내 환불 또는 취소 처리가 완료됩니다.</p>
									</div>
								</section>
								<section id="취소+환불__여러+개의+상품을+주문했는데,+일부만+취소할+수도+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										여러 개의 상품을 주문했는데, 일부만 취소할 수도 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>신용카드 및 체크카드 또는 무통장 입금의 경우 배송 상태에 따라 결제후 부분 취소가 가능하며,배송상태에 따른 취소 가능 여부는 아래와 같습니다.</p>
										<p>- 입금대기 및 결제완료 단계: 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 주문배송내역 조회]에서 즉시취소가능합니다.</p>
										<p>- 배송준비중: 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 채팅 상담하기]로 취소 가능 여부 문의 부탁드립니다.</p>
										<p>- 배송중 : 주문 취소가 불가능합니다. 수령후 반품 처리 부탁드립니다.</p>
										<p></p>
										<p>※ 단, 가상계좌로 입금 전이라면 부분 취소처리가 불가능하므로 재주문 부탁드립니다.</p>
									</div>
								</section>
							</section>
							<section class="faq__contents__group">
								<section id="반품+교환__제품이+불량입니다.+반품+혹은+교환은+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										제품이 불량입니다. 반품 혹은 교환은 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>업체(브랜드)마다 발송처 및 반품절차가 다릅니다.</p>
										<p>- 우측 상단 프로필 사진을 클릭 후 [나의쇼핑] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후 교환/반품 접수 후 진행 할수 있습니다. 교환/반품 접수 없이 임의로 반송한 경우에는 처리가 늦어질 수 있습니다.</p>
										<p>- 교환/반품 접수 시 원활한 처리를 위해 불량 사진이 필요하오니, 가급적 사진을 첨부하여 주시기 바랍니다.</p>
										<p>단, 구매확정 이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="반품+교환__제품의+교환+또는+반품을+할+수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										제품의 교환 또는 반품을 할 수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>상품을 수령하신 후 7일 이내에 교환, 반품이 가능합니며, 고객님의 변심에 의한 교환/반품의 경우 배송비용이 부과될 수 있습니다.</p>
										<p></p>
										<p>※ 단, 아래의 경우 교환/반품이 불가능합니다.</p>
										<p>- 고객님의 책임 사유로 인해 상품 등이 멸실 또는 훼손된 경우</p>
										<p>- 개봉 및 포장이 훼손으로 상품가치가 현저히 상실된 경우</p>
										<p>- 시간 경과에 의해 재판매가 어려울정도로 상품 가치가 현저히 저하된 경우</p>
										<p>- 고객주문 확인 후 상품제작에 들어가는 주문 제작 상품</p>
										<p>- 직접 조립하는(DIY) 상폼을 조립 한 경우</p>
									</div>
								</section>
								<section id="반품+교환__제품의+교환+또는+반품은+어떻게+신청+할+수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										제품의 교환 또는 반품은 어떻게 신청 할 수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>업체(브랜드)마다 발송처 및 반품절차가 다릅니다.</p>
										<p>- 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 주문 상세보기] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후 교환/반품 접수 후 진행 할수 있습니다.</p>
										<p>교환/반품 접수 없이 임의로 반송한 경우에는 처리가 늦어질 수 있습니다.</p>
										<p>- 반품을 보내실때는 제품이 훼손되지 않도록 안전하게 충분히 포장 부탁드립니다.</p>
										<p>단, 구매확정 이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="반품+교환__반품+시,+사은품도+같이+반품해야+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										반품 시, 사은품도 같이 반품해야 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>사은품도 같이 동봉하여 반품해 주셔야 반품처리가 완료됩니다.</p>
									</div>
								</section>
								<section id="반품+교환__주문한+것과+다른+상품이+왔습니다.+어떻게+해아하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										주문한 것과 다른 상품이 왔습니다. 어떻게 해아하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 채팅 상담하기]를 통해 문의 주시면 확인 도움드리겠습니다.</p>
									</div>
								</section>
							</section>
							<section class="faq__contents__group">
								<section id="증빙서류발급__세금계산서를+받고+싶은데+어떻게+해야+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										세금계산서를 받고 싶은데 어떻게 해야 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>세금계산서 발급은 어려우며, 결제 시 지출증빙 또는 현금영수증 발행은 가능합니다.</p>
									</div>
								</section>
								<section id="증빙서류발급__주문+후+지출증빙/현금영수증+발행이+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										주문 후 지출증빙/현금영수증 발행이 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>주문 완료 후 지출증빙/현금영수증 발행은 불가능합니다. /n지출증빙/현금영수증을 원하사는 경우 반드시 주문 시 &quot;입금자 정보 입력&quot;란에 지출증빙/소득공제 발행 신청을 선택 후 요청정보(주민등록번호/현금영수증 카드번호/휴대폰번호/사업자등록번호)를 입력하셔야 합니다.</p>
									</div>
								</section>
								<section id="증빙서류발급__현금영수증+발급을+다른+사람으로+하고+싶습니다." class="faq__contents__item">
									<div class="faq__contents__item__question">
										현금영수증 발급을 다른 사람으로 하고 싶습니다.<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>타인의 명의로 현금영수증 발급을 원하실경우 상품 주문 시 발급 받으실 고객님의 정보(주민등록번호/현금영수증 카드번호/휴대폰번호)를 입력해주시면 됩니다.</p>
									</div>
								</section>
								<section id="증빙서류발급__주문건의+결제+금액을+나눠서+영수증+발행이+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										주문건의 결제 금액을 나눠서 영수증 발행이 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>주문하신 내역 중 일부 상품에 대해서만 분할로 영수증을 발급 받으실 수는 없습니다.</p>
									</div>
								</section>
							</section>
							<section class="faq__contents__group">
								<section id="회원정보변경__비밀번호+변경은+어떻게하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										비밀번호 변경은 어떻게하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필 사진을 클릭 후 [마이홈 &gt; 설정 &gt; 비밀번호 변경] 페이지에서 비밀번호 변경이 가능합니다.</p>
									</div>
								</section>
								<section id="회원정보변경__회원탈퇴+후+재가입이+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										회원탈퇴 후 재가입이 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 재가입은 언제든지 가능합니다.</p>
									</div>
								</section>
								<section id="회원정보변경__회원정보를+수정하고+싶은데+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										회원정보를 수정하고 싶은데 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필 사진을 클릭 후 [마이홈 &gt; 설정 &gt; 회원정보수정] 페이지에서 회원 정보 수정이 가능합니다.</p>
									</div>
								</section>
								<section id="회원정보변경__푸시+알림+설정은+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										푸시 알림 설정은 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>모바일앱을 통해 설정 가능하며 [마이페이지 &gt; 설정 &gt; 푸시 알림 설정]을 통해 푸시알림 수신 설정이 가능합니다.</p>
									</div>
								</section>
								<section id="회원정보변경__회원탈퇴는+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										회원탈퇴는 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 PC 웹사이트 또는 모바일 앱에서 가능합니다.</p>
										<p>PC 웹사이트: 우측 상단 프로필 사진 클릭 후 [마이페이지 &gt; 설정 &gt; 회원정보수정] 상단의 탈퇴하기 버튼 클릭해주세요.</p>
										<p>모바일 앱: [마이페이지 &gt; 설정 &gt; 프로필 수정] 하단의 탈퇴하기 버튼을 클릭해주세요.</p>
										<p>전문가 회원은 이메일 pro@bucketplace.net으로 문의해주시면 감사하겠습니다.</p>
									</div>
								</section>
							</section>
							<section class="faq__contents__group">
								<section id="서비스+기타__&quot;좋아요&quot;를+누른+콘텐츠(사진/집들이/노하우/등)들은+어디서+볼+수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										&quot;좋아요&quot;를 누른 콘텐츠(사진/집들이/노하우/등)들은 어디서 볼 수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>우측 상단 프로필 사진을 클릭 후 [마이홈 &gt; 좋아요] 페이지에서 확인 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__제품의+자세한+정보는+어떻게+알+수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										제품의 자세한 정보는 어떻게 알 수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>각 제품의 상세 페이지에서 확인 가능하며, 더욱 자세한 정보는 제품상세페이지 내 문의하기를 통해 판매 업체에 문의 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__좋지않은+댓글을+받았습니다.+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										좋지않은 댓글을 받았습니다. 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>댓글 아래에 신고 버튼을 눌러 댓글 신고가 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__인기게시글,+인기유저의+기준은+무엇인가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										인기게시글, 인기유저의 기준은 무엇인가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 추천 알고리즘에 따라 인기게시글과 유저가 뽑히게 됩니다.</p>
										<p>많은 분들에게 공감되는 인테리어 사진을 통해 인기 유저가 되어보세요.</p>
									</div>
								</section>
								<section id="서비스+기타__오늘의집에서+다루는+컨텐츠는+어떤것이+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										오늘의집에서 다루는 컨텐츠는 어떤것이 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집에서 다루는 컨텐츠는 크게 사진, 온라인집들이, 전문가집들이, 노하우로 구분됩니다.</p>
										<p>사진은 자신만의 인테리어 공간 및 소품등을 공유하는 소셜네트워크 공간입니다.여러분의 스타일링 사진을 자유롭게 올려주세요.</p>
										<p>온라인집들이는 오늘의집 사용자들이 직접 집을 꾸민 후 인테리어에 후기와 구체적인 정보를 공유하는 컨텐츠 입니다. 여러분의 집을 소개하거나 다른 분의 집을 제보해주세요.</p>
										<p>전문가집들이는 오늘의집의 인테리어 전문가들이 실제 시공 후 작성하는 포트폴리오 입니다.</p>
										<p>노하우는 오늘의집유저, 파워블로거, 인테리어 전문가 분들이 만들어 가는 인테리어 가이드입니다. 여러분의 인테리어 관심을 언제나 열려있는 노하우 작가신청을 통해 공유해주세요.</p>
										<p></p>
									</div>
								</section>
								<section id="서비스+기타__집들이와+노하우는+어떻게+업로드+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										집들이와 노하우는 어떻게 업로드 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 홈페이지 접속하신 다음 우측 상단 연필 모양 버튼 클릭 후 노하우 또는 집들이 업로드가 가능합니다.</p>
										<p>모바일앱과 모바일웹은 지원하지 않으며 PC 웹사이트에서만 작성 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__인테리어+상담과+시공을+직접해주시나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										인테리어 상담과 시공을 직접해주시나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 전문가 찾기 서비스는 오늘의집 사용자와 인테리어 전문가님을 중개하는 서비스로,</p>
										<p>오늘의집이 직접 상담과 시공을 진행하지 않습니다.</p>
									</div>
								</section>
								<section id="서비스+기타__전문가계정은+무엇인가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										전문가계정은 무엇인가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 전문가 계정은 홍보가 어려웠던 인테리어 전문가님에게</p>
										<p>홍보를 효율적으로 관리하실 수 있게 마련된 계정입니다.</p>
										<p>전문가 계정을 통해 오늘의집 100만 사용자들에게 더욱 손쉬운 홍보가 가능하니 많은 이용 부탁드립니다.</p>
									</div>
								</section>
								<section id="서비스+기타__전문가계정+신청은+어떻게하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										전문가계정 신청은 어떻게하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 전문가 전용 페이지 [Pro.ohou.se] 에서 가입 신청 하시거나,</p>
										<p>[오늘의집 &gt; 회원가입 &gt; 시공전문가] 에서 신청하실 수 있습니다.</p>
										<p>자세한 문의는 고객센터 혹은 카카오톡 &#x27;오늘의집 전문가&#x27;를 이용 부탁드립니다.!</p>
									</div>
								</section>
								<section id="서비스+기타__모바일앱이+정상+동작하지+않아요.+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										모바일앱이 정상 동작하지 않아요. 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>먼저 사용하시는 어플리케이션 버전이 최신 버전인지 확인부탁드립니다.</p>
										<p>최신 버전에서도 계속 장애가 발생한다면, [마이페이지 &gt; 설정 &gt; 의견보내기] 를 통해 신고 가능합니다.</p>
										<p>신고시 반드시 사용하시는 플랫폼(안드로이드/iOS), 어플리케이션 버전 그리고 장애 내용과 발생되는 과정을 설명 부탁드립니다.</p>
										<p>스크린샷을 첨부해 주시면 더욱 원활한 처리가 가능하니 참고 부탁드립니다.</p>
									</div>
								</section>
								<section id="서비스+기타__회원가입시+이미+가입된+이메일이라고+표시됩니다.+어떻게+해야하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										회원가입시 이미 가입된 이메일이라고 표시됩니다. 어떻게 해야하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>contact@bucketplace.net으로 문의 부탁드립니다.</p>
									</div>
								</section>
								<section id="서비스+기타__오늘의집을+PC나+맥에서도+볼수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										오늘의집을 PC나 맥에서도 볼수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>가능합니다. 아이폰,안드로이드 어플리케이션과 함께 웹사이트도 제공하고있으며, 웹브라우저를 통해 https://ohou.se 로 접속하시면 보실 수 있습니다.</p>
									</div>
								</section>
								<section id="서비스+기타__오늘의집을+앱으로도+볼수+있나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										오늘의집을 앱으로도 볼수 있나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>가능합니다. 웹사이트와 함께 아이폰, 안드로이드 어플리케이션도 제공하고있으며, 앱스토어 또는 플레이스토어에서 &quot;오늘의집&quot;을 검색해 다운받을 수 있습니다.</p>
									</div>
								</section>
								<section id="서비스+기타__온라인+집들이에+우리집을+소개하고+싶어요.+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										온라인 집들이에 우리집을 소개하고 싶어요. 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>오늘의집 PC 웹사이트에 접속하신 다음 우측 상단 연필 모양 버튼 클릭 후 집들이 선택 시 신청이 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__상담방법과+상담가능시간+유선번호는+어떻게+되나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										상담방법과 상담가능시간 유선번호는 어떻게 되나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>상담 시간은 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)이며, 전화번호는 1670-0876 입니다.</p>
										<p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 채팅 상담하기] 를 이용하시면 상담원과 채팅으로 더욱 빠르고 편리하게 문의 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__입점+및+제휴/광고+문의는+어떻게+하나요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										입점 및 제휴/광고 문의는 어떻게 하나요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>입점 신청은 https://ohou.se/partner/applications/new 에서,</p>
										<p>제휴/광고 문의는 https://ohou.se/contacts/new?type=request 페이지에서 신청 가능합니다.</p>
									</div>
								</section>
								<section id="서비스+기타__오늘의집+채용은+어디에서+확인+가능한가요" class="faq__contents__item">
									<div class="faq__contents__item__question">
										오늘의집 채용은 어디에서 확인 가능한가요?<span class="icon--page-mypage" style="position: absolute; right: 0; top: 50%; transition: transform .2s ease; transform: translateY(-50%); background-position-x: -120px; background-position-y: -160px; width: 12px; height: 12px"></span>
									</div>
									<div class="faq__contents__item__answer" style="max-height: 0; opacity: 0; padding-top: 0">
										<p>http://bucketplace.co.kr/recruit 페이지에서 확인 가능합니다.</p>
									</div>
								</section>
							</section>
						</article>
					</article>
				</div>
			</div>
			<footer class="layout-footer">
				<div class="layout-footer__content">
					<div class="layout-footer__top">
						<address class="layout-footer__cs">
							<div class="layout-footer__cs__row">
								<a class="layout-footer__cs__link" href="/customer_center">
									고객센터
									<svg class="icon" aria-hidden="true" width="1em" height="1em" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
										<path fill="currentColor" fill-rule="nonzero" d="M6 19.692L8.25 22 18 12 8.25 2 6 4.308 13.5 12z"></path></svg>
								</a>
							</div>
							<div class="layout-footer__cs__row">
								<a class="layout-footer__cs__tel" href="tel:1670-0876">1670-0876</a>
							</div>
							<span class="layout-footer__cs__time">평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)</span>
						</address>
						<div class="layout-footer__outbound">
							<a class="layout-footer__outbound__item" href="https://itunes.apple.com/kr/app/oneul-uijib-intelieo-gong/id1008236892" target="_blank" rel="noreferrer noopener" title="앱스토어" aria-label="앱스토어">
								<svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet">
									<path fill-rule="evenodd" d="M22.34 15.57a5.6 5.6 0 0 0 3.42 5.15c-.02.1-.53 1.84-1.78 3.62-1.05 1.57-2.15 3.1-3.9 3.13-1.69.04-2.26-1-4.2-1-1.96 0-2.57.97-4.2 1.04-1.65.06-2.92-1.67-4-3.23-2.18-3.17-3.87-8.93-1.6-12.85a6.23 6.23 0 0 1 5.24-3.2c1.66-.03 3.2 1.12 4.22 1.12 1 0 2.91-1.38 4.88-1.17.82.02 3.17.32 4.68 2.52-.13.08-2.8 1.64-2.76 4.87zm-3.2-9.48a4.8 4.8 0 0 1-3.8 1.8c-.18-1.46.54-3 1.34-3.95A5.81 5.81 0 0 1 20.44 2c.17 1.5-.43 3-1.3 4.09z"></path></svg>
							</a>
							<a class="layout-footer__outbound__item" href="https://play.google.com/store/apps/details?id=net.bucketplace" target="_blank" rel="noreferrer noopener" title="플레이스토어" aria-label="플레이스토어">
								<svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet">
									<path fill-rule="evenodd" d="M4.22 26.95A2.35 2.35 0 0 1 4 25.9V3.8c0-.42.08-.77.22-1.05l12.1 12.1-12.1 12.1zm.74.68l12.07-12.07 3.7 3.7-14.2 8.1c-.6.34-1.14.42-1.57.27zm15.78-17.2l-3.71 3.71L4.96 2.07c.14-.04.3-.07.45-.07.34 0 .72.1 1.12.34l14.2 8.1zm.9.52l4.32 2.46c1.39.8 1.39 2.09 0 2.88l-4.32 2.46-3.9-3.9 3.9-3.9z"></path></svg>
							</a>
							<a class="layout-footer__outbound__item" href="https://story.kakao.com/ch/bucketplace" target="_blank" rel="noreferrer noopener" title="카카오스토리" aria-label="카카오스토리">
								<svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet">
									<path fill="#757575" fill-rule="evenodd" d="M19.02 6h-8.04a.96.96 0 0 0-.98.93v8.16c0 .51.44.93.98.93h3.7c-.02.9-.4 1.9-.99 2.77a10.3 10.3 0 0 1-2 2.06l-.03.03c-.11.1-.2.22-.2.38 0 .12.07.21.14.31l.02.02 2.57 2.76s.13.12.23.15c.12.02.25.03.34-.04A12.25 12.25 0 0 0 20 14.79V6.93a.96.96 0 0 0-.98-.93"></path></svg>
							</a>
							<a class="layout-footer__outbound__item" href="https://www.facebook.com/interiortoday" target="_blank" rel="noreferrer noopener" title="페이스북" aria-label="페이스북">
								<svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet">
									<path fill="#757575" fill-rule="evenodd" d="M16.67 26V15H20v-3.38h-3.33V9.07c-.02-.76.08-1.29 1.66-1.7H20V4h-3.33c-3.2 0-4.46 1.84-4.17 5.08v2.53H10V15h2.5v11h4.17z"></path></svg>
							</a>
							<a class="layout-footer__outbound__item" href="https://www.instagram.com/todayhouse" target="_blank" rel="noreferrer noopener" title="인스타그램" aria-label="인스타그램">
								<svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet">
									<path fill="#757575" fill-rule="evenodd"
										d="M15 3c3.26 0 3.67.02 4.95.08 1.27.05 2.14.26 2.9.55a5.88 5.88 0 0 1 2.13 1.39 5.88 5.88 0 0 1 1.39 2.12c.3.77.5 1.64.55 2.91.06 1.28.08 1.7.08 4.95s-.02 3.67-.08 4.95a8.78 8.78 0 0 1-.55 2.9 5.88 5.88 0 0 1-1.39 2.13 5.88 5.88 0 0 1-2.12 1.39c-.77.3-1.64.5-2.91.55-1.28.06-1.7.08-4.95.08s-3.67-.02-4.95-.08a8.78 8.78 0 0 1-2.9-.55 5.88 5.88 0 0 1-2.13-1.39 5.88 5.88 0 0 1-1.39-2.12c-.3-.77-.5-1.64-.55-2.91C3.02 18.67 3 18.25 3 15s.02-3.67.08-4.95c.05-1.27.26-2.15.55-2.9a5.88 5.88 0 0 1 1.39-2.13 5.88 5.88 0 0 1 2.12-1.39c.76-.3 1.64-.5 2.91-.55C11.33 3.02 11.75 3 15 3zm0 2.17c-3.2 0-3.58 0-4.85.07-1.17.05-1.8.24-2.22.4-.56.23-.96.49-1.38.9a3.7 3.7 0 0 0-.9 1.39 6.64 6.64 0 0 0-.41 2.22A82.92 82.92 0 0 0 5.17 15c0 3.2 0 3.58.07 4.85.05 1.17.24 1.8.4 2.22.23.56.49.96.9 1.38.43.42.83.68 1.39.9.42.17 1.05.36 2.22.41 1.27.06 1.65.07 4.85.07 3.2 0 3.58 0 4.85-.07a6.67 6.67 0 0 0 2.23-.4c.56-.23.96-.49 1.38-.9.42-.43.68-.83.9-1.39.16-.42.35-1.05.4-2.22.06-1.27.07-1.65.07-4.85 0-3.2 0-3.58-.06-4.85a6.66 6.66 0 0 0-.42-2.23 3.72 3.72 0 0 0-.9-1.38 3.7 3.7 0 0 0-1.37-.9 6.64 6.64 0 0 0-2.23-.4A82.92 82.92 0 0 0 15 5.15zm0 3.67a6.16 6.16 0 1 1 0 12.32 6.16 6.16 0 0 1 0-12.32zM15 19a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm7.84-10.4a1.44 1.44 0 1 1-2.88 0 1.44 1.44 0 0 1 2.88 0z"
									></path></svg>
							</a>
							<a class="layout-footer__outbound__item" href="http://naver.me/51ckkDZh" target="_blank" rel="noreferrer noopener" title="네이버 포스트" aria-label="네이버 포스트">
								<svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet">
									<path fill="#757575" fill-rule="evenodd" d="M8.5 5h13v13h-13V5zm7.45 4v2.52L14.05 9H12v5h2.05v-2.52l1.9 2.52H18V9h-2.05zm3.11 13h-8.12L8.5 19h13l-2.44 3zm-.81 1L15 27l-3.25-4h6.5z"></path></svg>
							</a>
						</div>
					</div>
					<ul class="layout-footer__shortcut">
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="http://bucketplace.co.kr/brand-story" target="_blank">브랜드 스토리</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="http://bucketplace.co.kr/" target="_blank">회사소개</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="http://bucketplace.co.kr/recruit" target="_blank">채용정보</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/usepolicy" target="_blank">이용약관</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item layout-footer__shortcut__item--bold" rel="noopener" href="/privacy" target="_blank">개인정보처리방침</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/customer_notices" target="_blank">공지사항</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/customer_center" target="_blank">고객센터</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/new" target="_blank">고객의 소리</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="https://pro.ohou.se/?utm_source=ohouse&amp;utm_medium=web&amp;utm_campaign=prosignup&amp;utm_content=footer" target="_blank">전문가 등록</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/b2b" target="_blank">사업자 구매회원</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/new?type=request" target="_blank">제휴/광고 문의</a>
						</li>
						<li>
							<a class="layout-footer__shortcut__item" rel="noopener" href="/partner/applications/new" target="_blank">입점신청 문의</a>
						</li>
					</ul>
					<address class="layout-footer__info-wrap">
						<dl class="layout-footer__info">
							<a class="layout-footer__info__item" href="http://bucketplace.co.kr/" target="_blank">
								<dt>상호명</dt>
								<dd>(주)버킷플레이스</dd>
							</a>
							<span class="layout-footer__info__item"><dt>이메일</dt>
								<dd>
									(고객문의)
									<a href="mailto:cs@bucketplace.net"> cs@bucketplace.net </a>
									(제휴문의)
									<a href="mailto:contact@bucketplace.net"> contact@bucketplace.net</a>
								</dd></span>
							<span class="layout-footer__info__item"><dt>대표이사</dt>
								<dd>이승재</dd></span>
							<span class="layout-footer__info__item"><dt>사업자등록번호</dt>
								<dd>119-86-91245</dd></span>
							<span class="layout-footer__info__item"><dt>통신판매업신고번호</dt>
								<dd>제2018-서울서초-0580호</dd></span>
							<span class="layout-footer__info__item"><dt>주소</dt>
								<dd>서울 서초구 서초대로74길 4 삼성생명서초타워 27층</dd></span>
						</dl>
						<dl class="layout-footer__info">
							<span class="layout-footer__info__item"><dt>우리은행 채무지급보증안내</dt>
								<dd>
									(주)버킷플레이스는 고객님이 현금결제한 금액에 대해 우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.
									<a class="layout-footer__info__item__link" href="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/161646429944190689.jpg?gif=1&amp;w=1440" target="_blank" rel="noopener noreferrer">서비스가입사실 확인</a>
								</dd></span>
						</dl>
						<span class="layout-footer__info"><span class="layout-footer__info__item">(주)버킷플레이스는 통신판매중개자로서 통신판매의 당사자가 아니며, 입점업체가 등록한 상품, 상품정보 및 거래에 대하여 (주)버킷플레이스는 일체 책임을 지지 않습니다.</span></span>
					</address>
					<p class="layout-footer__copyright">Copyright 2014. bucketplace, Co., Ltd. All rights reserved</p>
				</div>
			</footer>
		</div>
	</div>


	<div id="modal-root"></div>
	<div id="toast-message-root"></div>
	<div id="flash_messages"></div>


</body>
</html>
