<%@page import="com.mycgv.comms.Commons"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mycgv.vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycgv.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
String rpage = request.getParameter("page");
NoticeDAO dao = new NoticeDAO();
Commons commons = new Commons();
HashMap<String, Integer> map = commons.getPage(rpage, dao);
//System.out.println(map.get("start"));
//System.out.println(map.get("end"));
ArrayList<NoticeVO> list = dao.getList(map.get("start"), map.get("end"));

//페이징 처리 - startCount, endCount 구하기
/* int startCount = 0;
int endCount = 0;
int pageSize = 5;	//한페이지당 게시물 수
int reqPage = 1;	//요청페이지	
int pageCount = 1;	//전체 페이지 수
int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수

//총 페이지 수 계산
if(dbCount % pageSize == 0){
	pageCount = dbCount/pageSize;
}else{
	pageCount = dbCount/pageSize+1;
}

//요청 페이지 계산
if(rpage != null){
	reqPage = Integer.parseInt(rpage);
	startCount = (reqPage-1) * pageSize+1;
	endCount = reqPage *pageSize;
}else{
	startCount = 1;
	endCount = 5;
} 
*/

//NoticeDAO dao = new NoticeDAO();
//ArrayList<BoardVO> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:10001/mycgv/css/mycgv.css">
<link rel="stylesheet" href="http://localhost:10001/mycgv/css/am-pagination.css">
<script src="http://localhost:10001/mycgv/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:10001/mycgv/js/am-pagination.js"></script>
<script>
	$(document).ready(
			function() {

				var pager = jQuery('#ampaginationsm').pagination({

					maxSize : 7, // max page size
					totals :<%=map.get("dbCount")%>, // total pages	
					page :<%=map.get("rpage")%>, // initial page		
					pageSize : <%=map.get("pageSize")%>, // max number items per page

					// custom labels		
					lastText : '&raquo;&raquo;',
					firstText : '&laquo;&laquo;',
					prevText : '&laquo;',
					nextText : '&raquo;',

					btnSize : 'sm' // 'sm'  or 'lg'		
				});

				jQuery('#ampaginationsm').on(
						'am.pagination.change',
						function(e) {
							jQuery('.showlabelsm').text(
									'The selected page no: ' + e.page);
							$(location).attr(
									'href',
									"http://localhost:10001/mycgv/notice/notice_list.jsp?page="
											+ e.page);
						});

			});
</script>
</head>
<body>

	<!-- content -->
	<div class="content">
		<section class="notice_list">
			<h1 class="title">공지사항</h1>
			<table class="content_layout">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
				<%
					// 공지사항 목록 생성
				StringBuffer tbody = new StringBuffer("");
				for (NoticeVO vo : list) {
					tbody.append("<tr>");
					tbody.append("<td>" + vo.getRno() + "</td>");
					tbody.append("<td>");
					tbody.append("	<a href='notice_content.jsp?nid=" + vo.getNid() + "&rno=" + vo.getRno() + "'>" + vo.getNtitle() + "</a>");
					tbody.append("</td>");
					tbody.append("<td>" + vo.getNhit() + "</td>");
					tbody.append("<td>" + vo.getNdate() + "</td>");
					tbody.append("</tr>");
				}
				out.write(tbody.toString());
				%>
				<tr>
					<td colspan=4>
						<div id="ampaginationsm"></div>
					</td>
				</tr>
			</table>
		</section>
	</div>

</body>
</html>