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
<meta name="csrf-token" content="Usxqe36y/NuYjktrXfoWRu5IqU8Z2CAiOblNyAr4uOmkmISszrg8jUmWFhSzhm4gFIgDde/9DwOZRFTOoTWv/Q==" />

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" media="screen" href="https://static.ohou.se/assets/v3/layout/application_react-790a108e6a9b26136290c8bea25696fec3e4701284512f9eed313b7dbb352615.css" />
<script src="https://static.ohou.se/assets/v3/layouts/navigation_stub-2afc6570f26c12358127eb3d1d8b54fc3aa1df1f1a041c239fcf21d9abcade4a.js"></script>

<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/17-308f2ccf.chunk.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/App-a3b0be05.chunk.css" />
<link rel="stylesheet" media="screen" href="https://static.ohou.se/dist/css/templates-User-SignUp-UserSignUp-ddce14ea.chunk.css" />

<!--[if lte IE 9]>
  <script>
    alert("본 서비스는 Microsoft Explorer 11 이하는 지원하지 않습니다. 브라우저를 업그레이드하고 사용하시거나 앱을 다운받아 사용하실 수 있습니다. 확인을 누르면 앱 다운로드 링크로 연결됩니다.");
    window.location.href = "https://play.google.com/store/apps/details?id=net.bucketplace&hl=kor";
  </script>
  <![endif]-->
</head>
<body>
	<div data-react-class="App"
		data-react-props="{&quot;url&quot;:&quot;/normal_users/new&quot;,&quot;host&quot;:&quot;ohou.se&quot;,&quot;data&quot;:{},&quot;additional_data&quot;:[{&quot;url&quot;:&quot;/web_navigation&quot;,&quot;data&quot;:{&quot;app_download_banner&quot;:{&quot;selling&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/banners/download/162495486706180517.png&quot;,&quot;selling_width&quot;:800,&quot;selling_height&quot;:240,&quot;mobile_selling&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/banners/download/162495485853859829.png&quot;,&quot;mobile_selling_width&quot;:1080,&quot;mobile_selling_height&quot;:552,&quot;non_selling&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;non_selling_width&quot;:0,&quot;non_selling_height&quot;:0,&quot;mobile_non_selling&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;mobile_non_selling_width&quot;:0,&quot;mobile_non_selling_height&quot;:0,&quot;story&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;story_width&quot;:0,&quot;story_height&quot;:0,&quot;mobile_story&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;mobile_story_width&quot;:0,&quot;mobile_story_height&quot;:0,&quot;card&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;card_width&quot;:0,&quot;card_height&quot;:0,&quot;mobile_card&quot;:&quot;https://ohou.se/assets/banners/download-app.jpeg&quot;,&quot;mobile_card_width&quot;:0,&quot;mobile_card_height&quot;:0,&quot;mobile_navigation&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/banners/download/162495484621840469.png&quot;,&quot;mobile_navigation_width&quot;:1500,&quot;mobile_navigation_height&quot;:300},&quot;store_pc_top_banner&quot;:{&quot;id&quot;:38,&quot;type&quot;:&quot;StoreTopBanner&quot;,&quot;contents&quot;:[{&quot;content_type&quot;:&quot;outbound&quot;,&quot;content_id&quot;:null,&quot;content_url&quot;:&quot;https://ohou.se/competitions/222&quot;,&quot;cover_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/store/banners/store_top_banners/162495481352319298.png&quot;,&quot;pc_gradient_color&quot;:&quot;#00c7f5&quot;}]},&quot;store_feeds&quot;:[{&quot;id&quot;:1,&quot;feed_title&quot;:&quot;프리미엄&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreWeddingFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;inbound&quot;,&quot;id&quot;:null,&quot;url&quot;:&quot;https://ohou.se/productions/feed?theme=wedding&quot;}},{&quot;id&quot;:133,&quot;feed_title&quot;:&quot;오늘의딜&quot;,&quot;update_alert&quot;:false,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;TodayDeal&quot;,&quot;id&quot;:null,&quot;url&quot;:&quot;https://ohou.se/commerces/today_deals&quot;}},{&quot;id&quot;:139,&quot;feed_title&quot;:&quot;지정일배송&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;Exhibition&quot;,&quot;id&quot;:1763,&quot;url&quot;:&quot;https://ohou.se/exhibitions/1763&quot;}},{&quot;id&quot;:141,&quot;feed_title&quot;:&quot;소파AtoZ&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;Exhibition&quot;,&quot;id&quot;:1766,&quot;url&quot;:&quot;https://ohou.se/exhibitions/1766&quot;}},{&quot;id&quot;:138,&quot;feed_title&quot;:&quot;여름이불쿠폰&quot;,&quot;update_alert&quot;:true,&quot;type&quot;:&quot;StoreFeed&quot;,&quot;content&quot;:{&quot;type&quot;:&quot;Exhibition&quot;,&quot;id&quot;:1755,&quot;url&quot;:&quot;https://ohou.se/exhibitions/1755&quot;}}],&quot;store_hamburger&quot;:{&quot;categories&quot;:[{&quot;id&quot;:10000000,&quot;title&quot;:&quot;가구&quot;,&quot;hash&quot;:&quot;0&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957395536835601.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161957395536835601.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957395536835601.png/1280/none&quot;,&quot;count&quot;:98979,&quot;has_featured_html&quot;:false},{&quot;id&quot;:18000000,&quot;title&quot;:&quot;패브릭&quot;,&quot;hash&quot;:&quot;1&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854256250450.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272854256250450.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854256250450.png/1280/none&quot;,&quot;count&quot;:59860,&quot;has_featured_html&quot;:false},{&quot;id&quot;:11000000,&quot;title&quot;:&quot;홈데코/조명&quot;,&quot;hash&quot;:&quot;2&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854884271631.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272854884271631.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272854884271631.jpg/1280/none&quot;,&quot;count&quot;:104666,&quot;has_featured_html&quot;:false},{&quot;id&quot;:14000000,&quot;title&quot;:&quot;가전&quot;,&quot;hash&quot;:&quot;3&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161216975678557539.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161216975678557539.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161216975678557539.jpg/1280/none&quot;,&quot;count&quot;:21763,&quot;has_featured_html&quot;:false},{&quot;id&quot;:13000000,&quot;title&quot;:&quot;수납/정리&quot;,&quot;hash&quot;:&quot;11&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855244407144.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272855244407144.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855244407144.png/1280/none&quot;,&quot;count&quot;:15897,&quot;has_featured_html&quot;:false},{&quot;id&quot;:12000000,&quot;title&quot;:&quot;생활&quot;,&quot;hash&quot;:&quot;4&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855493684929.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272855493684929.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855493684929.png/1280/none&quot;,&quot;count&quot;:32208,&quot;has_featured_html&quot;:false},{&quot;id&quot;:16000000,&quot;title&quot;:&quot;주방&quot;,&quot;hash&quot;:&quot;5&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855727364568.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272855727364568.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272855727364568.png/1280/none&quot;,&quot;count&quot;:77978,&quot;has_featured_html&quot;:false},{&quot;id&quot;:23000000,&quot;title&quot;:&quot;생필품&quot;,&quot;hash&quot;:&quot;21&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908153618086793.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161908153618086793.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908153618086793.jpg/1280/none&quot;,&quot;count&quot;:9307,&quot;has_featured_html&quot;:false},{&quot;id&quot;:19000000,&quot;title&quot;:&quot;DIY/공구&quot;,&quot;hash&quot;:&quot;6&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957416847026150.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161957416847026150.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161957416847026150.png/1280/none&quot;,&quot;count&quot;:13095,&quot;has_featured_html&quot;:false},{&quot;id&quot;:17000000,&quot;title&quot;:&quot;시공/서비스&quot;,&quot;hash&quot;:&quot;7&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856052872341.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272856052872341.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856052872341.png/1280/none&quot;,&quot;count&quot;:1472,&quot;has_featured_html&quot;:false},{&quot;id&quot;:15000000,&quot;title&quot;:&quot;반려동물&quot;,&quot;hash&quot;:&quot;8&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856259758368.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/160272856259758368.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-160272856259758368.png/1280/none&quot;,&quot;count&quot;:8546,&quot;has_featured_html&quot;:false},{&quot;id&quot;:20000000,&quot;title&quot;:&quot;캠핑&quot;,&quot;hash&quot;:&quot;20&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908155875260311.jpg/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161908155875260311.jpg&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908155875260311.jpg/1280/none&quot;,&quot;count&quot;:2373,&quot;has_featured_html&quot;:false},{&quot;id&quot;:22000000,&quot;title&quot;:&quot;홈트레이닝&quot;,&quot;hash&quot;:&quot;22&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908182476349756.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/161908182476349756.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-161908182476349756.png/1280/none&quot;,&quot;count&quot;:2112,&quot;has_featured_html&quot;:false},{&quot;id&quot;:27000000,&quot;title&quot;:&quot;유아/아동&quot;,&quot;hash&quot;:&quot;26&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255156423021446.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/162255156423021446.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255156423021446.png/1280/none&quot;,&quot;count&quot;:6952,&quot;has_featured_html&quot;:false},{&quot;id&quot;:26000000,&quot;title&quot;:&quot;렌탈&quot;,&quot;hash&quot;:&quot;25&quot;,&quot;image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255158657578618.png/1280/none&quot;,&quot;original_image_url&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/category/store_hamburger_categories/162255158657578618.png&quot;,&quot;resized_image_url&quot;:&quot;https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-category-store_hamburger_categories-162255158657578618.png/1280/none&quot;,&quot;count&quot;:1734,&quot;has_featured_html&quot;:false}],&quot;shortcut_items&quot;:[{&quot;id&quot;:89,&quot;link_url&quot;:&quot;https://ohou.se/productions/feed?theme=wedding&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;프리미엄&quot;,&quot;update_alert&quot;:true},{&quot;id&quot;:90,&quot;link_url&quot;:&quot;https://ohou.se/commerces/ranks&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;베스트&quot;,&quot;update_alert&quot;:false},{&quot;id&quot;:93,&quot;link_url&quot;:&quot;https://ohou.se/commerces/today_deals&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;오늘의딜&quot;,&quot;update_alert&quot;:true},{&quot;id&quot;:92,&quot;link_url&quot;:&quot;https://ohou.se/exhibitions&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;기획전&quot;,&quot;update_alert&quot;:false},{&quot;id&quot;:94,&quot;link_url&quot;:&quot;https://ohou.se/competitions/feed&quot;,&quot;original_image_url&quot;:&quot;&quot;,&quot;resized_image_url&quot;:&quot;&quot;,&quot;label&quot;:&quot;이벤트&quot;,&quot;update_alert&quot;:false}]},&quot;cart_count&quot;:0,&quot;unseen_notification&quot;:0,&quot;login_user&quot;:null,&quot;login_admin&quot;:null,&quot;following_feed&quot;:{&quot;new_badge&quot;:false,&quot;dot_badge&quot;:false}}}],&quot;user&quot;:null,&quot;is_admin&quot;:false,&quot;admin&quot;:null,&quot;api_gateway&quot;:&quot;https://api.ohou.se&quot;}"
		data-hydrate="t" class="page"
	>
		<section class="container user-sign-up">
			<svg width="88" height="31" viewBox="0 0 88 31" preserveAspectRatio="xMidYMid meet">
				<g fill="none" fill-rule="evenodd">
				<path fill="#35C5F0" d="M23.131 0H5.03C2.424 0 0 2.411 0 5v20c0 2.59 2.424 5 5.029 5h20.114c2.603 0 5.028-2.41 5.028-5V5c0-2.589-2.425-5-5.028-5H23.13z"></path>
				<path fill="#FFF" d="M22.114 15.615a1.99 1.99 0 0 1-1.996-1.984 1.99 1.99 0 0 1 1.996-1.985 1.99 1.99 0 0 1 1.996 1.985 1.99 1.99 0 0 1-1.996 1.984zm-1.488 5.213H9.123v-7.574l5.752-3.988 3.297 2.285a4.397 4.397 0 0 0-.52 2.08 4.44 4.44 0 0 0 2.974 4.183v3.014zm1.488-11.635c-.507 0-.995.086-1.449.24l-4.769-3.306a1.791 1.791 0 0 0-2.042 0l-7.14 4.95a1.771 1.771 0 0 0-.764 1.456v9.676c0 .98.8 1.775 1.785 1.775h14.28a1.78 1.78 0 0 0 1.785-1.775v-4.47a4.438 4.438 0 0 0 2.776-4.108c0-2.45-1.997-4.438-4.462-4.438z"></path>
				<g fill="#000">
				<path
					d="M46.634 22.257h-3.442V19.15c0-.558-.454-1.01-1.015-1.01-.56 0-1.015.452-1.015 1.01v3.107h-3.441c-.561 0-1.016.453-1.016 1.01 0 .558.455 1.01 1.016 1.01h8.913c.56 0 1.015-.452 1.015-1.01 0-.557-.454-1.01-1.015-1.01M39.847 11.118c0-3.193 1.46-3.67 2.33-3.67.87 0 2.33.477 2.33 3.67v.251c0 3.193-1.46 3.67-2.33 3.67-.87 0-2.33-.477-2.33-3.67v-.251zm2.33 5.94c2.69 0 4.361-2.18 4.361-5.69v-.25c0-3.51-1.67-5.69-4.36-5.69-2.69 0-4.362 2.18-4.362 5.69v.251c0 3.51 1.671 5.689 4.361 5.689zM60.037 11.95H49.154c-.56 0-1.015.451-1.015 1.009 0 .558.454 1.01 1.015 1.01h10.883c.561 0 1.016-.452 1.016-1.01s-.455-1.01-1.016-1.01M58.951 22.723c-4.946 1.278-6.604.551-7.088.18-.316-.244-.457-.562-.457-1.033v-.602h7.17c.561 0 1.016-.452 1.016-1.01v-3.53c0-.558-.455-1.01-1.016-1.01H50.39c-.56 0-1.015.452-1.015 1.01 0 .557.454 1.009 1.015 1.009h7.171v1.512H50.39c-.56 0-1.015.452-1.015 1.01v1.61c0 1.094.43 2.004 1.246 2.63.836.643 2.053.965 3.642.965 1.434 0 3.17-.262 5.199-.786.543-.14.869-.692.727-1.231a1.016 1.016 0 0 0-1.238-.724M50.904 10.2h7.558c.56 0 1.015-.452 1.015-1.01 0-.557-.455-1.01-1.015-1.01h-6.543V5.768c0-.558-.454-1.01-1.015-1.01-.561 0-1.015.452-1.015 1.01V9.19c0 .558.454 1.01 1.015 1.01M86.923 5.096c-.56 0-1.015.452-1.015 1.01v8.146c0 .558.454 1.01 1.015 1.01.561 0 1.015-.452 1.015-1.01V6.106c0-.558-.454-1.01-1.015-1.01M81.798 13.986a1.016 1.016 0 0 0 1.3.6c.526-.19.799-.768.607-1.292-.032-.09-.697-1.863-2.358-3.125l2.58-2.853c.267-.296.335-.722.172-1.086a1.016 1.016 0 0 0-.928-.598h-6.326c-.56 0-1.015.452-1.015 1.01 0 .557.455 1.009 1.015 1.009h4.048L79.03 9.71a.176.176 0 0 0-.007.01l-2.933 3.242a1.006 1.006 0 0 0 .077 1.426 1.016 1.016 0 0 0 1.434-.076l2.383-2.636c1.261.887 1.8 2.275 1.814 2.309M85.338 23.19h-4.903a.569.569 0 0 1-.57-.565v-1.357h6.043v1.357a.568.568 0 0 1-.57.566m1.585-6.512c-.56 0-1.015.452-1.015 1.01v1.56h-6.043v-1.56c0-.558-.455-1.01-1.016-1.01-.56 0-1.015.452-1.015 1.01v4.936a2.596 2.596 0 0 0 2.6 2.585h4.904c1.434 0 2.6-1.16 2.6-2.585v-4.936c0-.558-.454-1.01-1.015-1.01M66.393 7.448c1.548 0 1.626 2.944 1.626 3.534 0 .59-.078 3.535-1.626 3.535-1.547 0-1.625-2.945-1.625-3.535 0-.59.078-3.534 1.625-3.534m0 9.088c1.23 0 2.256-.649 2.89-1.826.502-.933.767-2.222.767-3.728 0-1.506-.265-2.794-.767-3.727-.634-1.177-1.66-1.826-2.89-1.826-1.23 0-2.255.649-2.89 1.826-.5.933-.766 2.221-.766 3.727 0 1.506.265 2.795.767 3.728.634 1.177 1.66 1.826 2.89 1.826"
				></path>
				<path d="M72.64 5.096c-.56 0-1.016.452-1.016 1.01v12.358c-1.345.417-4.016.784-7.251.784h-1.546c-.56 0-1.015.452-1.015 1.01 0 .557.454 1.009 1.015 1.009h1.546c1.846 0 5.04-.161 7.251-.708v3.362c0 .558.455 1.01 1.016 1.01.56 0 1.015-.452 1.015-1.01V6.106c0-.558-.454-1.01-1.015-1.01"></path></g></g></svg>
			<div class="user-sign-up__form-wrap">
				<h1 class="user-sign-up__title">회원가입</h1>
				<div class="user-sign-up__sns">
					<p class="user-sign-up__sns__title">SNS계정으로 간편하게 회원가입</p>
					<ol class="user-sign-up__sns__list">
						<li class="user-sign-up__sns__list__item">
							<a href="/users/auth/facebook">
								<svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd">
									<path fill="#3B5998" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
									<path fill="#FFF" d="M25.77 35V24h3.384v-3.385h-3.385v-2.538c-.012-.756.08-1.285 1.693-1.692h1.692V13h-3.385c-3.25 0-4.52 1.84-4.23 5.077v2.538H19V24h2.538v11h4.231z"></path></g></svg>
							</a>
						</li>
						<li class="user-sign-up__sns__list__item">
							<a href="/users/auth/kakao">
								<svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd">
									<path fill="#FFEB00" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
									<path fill="#3C2929"
										d="M24 11.277c8.284 0 15 5.306 15 11.85 0 6.545-6.716 11.85-15 11.85-.92 0-1.822-.066-2.697-.191l-6.081 4.105a.43.43 0 0 1-.674-.476l1.414-5.282C11.777 31.031 9 27.335 9 23.127c0-6.544 6.716-11.85 15-11.85zm6.22 8.407c-.416 0-.718.297-.718.707v5.939c0 .41.289.686.718.686.41 0 .718-.295.718-.686v-1.932l.515-.526 1.885 2.57c.277.374.426.54.691.568.037.003.075.005.112.005.154 0 .66-.04.716-.563.038-.293-.137-.52-.348-.796l-2.043-2.675 1.727-1.743.176-.196c.234-.26.353-.39.353-.587.009-.422-.34-.652-.687-.661-.274 0-.457.15-.57.262l-2.528 2.634v-2.3c0-.422-.288-.706-.717-.706zm-9.364 0c-.56 0-.918.432-1.067.837l-2.083 5.517a.84.84 0 0 0-.065.315c0 .372.31.663.706.663.359 0 .578-.162.69-.51l.321-.97h2.999l.313.982c.111.335.34.498.7.498.367 0 .655-.273.655-.62 0-.056-.017-.196-.081-.369l-2.019-5.508c-.187-.53-.577-.835-1.069-.835zm-2.92.064h-4.452c-.417 0-.642.337-.642.654 0 .3.168.652.642.652h1.51v5.21c0 .464.274.752.716.752.443 0 .718-.288.718-.751v-5.21h1.508c.474 0 .643-.352.643-.653 0-.317-.225-.654-.643-.654zm7.554-.064c-.442 0-.717.287-.717.75v5.707c0 .497.28.794.75.794h2.674c.434 0 .677-.321.686-.627a.642.642 0 0 0-.17-.479c-.122-.13-.3-.2-.516-.2h-1.99v-5.195c0-.463-.274-.75-.717-.75zm-4.628 1.306l.008.01 1.083 3.265h-2.192L20.842 21a.015.015 0 0 1 .028 0z"
									></path></g></svg>
							</a>
						</li>
						<li class="user-sign-up__sns__list__item">
							<a href="/users/auth/naver">
								<svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd">
									<path fill="#00C63B" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
									<path fill="#FFF" d="M21 25.231V34h-7V15h7l6 8.769V15h7v19h-7l-6-8.769z"></path></g></svg>
							</a>
						</li>
					</ol>
				</div>
				<form class="user-sign-up__form">
					<div class="user-sign-up-form__form-group">
						<div class="user-sign-up-form__form-group__label">이메일</div>
						<div class="user-sign-up-form__form-group__input">
							<div class="input-group email-input">
								<span class="email-input__local"><input class="form-control" value="" placeholder="이메일" size="1" /></span><span class="email-input__separator">@</span><span class="email-input__domain"><select class="form-control empty"><option selected="" value="" disabled="">선택해주세요</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="outlook.com">outlook.com</option>
										<option value="icloud.com">icloud.com</option>
										<option value="_manual">직접입력</option></select>
									<button class="email-input__domain__expand" aria-label="초기화" type="button" tabindex="-1">
										<svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
											<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
									</button></span>
							</div>
						</div>
					</div>
					<div class="user-sign-up-form__form-group">
						<div class="user-sign-up-form__form-group__label">비밀번호</div>
						<div class="user-sign-up-form__form-group__description">8자 이상 입력해주세요.</div>
						<div class="user-sign-up-form__form-group__input">
							<input type="password" placeholder="비밀번호" value="" class="form-control" />
						</div>
					</div>
					<div class="user-sign-up-form__form-group">
						<div class="user-sign-up-form__form-group__label">비밀번호 확인</div>
						<div class="user-sign-up-form__form-group__input">
							<input type="password" placeholder="비밀번호 확인" value="" class="form-control" />
						</div>
					</div>
					<div class="user-sign-up-form__form-group">
						<div class="user-sign-up-form__form-group__label">별명</div>
						<div class="user-sign-up-form__form-group__description">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</div>
						<div class="user-sign-up-form__form-group__input">
							<input placeholder="별명 (2~15자)" value="" class="form-control" />
						</div>
					</div>
					<div class="user-sign-up-form__form-group">
						<div class="user-sign-up-form__form-group__label">약관 동의</div>
						<div class="user-sign-up-form__form-group__input">
							<div class="user-sign-up__form__terms-agree">
								<div class="user-sign-up__form__terms-agree__all">
									<div class="form-check checkbox-input">
										<label class="form-check-label">
											<input type="checkbox" class="form-check" />
											<span class="check-img"></span><span class="user-sign-up__form__terms-agree__all__text">전체동의</span>
										</label>
									</div>
								</div>
								<div class="user-sign-up__form__terms-agree__list">
									<div class="user-sign-up__form__terms-agree__row">
										<div class="form-check checkbox-input">
											<label class="form-check-label">
												<input type="checkbox" class="form-check" />
												<span class="check-img"></span><span class="user-sign-up__form__terms-agree__text">만 14세 이상입니다.<span class="user-sign-up__form__terms-agree__required">(필수)</span></span>
											</label>
										</div>
									</div>
									<div class="user-sign-up__form__terms-agree__row">
										<div class="form-check checkbox-input">
											<label class="form-check-label">
												<input type="checkbox" class="form-check" />
												<span class="check-img"></span><span class="user-sign-up__form__terms-agree__text"><a class="user-sign-up__form__terms-agree__link" href="/usepolicy" target="_blank">이용약관</a><span class="user-sign-up__form__terms-agree__required">(필수)</span></span>
											</label>
										</div>
									</div>
									<div class="user-sign-up__form__terms-agree__row">
										<div class="form-check checkbox-input">
											<label class="form-check-label">
												<input type="checkbox" class="form-check" />
												<span class="check-img"></span><span class="user-sign-up__form__terms-agree__text"><a class="user-sign-up__form__terms-agree__link" href="/privacy?type=register" target="_blank">개인정보수집 및 이용동의</a><span class="user-sign-up__form__terms-agree__required">(필수)</span></span>
											</label>
										</div>
									</div>
									<div class="user-sign-up__form__terms-agree__row">
										<div class="form-check checkbox-input">
											<label class="form-check-label">
												<input type="checkbox" class="form-check" />
												<span class="check-img"></span><span class="user-sign-up__form__terms-agree__text">이벤트, 프로모션 알림 메일 및 SMS 수신<span class="user-sign-up__form__terms-agree__chose">(선택)</span></span>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="user-sign-up__submit" type="submit">회원가입 완료</button>
				</form>
				<p class="user-sign-up__sign-in">
					이미 아이디가 있으신가요?
					<a href="/users/sign_in" class="user-sign-up__sign-in__link">로그인</a>
				</p>
			</div>
		</section>
	</div>


	<div id="modal-root"></div>
	<div id="toast-message-root"></div>
	<div id="flash_messages"></div>
</body>
</html>
