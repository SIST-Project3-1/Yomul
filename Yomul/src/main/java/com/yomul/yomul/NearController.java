package com.yomul.yomul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.dao.NearDAO;
import com.yomul.service.CommentService;
import com.yomul.service.FileService;
import com.yomul.service.LikeService;
import com.yomul.service.NearService;
import com.yomul.service.ReportService;
import com.yomul.service.VendorService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.CommentVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;

@Controller
public class NearController {

	@Autowired
	private NearService nearService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private VendorService vendorService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private NearDAO nearDAO;

	@Autowired
	private FileUtils fileUploadService;

	@RequestMapping(value = "/near_home", method = RequestMethod.GET)
	public ModelAndView near_home(NearVO vo) {
		
		ModelAndView mv = new ModelAndView();
		List<NearVO> list = nearService.selectNearList(vo);
		String keyword[] = { "부동산", "카페", "요가", "휴대폰", "마사지", "미용실", "왁싱" };

		mv.addObject("keyword", keyword);
		mv.addObject("list", list);
		mv.setViewName("user/near/near_home");

		return mv;
	}

	// 내 근처 글 쓰기 (동네구인구직, 과외/클래스, 농수산물, 중고차)
	@RequestMapping(value = "/near_write", method = RequestMethod.GET)
	public String near_write() {
		return "user/near/near_write";
	}

	@RequestMapping(value = "/near_write_proc", method = RequestMethod.POST)
	public ModelAndView near_write_proc(NearVO vo, @RequestParam("uploadFile") List<MultipartFile> files, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		int fileCount = fileUploadService.getUploadedCount(files);
		String articleNo = nearDAO.getWriteNumber();
		if(fileCount !=0) {
			String url = fileUploadService.restore(files, nearDAO, request, articleNo);			
			mv.addObject("url", url);
		}
		mv.addObject("fileCount", fileCount);
		int result = nearDAO.getNearWrite(vo);

		if (result == 1) {

			mv.setViewName("redirect:/near_home");

		} else {
			// mv.setViewName("error"); 에러페이지
		}

		return mv;
	}

	@RequestMapping(value = "/near_update", method = RequestMethod.GET)
	public String near_update() {
		return "user/near/near_update";
	}

	// 내 근처 상세보기
	@RequestMapping(value = "/near_info/{no}", method = RequestMethod.GET)
	public ModelAndView near_info(@PathVariable("no") int no, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		// 조회수 갱신 겸 게시글 유무 확인
		if (nearService.updateNearHits(no)) {
			mv.setViewName("user/near/near_info");
			
			// 게시글 정보 불러오기
			NearVO vo = nearService.getNearInfo(no);
			mv.addObject("vo", vo);
			
			// 게시글 파일 불러오기
			ArrayList<String> files = fileService.getArticleFiles("N" + no);
			mv.addObject("articleImages", files);
			
			// 댓글 정보 불러오기
			int commentCount = commentService.getCommentCount("N" + no);
			ArrayList<CommentVO> comments = commentService.getCommentList("N" + no, 1);
			mv.addObject("comments", comments);
			
			// 댓글 페이지 정보 불러오기
			HashMap<String, Integer> commentPageInfo = Commons.getPageInfo(commentCount, 10);
			mv.addObject("commentPageInfo", commentPageInfo);
			
			// 단골 정보 불러오기
			int vendorCustomerCount = vendorService.getVendorCustomerCount(vo.getVno());
			mv.addObject("vendorCustomerCount", vendorCustomerCount);
			
		} else { // 게시글이 없을 경우 에러페이지 이동
			mv.setViewName("redirect:/user/error");
		}
		
		return mv;
	}
	
	// 내 근처 상세페이지 댓글 좋아요 추가 ajax
	@ResponseBody
	@RequestMapping(value = "/near_info/insert_like", method = RequestMethod.GET)
	public String insert_like(String ano, HttpSession session) {
		String mno = (String)session.getAttribute(""); // 여기에 로그인 정보 구하는 코드 넣기~~
		
		if(mno.equals("")) { // 로그인 안한 경우
			return "-1";
		}
		
		return String.valueOf(likeService.insertLike(ano, mno));
	}
	
	// 내 근처 상세페이지 댓글 신고 추가 ajax
	@ResponseBody
	@RequestMapping(value = "/near_info/insert_report", method = RequestMethod.GET)
	public String insert_report(String ano, HttpSession session) {
		String mno = (String)session.getAttribute(""); // 여기에 로그인 정보 구하는 코드 넣기~~

		if(mno.equals("")) { // 로그인 안한 경우
			return "-1";
		}
		
		return String.valueOf(reportService.insertReport(ano, mno));
	}
	
	// 댓글 페이지 이동 ajax
	@ResponseBody
	@RequestMapping(value = "/near_info/comments", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
	public String near_info_comment(int no, int page) {
		int commentCount = commentService.getCommentCount("N" + no);
		ArrayList<CommentVO> comments = commentService.getCommentList("N" + no, page);
		HashMap<String, Integer> commentPageInfo = Commons.getPageInfo(page, commentCount, 10);
		
		// json으로 변환
		String commentsJson = Commons.parseJson(comments);
		String pageInfoJson = Commons.parseJson(commentPageInfo);
		
		// 두 json 객체를 배열에 담아 반환
		return "[" + commentsJson + "," + pageInfoJson + "]";
	}
	
	// 아직 미완 로그인 기능 구현되면 구현한 예정
	// 단골 등록 ajax
	@ResponseBody
	@RequestMapping(value = "/near_info/addVendorCustomer", method = RequestMethod.GET)
	public String near_info_comment(String no, HttpSession session) {
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String vno = "";
		String cno = mvo.getNo();
		
		int result = vendorService.addVendorCustomer(vno, cno);
		
		// 0일 경우 에러
		if(result == 0) {
			return "0";
		}
		
		return String.valueOf(vendorService.getVendorCustomerCount(vno));
	}

	@RequestMapping(value = "/near_news_form", method = RequestMethod.GET)
	public String near_news_form() {
		return "user/near/near_news_form";
	}

	@RequestMapping(value = "/near_card_form", method = RequestMethod.GET)
	public String near_card_form() {
		return "user/near/near_card_form";
	}

	@RequestMapping(value = "/reviews_info", method = RequestMethod.GET)
	public String reviews_info() {
		return "user/near/reviews_info";
	}

}
