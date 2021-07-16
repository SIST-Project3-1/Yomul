package com.yomul.yomul;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yomul.service.CommentService;
import com.yomul.service.FileService;
import com.yomul.service.LikeService;
import com.yomul.service.ReportService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.CommentVO;
import com.yomul.vo.MemberVO;

@Controller
public class CommonsController {
	@Autowired
	private FileService fileService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private FileUtils fileUploadService;

	// 댓글 작성 ajax(미완)
	@ResponseBody
	@RequestMapping(value = "/write_comment_proc", method = RequestMethod.POST)
	public String write_comment(String ano, String content, MultipartFile file, HttpSession session) {
		// 로그인 정보 불러오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mno = member.getNo();
		
		if(mno.equals("")) { // 로그인 안한 경우 -1 반환
			return "-1";
		}
		
		// 댓글 정보 세팅
		CommentVO vo = new CommentVO();
		vo.setArticleNo(ano);
		vo.setWriter(mno);
		vo.setContent(content);
		
		// DB에 댓글 저장
		int result = commentService.addComment(vo);
		
		// 성공 시 1, 실패 시 0 반환
		return String.valueOf(result);
	}
	
	// 좋아요 ajax
	@ResponseBody
	@RequestMapping(value = "/like_proc", method = RequestMethod.GET)
	public String insert_like(String ano, HttpSession session) {
		// 로그인 정보 불러오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mno = member.getNo();
		
		if(mno.equals("")) { // 로그인 안한 경우 -1 반환
			return "-1";
		}
		
		// DB에 좋아요 데이터 저장
		int result = likeService.insertLike(ano, mno);
		
		// 성공 시 1, 실패 시 0 반환
		return String.valueOf(result);
	}
	
	// 신고 ajax
	@ResponseBody
	@RequestMapping(value = "/report_proc", method = RequestMethod.GET)
	public String insert_report(String ano, HttpSession session) {
		// 로그인 정보 불러오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mno = member.getNo();

		if(mno.equals("")) { // 로그인 안한 경우 -1 반환
			return "-1";
		}
		
		// 성공 시 1, 실패 시 0 반환
		return String.valueOf(reportService.insertReport(ano, mno));
	}
	
	// 댓글 페이지 이동 ajax
	@ResponseBody
	@RequestMapping(value = "/comment_pagination_proc", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
	public String near_info_comment(String ano, int page) {
		int commentCount = commentService.getCommentCount(ano);
		
		// 현 페이지 내 댓글 구하기
		ArrayList<CommentVO> comments = commentService.getCommentList(ano, page);
		
		// 페이지네이션 정보 구하기
		HashMap<String, Integer> commentPageInfo = Commons.getPageInfo(page, commentCount, 10);
		
		// json으로 변환
		String commentsJson = Commons.parseJson(comments);
		String pageInfoJson = Commons.parseJson(commentPageInfo);
		
		// 두 json 객체를 배열에 담아 반환
		return "[" + commentsJson + "," + pageInfoJson + "]";
	}

}
