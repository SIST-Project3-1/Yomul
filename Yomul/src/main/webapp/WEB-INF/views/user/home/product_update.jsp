<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 물건 수정</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
<link rel="stylesheet" href="/yomul/resources/css/product_write.css">
</head>
<script>
	function fileUpload(fis) {
		var str = fis.value;
		// 이미지를 변경한다.
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#file_img').attr('src', e.target.result);
			$('#img_file').css('display', 'none');
		}
		reader.readAsDataURL(fis.files[0]);
	}
</script>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<form action="product_update_proc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${product.no}">
		<div class="pw_wrap">
			<div class="pw_header">
				<div class="pw_toolBar">
					<div class="pw_logo">
						<h1>
							<a>
								<svg class="icon" width="74" height="30" viewBox="0 0 74 30" preserveAspectRatio="xMidYMid meet">
								<g fill="none" fill-rule="evenodd">
									<path fill="#000"
										d="M10.4,24.55H0.64c-0.53,0-0.64-0.35-0.64-1.3V22c0-0.95,0.11-1.3,0.64-1.3H2.4v-3.25c0-1,0.19-1.24,0.58-1.24h0.83
										c0.39,0,0.6,0.24,0.6,1.24v3.25h2.19v-3.25c0-1,0.21-1.24,0.58-1.24h0.85c0.38,0,0.58,0.24,0.58,1.24v3.25h1.78
										c0.51,0,0.63,0.35,0.63,1.3v1.24C11.03,24.19,10.92,24.55,10.4,24.55z M6.14,15.71H4.93c-2.6,0-4.11-3.16-4.11-6.98
										c0-3.9,1.51-6.98,4.11-6.98h1.21c2.63,0,4.1,3.07,4.1,6.98C10.24,12.55,8.77,15.71,6.14,15.71z M6.07,5.42H5
										c-1.42,0-2.14,1.6-2.14,3.34c0,1.57,0.72,3.28,2.14,3.28h1.07c1.35,0,2.13-1.71,2.13-3.28C8.2,7.02,7.42,5.42,6.07,5.42z" />
									<path fill="#000"
										d="M17.6,21.97h-0.88c-0.39,0-0.58-0.38-0.58-1.36V7.28c0-0.33-0.01-0.38-0.18-0.38h-3.15c-0.53,0-0.63-0.35-0.63-1.3V4.42
										c0-0.95,0.1-1.3,0.63-1.3h3.97c1.17,0,1.4,0.98,1.4,2.87v14.63C18.18,21.59,17.99,21.97,17.6,21.97z M22.64,25.91h-0.82
										c-0.39,0-0.58-0.38-0.58-1.33V13.11h-2.13c-0.51,0-0.63-0.35-0.63-1.33v-1.3c0-0.95,0.11-1.27,0.63-1.27h2.13V2.94
										c0-0.98,0.19-1.33,0.58-1.33h0.82c0.39,0,0.58,0.35,0.58,1.33v21.64C23.22,25.52,23.03,25.91,22.64,25.91z" />
									<path fill="#000"
										d="M35.4,15.38h-3.82v1.63h2.72c0.58,0,0.79,0.53,0.79,1.71v3.61c0,1.21-0.25,1.83-0.88,1.83h-6.24v0.74
										c0,0.21,0,0.27,0.1,0.27h6.67c0.5,0,0.63,0.35,0.63,1.33v0.56c0,0.95-0.13,1.3-0.63,1.3h-7.4c-1.1,0-1.42-1.15-1.42-2.81v-2.78
										c0-1.21,0.22-1.68,0.79-1.68h6.25c0.06,0,0.08-0.03,0.08-0.15v-0.77h-6.5c-0.53,0-0.64-0.33-0.64-1.3v-0.53
										c0-0.98,0.13-1.33,0.64-1.33h2.88v-1.63h-3.79c-0.53,0-0.64-0.35-0.64-1.27v-0.89c0-0.95,0.11-1.3,0.64-1.3h9.77
										c0.51,0,0.63,0.35,0.63,1.3v0.89C36.03,15.03,35.92,15.38,35.4,15.38z M34.29,10.68h-7.11c-1.01,0-1.32-0.95-1.32-2.81V3.53
										c0-1.24,0.22-1.71,0.81-1.71h7.71c0.57,0,0.79,0.47,0.79,1.71v5.29C35.17,9.97,34.9,10.68,34.29,10.68z M33.17,5.13h-5.31v1.89
										c0,0.35,0.03,0.41,0.19,0.41h5.04c0.06,0,0.07-0.06,0.07-0.15V5.13z" />
									<path fill="#000"
										d="M42.6,16.45h-0.88c-0.37,0-0.58-0.41-0.58-1.39V6.28c0-0.3-0.01-0.35-0.18-0.35H37.8c-0.53,0-0.63-0.35-0.63-1.3V3.71
										c0-0.98,0.1-1.33,0.63-1.33h3.97c1.17,0,1.42,0.98,1.42,2.87v9.81C43.19,16.03,42.99,16.45,42.6,16.45z M47.78,27.77h-6.96
										c-1,0-1.43-1.12-1.43-2.84v-5.82c0-0.98,0.21-1.36,0.6-1.36h0.85c0.4,0,0.58,0.38,0.58,1.36v4.4c0,0.38,0.03,0.44,0.21,0.44h6.15
										c0.53,0,0.64,0.35,0.64,1.3v1.21C48.42,27.44,48.31,27.77,47.78,27.77z M47.65,19.91h-0.83c-0.39,0-0.58-0.41-0.58-1.33v-8.16
										h-1.96c-0.51,0-0.63-0.35-0.63-1.33V8.02c0-0.98,0.11-1.3,0.63-1.3h1.96V2.64c0-0.92,0.19-1.33,0.58-1.33h0.83
										c0.39,0,0.58,0.41,0.58,1.33v15.93C48.24,19.49,48.04,19.91,47.65,19.91z" />
									<path fill="#000"
										d="M53.71,22.09c-1.72,0-3.56-2.28-3.56-8.1v-3.28c0-6.09,1.83-8.34,3.56-8.34c1.63,0,3.53,2.19,3.53,8.34v3.28
										C57.24,19.82,55.33,22.09,53.71,22.09z M55.26,10.83c0-2.78-0.57-4.76-1.56-4.76c-1.01,0-1.57,1.98-1.57,4.76v3.01
										c0,2.66,0.57,4.55,1.57,4.55c0.99,0,1.56-1.89,1.56-4.55V10.83z M60.14,25.91h-0.82c-0.38,0-0.58-0.38-0.58-1.33V2.94
										c0-0.98,0.21-1.33,0.58-1.33h0.82c0.39,0,0.6,0.35,0.6,1.33v21.64C60.74,25.52,60.53,25.91,60.14,25.91z" />
									<path fill="#000"
										d="M67.57,21.41h-3.33c-1.18,0-1.47-1.36-1.47-3.13V4.62c0-0.95,0.21-1.36,0.58-1.36h0.82c0.39,0,0.6,0.41,0.6,1.36v12.62
										c0,0.35,0.03,0.47,0.21,0.47h2.6c0.51,0,0.63,0.35,0.63,1.3v1.06C68.19,21.06,68.08,21.41,67.57,21.41z M70.43,25.76h-0.82
										c-0.39,0-0.6-0.38-0.6-1.33V12.87h-2.17c-0.51,0-0.63-0.35-0.63-1.3v-1.21c0-0.98,0.11-1.33,0.63-1.33h2.17V3.23
										c0-0.95,0.21-1.36,0.6-1.36h0.82c0.38,0,0.58,0.41,0.58,1.36v21.19C71.01,25.37,70.81,25.76,70.43,25.76z M73.4,26.05h-0.82
										c-0.38,0-0.58-0.38-0.58-1.33V2.94c0-0.98,0.21-1.33,0.58-1.33h0.82c0.39,0,0.6,0.35,0.6,1.33v21.78
										C74,25.67,73.79,26.05,73.4,26.05z" />
							</g>
						</svg>
							</a>
						</h1>
					</div>
					<!--pw_logo-->

					<!-- pw_tool -->
					<div class="pw_sbtn">

						<button type="submit" class="pw_w_btn">글쓰기</button>
					</div>
				</div>
				<!-- pw_toolBar -->
			</div>
			<!--pw_header-->


			<!--contents 영역-->
			<div class="pw_contentBox">
				<details>
					<summary class="pw_section_header pw_SHbtn">

						<div class="pw_sh_left">
							<div class="pw_shicon">
								<svg class="icon" width="26" height="26" viewBox="0 0 26 26" preserveAspectRatio="xMidYMid meet">
										<rect width="26" height="26" fill="#F8C332" rx="10"></rect>
										<g fill="none" stroke="#FFF">
											<path stroke-linejoin="round" stroke-width="1.2" d="M15.06 8.65l-6.9 6.88L7 18.98l3.45-1.15 6.9-6.9-2.3-2.28z"></path>
											<path stroke-width="1.2" d="M15.04 8.64l1.45-1.45a.65.65 0 01.93 0l1.37 1.38a.65.65 0 010 .92l-1.45 1.45"></path>
											<path d="M8.27 15.2l2.48 2.47"></path>
										</g>
									</svg>
							</div>
							<div class="pw_shtitle">필수 정보 입력</div>
						</div>

						<div class="pw_sh_right">
							<svg class="editor-top-section-expand-icon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
								<path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path>
							</svg>
						</div>

					</summary>

					<div class="pw_oftenW">
						<div class="pw_owContentbox">
							<div class="pw_owformCover">
								<div class="pw_owformCG">
									<div class="pw_owlabel">
										카테고리
										<span class="pw_owlabel1">*</span>
									</div>
									<div class="pw_owCategorybox">
										<div class="pw_owCover">
											<div class="pw_owSelect">

												<select name="category_no" required>
													<option selected value disabled>선택해주세요</option>
													<c:forEach var="category" items="${categories}">
														<option value="${category.no}" ${product.category_no == category.no ? "selected" : ""}>${category.content}</option>
														<!--  카테고리라는 어레이스트를 받아와서 하나씩받아온거에대한 변수명을 카테고리라고 설정 카테고리엔오와 카테고리콘텐츠를 이용해서 데이터를 뽑아온 것		-->
													</c:forEach>

												</select>
												<span class="pw_owIcon">
													<svg class="icon" width="10" height="10" style="fill: currentColor" preserveAspectRatio="xMidYMid meet">
													<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
												</svg>
												</span>
											</div>
											<!--pw_owSelect-->
										</div>
										<!--pw_owCover-->
										<div class="info">필수 입력 항목입니다.</div>
									</div>
									<!--pw_owCategorybox-->
								</div>
								<!--pw_owformCG-->
							</div>
							<div class="pw_owformCover">
								<div class="pw_owformPAY">
									<div class="pw_owlabel">
										가격입력
										<span class="pw_owlabel1">*</span>
									</div>
									<div class="pw_owCategorybox">
										<div class="pw_owCover">
											<div class="pw_owtext">
												<input type="number" id="price" name="price" placeholder="가격을 입력하세요" required value="${product.price}">
												<span class="pw_owIcon2"> ₩ </span>
											</div>


											<!--pw_owSelect-->
										</div>
										<!--pw_owCover-->
										<div class="info">필수 입력 항목입니다.</div>
									</div>
									<!--pw_owCategorybox-->
								</div>
								<!--pw_owformPAY-->
							</div>
							<div class="pw_owformCover">
								<div class="pw_owformPAY">
									<div class="pw_owlabel">
										동네입력
										<span class="pw_owlabel1">*</span>
									</div>
									<div class="pw_owCategorybox">
										<div class="pw_owCover">
											<div class="pw_owtext">
												<input type="text" id="location" name="location" placeholder="지역을 입력하세요" required value="${product.location}">
											</div>

											<!--pw_owSelect-->
										</div>
										<!--pw_owCover-->
										<div class="info">필수 입력 항목입니다.</div>
									</div>
									<!--pw_owCategorybox-->
								</div>
								<!--pw_owformPAY-->
							</div>


						</div>
						<!--pw_owContentbox-->

					</div>
					<!--pw_oftenW-->

				</details>

				<!--포토박스-->
				<div class="pw_ptBox">
					<img src="/yomul/upload/${productImgList.get(0).getSavedFilename()}" id="file_img">
				</div>
				<div class="input-group mb-3">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="filename" name="filename" aria-describedby="profile_img" onchange="fileUpload(this)">
						<label class="custom-file-label" for="profile_img" data-browse="업로드">${productImgList.get(0).filename}</label>
					</div>
				</div>

				<!--pw_textBox -->
				<div class="pw_textBox">
					<input type="text" name="title" id="title" placeholder="제목을 입력하세요" required value="${product.title}">
					<div class="pw_editorWrap">
						<textarea name="content" id="content" placeholder="내용을입력하세요" required>${product.content}</textarea>
					</div>
				</div>
			</div>
			<!--pw_contentBox -->

			<!--pw_wrap -->
	</form>
	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>