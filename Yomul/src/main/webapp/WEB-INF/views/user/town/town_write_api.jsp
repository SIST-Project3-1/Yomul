<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네생활 글쓰기</title>
<style>
.town-write-content {
	/*border:1px red solid;*/
	width:80%;
	margin:auto;
	padding:50px;
}
.town-write-btn {
	border:1px red solid;
	height:50px;
	margin-top:70px;
}
.town-write-editor {
	display:flex;
	justify-content: center;
	height:400px;
}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<div id="town_write" class="town-write-content">
		<form name="" method="post" action="#">
		<div>
				<label>제목</label>
				<input type="text" placeholder="제목을 입력해 주세요" required name="title">
			</div>
			<div>
				<label>카테고리</label>
				<select name="category" id="category" class="near-write-category" required>
					<option value="카테고리" disabled selected hidden>카테고리를 설정해 주세요</option>
					<option value="동네구인구직">동네구인구직</option>
					<option value="과외/클래스">과외/클래스</option>
					<option value="농수산물">농수산물</option>
					<option value="중고차">중고차</option>
				</select>
			</div>
			<div class="town-write-editor">
				<!-- 표시할 textarea 영역 -->
			    <textarea id="town_write_editor" name="town_write_editor" rows="10" cols="100" style="width: 100%;"></textarea>
			</div>
			<div class="town-write-btn">
				<button type="submit" onclick="townWriteForm()">완료</button>
			</div>
		</form>
		
		<!-- SmartEditor2 라이브러리 -->
		<script src="texteditor/js/service/HuskyEZCreator.js"></script>
		
		<!-- 페이지 로딩시 초기화 -->
		<script type="text/javascript">
		var oEditors = []; 
		nhn.husky.EZCreator.createInIFrame({ 
			oAppRef : oEditors, 
			elPlaceHolder : "town_write_editor",
			sSkinURI : "texteditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams : { 
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : false,
				// 버튼 클릭 이벤트
				bUseModeChanger : true
			}
		});
		function townWriteForm(){
			oEditors.getById["town_write_editor"].exec("UPDATE_CONTENTS_FIELD", []); //textarea의 id를 적어줍니다.
		}
		</script>
	</div>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>
