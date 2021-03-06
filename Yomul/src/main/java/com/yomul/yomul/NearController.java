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

import com.yomul.service.ChatService;
import com.yomul.service.CommentService;
import com.yomul.service.FileService;
import com.yomul.service.MemberService;
import com.yomul.service.NearService;
import com.yomul.service.VendorService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.ChatVO;
import com.yomul.vo.CommentVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;

@Controller
public class NearController {

	@Autowired
	private NearService nearService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private FileService fileService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private VendorService vendorService;

	@Autowired
	private ChatService chatService;

	@Autowired
	private FileUtils fileUploadService;

	@RequestMapping(value = "/near_home", method = RequestMethod.GET)
	public ModelAndView near_home(NearVO vo) {

		ModelAndView mv = new ModelAndView();
		// 내근처 게시글 데이터 가져오기
		List<NearVO> list = nearService.selectNearList(vo);
		String keyword[] = { "부동산", "카페", "요가", "휴대폰", "마사지", "미용실", "왁싱" };

		mv.addObject("keyword", keyword);
		mv.addObject("list", list);
		mv.setViewName("user/near/near_home");

		return mv;
	}

	/**
	 * 내 근처 글 목록 AJAX 불러오기
	 * 
	 * @param near
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/near_home_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String near_home_ajax(String search, String page) {
		return Commons.parseJson(nearService.getNearList(search, page));
	}

	// 내 근처 글 쓰기 (동네구인구직, 과외/클래스, 농수산물, 중고차)
	@RequestMapping(value = "/near_write", method = RequestMethod.GET)
	public ModelAndView near_write() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/near/near_write");

		return mv;
	}

	@RequestMapping(value = "/near_write_proc", method = RequestMethod.POST)
	public ModelAndView near_write_proc(NearVO vo, @RequestParam("profile_img") List<MultipartFile> files, HttpServletRequest request,
			HttpSession session, FileVO fvo) {
		ModelAndView mv = new ModelAndView();

		MemberVO member = (MemberVO) session.getAttribute("member");

		String url = null;
		int fileCount = fileUploadService.getUploadedCount(files);
		String articleNo = nearService.getArticeNo();

		if (fileCount != 0) {
			url = fileUploadService.restore(articleNo, files, request);
		} else {
			url = "default.jpg";
		}

		mv.addObject("fileCount", fileCount);
		vo.setWriter(member.getNo());
		vo.setWriter_nickname(member.getNickname());

		nearService.getNearWrite(vo, url);

		mv.setViewName("redirect:/near_home");

		return mv;
	}

	@RequestMapping(value = "/near_update/{no}", method = RequestMethod.GET)
	public ModelAndView near_update(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView();
		// 게시글 정보 불러오기
		NearVO vo = nearService.getNearInfo(no);
		mv.addObject("vo", vo);
		mv.setViewName("user/near/near_update");

		return mv;
	}

	@RequestMapping(value = "/near_update_proc/{no}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView near_update_proc(NearVO vo, @PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView();
		nearService.getUpdate(vo, no);
		mv.setViewName("redirect:/near_home");

		return mv;
	}

	// 내 근처 상세보기
	@RequestMapping(value = "/near_info/{no}", method = RequestMethod.GET)
	public ModelAndView near_info(@PathVariable("no") String no, HttpSession session, NearVO vo) {
		ModelAndView mv = new ModelAndView();
		List<NearVO> list = nearService.viewInfo(vo, no);
		mv.addObject("list", list);

		// 조회수 갱신 겸 게시글 유무 확인
		if (nearService.updateNearHits(no) != 0) {
			mv.setViewName("user/near/near_info");

			// 게시글 정보 불러오기
			vo = nearService.getNearInfo(no);
			mv.addObject("vo", vo);

			// 로그인 사용자 체크 세션 값 불러오기
			String loginNo = (String) session.getAttribute("no");
			if (loginNo != null) {
				mv.addObject("loginNo", loginNo);
			}

			// 게시글 파일이 있을 경우 불러오기 //null 값 들어가면 오류!
			if (vo.getFiles() != 0) {
				ArrayList<String> files = fileService.getArticleFiles(no);
				mv.addObject("articleImages", files);
			}

			// 댓글 정보 불러오기
			int commentCount = commentService.getCommentCount(no);
			ArrayList<CommentVO> comments = commentService.getCommentList(no, 1);
			mv.addObject("comments", comments);

			// 댓글 페이지 정보 불러오기
			HashMap<String, Integer> commentPageInfo = Commons.getPageInfo(commentCount, 10);
			mv.addObject("commentPageInfo", commentPageInfo);

			// 업체 게시글일 경우 단골 정보 불러오기
			if (vo.getVno() != null) {
				int vendorCustomerCount = vendorService.getVendorCustomerCount(vo.getVno());
				mv.addObject("vendorCustomerCount", vendorCustomerCount);
			}

		} else { // 게시글이 없을 경우 에러페이지 이동
			mv.setViewName("redirect:/user/error");
		}

		return mv;
	}

	/**
	 * 채팅 처리
	 * 
	 * @param vo
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "near_chat", method = RequestMethod.GET)
	public String near_chat(ChatVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		vo.setChat_from(member.getNo());
		vo.setChat_to(memberService.getNo(vo.getChat_to()));
		int result = chatService.chat(vo);

		return String.valueOf(result);
	}

	// 단골 등록 ajax
	@ResponseBody
	@RequestMapping(value = "/near_info/add_vendor_customer_proc", method = RequestMethod.GET)
	public String near_info_comment(String vno, HttpSession session) {
		// 로그인한 계정 번호 불러오기
		String mno = Commons.getMno(session);
		if (mno.equals("")) { // 로그인이 안되어 있을 경우 -1 반환
			return "-1";
		}

		int result = vendorService.switchVendorCustomer(vno, mno);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/near_news_form", method = RequestMethod.GET)
	public String near_news_form() {
		return "user/near/near_news_form";
	}

	@RequestMapping(value = "/near_card_form", method = RequestMethod.GET)
	public ModelAndView near_card_form(NearVO vo, String word) {
		ModelAndView mv = new ModelAndView();
		List<NearVO> list = nearService.selectNearCardList(vo, word);
		if (word != null) {
			mv.addObject("word", word);
		}
		mv.addObject("list", list);
		mv.setViewName("user/near/near_card_form");
		return mv;
	}
}
