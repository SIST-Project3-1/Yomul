package com.yomul.yomul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.yomul.service.CustomerCenterService;
import com.yomul.service.FaqService;
import com.yomul.service.FileService;
import com.yomul.service.MemberService;
import com.yomul.service.NearService;
import com.yomul.service.NoticeService;
import com.yomul.service.ProductService;
import com.yomul.service.VendorService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;
import com.yomul.vo.NoticeVO;
import com.yomul.vo.ProductVO;
import com.yomul.vo.QnaVO;
import com.yomul.vo.ReviewVO;
import com.yomul.vo.VendorVO;

@Controller
public class AdminController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private CustomerCenterService customerCenterService;
	@Autowired
	private FaqService faqService;
	@Autowired
	private FileService fileService;
	@Autowired
	private NearService nearService;
	@Autowired
	private ProductService productService;
	@Autowired
	private VendorService vendorService;
	@Autowired
	private FileUtils fileUploadService;

	/*
	 * FAQ
	 */
	// 목록 ajax
	@ResponseBody
	@RequestMapping(value = "admin_faq_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String admin_faq_list_ajax(int page, String search, HttpServletRequest request) {
		return Commons.parseJson(faqService.getAdminFaqList(page, search));
	}

	// 목록보기
	@RequestMapping(value = "admin_faq_list", method = RequestMethod.GET)
	public ModelAndView adminFaqList(String page, String search) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/customer_center/faq/admin_faq_list");

		page = page == null ? "1" : page;
		mv.addObject("page", page);
		mv.addObject("search", search);
		mv.addObject("totalPage", faqService.getTotalPageFaq(search));

		return mv;
	}

	// 글쓰기 페이지
	@RequestMapping(value = "admin_faq_write", method = RequestMethod.GET)
	public ModelAndView adminFaqWrite() {
		ModelAndView mv = new ModelAndView();
		ArrayList<CategoryVO> categories = customerCenterService.getFaqCategories(); // 카테고리 정보 //요기서 처음 생

		mv.setViewName("admin/customer_center/faq/admin_faq_write");
		mv.addObject("categories", categories);

		return mv;
	}

	// 글쓰기 데이터 저장
	@RequestMapping(value = "admin_faq_write_proc", method = RequestMethod.GET)
	public ModelAndView adminFaqWriteProc(FaqVO faq, HttpSession session) { // 파라미터 받아오기vo 세션은 작성자가 누군지 알기위해
		ModelAndView mv = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");// 작성자를 가져오기 위해서 member을 적어

		faq.setWriter(member.getNo());// 회원 넘버만 필요해서 가죠온것 faq vo타입으로 넣어야함 와이 faq vo타입으로 저장하기우해set get -- 작성자 저장하는 부

		int result = faqService.getAdminFaqWrite(faq);// 글의저장하는 로직 -> 오라클로 가는
		if (result == 1) {
			mv.setViewName("redirect:/admin_faq_list");
		} else {
			// mv.setViewName("error"); 에러페이지
		}
		return mv;
	}

	// 글 수정 페이지
	@RequestMapping(value = "admin_faq_update", method = RequestMethod.GET)
	public ModelAndView adminFaqUpdate(String no) {
		ModelAndView mv = new ModelAndView();
		
		FaqVO faq = faqService.getAdminFaqUpdateData(no);
		ArrayList<CategoryVO> categories = faqService.updateFaqCategories(faq.getCategory_no()); // 카테고리 정보
		
		mv.setViewName("admin/customer_center/faq/admin_faq_update");
		mv.addObject("categories", categories);
		mv.addObject("faq", faq);
		
		return mv;
	}
	
	// 글 수정 데이터 저장
	@RequestMapping(value = "admin_faq_update_proc", method = RequestMethod.GET)
	public ModelAndView adminFaqUpdateProc(FaqVO faq, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");

		faq.setWriter(member.getNo());

		int result = faqService.getAdminFaqUpdate(faq);
		if (result == 1) {
			mv.setViewName("redirect:/admin_faq_list");
		} else {
			// mv.setViewName("error"); 에러페이지
		}
		return mv;
	}
	
	// 글 삭제
	@ResponseBody
	@RequestMapping(value = "/admin_faq_delete_proc", method = RequestMethod.GET)
	public String adminFaqDelete(FaqVO faq) {
		int result = faqService.getAdminFaqDelete(faq);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return Commons.parseJson(map);
	}

	// 공지사항 목록
	@RequestMapping(value = "admin_notice_list", method = RequestMethod.GET)
	public ModelAndView adminNoticeList(String page) {
		if (page == null) {
			page = "1";
		}
		ModelAndView mv = new ModelAndView();
		ArrayList<NoticeVO> list = noticeService.getNoticeList(page);
		for (NoticeVO vo : list) {
			vo.setNo(vo.getNo().substring(1));
		}
		mv.setViewName("admin/customer_center/notice/admin_notice_list");
		mv.addObject("list", list);
		mv.addObject("page", page);
		mv.addObject("total", noticeService.getTotalPageCount());

		return mv;
	}

	// 공지사항 상세
	@RequestMapping(value = "admin_notice/{no}", method = RequestMethod.GET)
	public ModelAndView noticeList(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = noticeService.getNoticeInfo(no);
		// 해당 공지사항이 없을 경우 에러페이지 이동
		if (vo == null) {
			mv.setViewName("redirect:/error");
		} else {
			ArrayList<String> files = fileService.getNoticeFiles(no);

			vo.setNo(""+no);
			mv.setViewName("admin/customer_center/notice/admin_notice_info");
			mv.addObject("vo", vo);
			mv.addObject("files", files);
		}

		return mv;
	}

//
//	@RequestMapping(value = "admin_notice_info", method = RequestMethod.GET)
//	public String adminNoticeInfo() {
//		return "admin/customer_center/notice/admin_notice_info";
//	}

	// 공지사항 업데이트
	@RequestMapping(value = "admin_notice_update/{no}", method = RequestMethod.GET)
	public ModelAndView adminNoticeUpdate(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = noticeService.getNoticeInfo(no);
		ArrayList<String> files = fileService.getNoticeFiles(no);
		mv.addObject("vo", vo);
		mv.addObject("files", files);
		mv.setViewName("admin/customer_center/notice/admin_notice_update");
		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "admin_notice_delete/{no}", method = RequestMethod.GET)
	public ModelAndView adminNoticeDelete(NoticeVO vo, @PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView();
		int k = Integer.parseInt(no);
		mv.addObject("vo", vo);
		int result = noticeService.deleteNotice(vo, k);
		if (result == 1) {
			mv.setViewName("redirect:/admin_notice_list");
			return mv;
		} else {
			mv.setViewName("redirect:/admin_notice/{no}");
			return mv;
		}
	}

	/**
	 * 공지사항 업데이트 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin_notice_update_proc", method = RequestMethod.POST)
	public ModelAndView adminNoticeUpdate_proc(NoticeVO vo, @RequestParam("notice_img") List<MultipartFile> multifile, HttpServletRequest request,
			HttpSession session, FileVO fvo, String no) {
		int k = Integer.parseInt(no);
		ModelAndView mv = new ModelAndView();
		String url = null;
		int fileCount = fileUploadService.getUploadedCount(multifile);
		String articleNo = "N"+vo.getNo();

		if (fileCount != 0) {
			FileVO file = new FileVO();
			file.setArticle_no(articleNo);
			file.setNo(0);
			file.setFilename(multifile.get(0).getOriginalFilename());

			fileUploadService.uploadFile(file, multifile.get(0), request);
		}

		mv.addObject("fileCount", fileCount);
		int result = noticeService.updateNotice(vo, k);
		if (result == 1) {
			mv.setViewName("redirect:/admin_notice_list");
			return mv;
		} else {
			mv.setViewName("redirect:/admin_notice_update");
			return mv;
		}
	}

	/**
	 * 공지사항 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "admin_notice_write", method = RequestMethod.GET)
	public String adminNoticeWrite() {
		return "admin/customer_center/notice/admin_notice_write";
	}

	/**
	 * 공지사항 작성 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin_notice_write_proc", method = RequestMethod.POST)
	public ModelAndView adminNoticeWrite_proc(NoticeVO vo, @RequestParam("notice_img") List<MultipartFile> multifile, HttpServletRequest request,
			HttpSession session, FileVO fvo) {
		ModelAndView mv = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");
		int fileCount = fileUploadService.getUploadedCount(multifile);
		String articleNo = noticeService.getNoticeNo();

		if (fileCount != 0) {
			FileVO file = new FileVO();
			file.setArticle_no(articleNo);
			file.setNo(0);
			file.setFilename(multifile.get(0).getOriginalFilename());

			fileUploadService.uploadFile(file, multifile.get(0), request);
		}

		mv.addObject("fileCount", fileCount);
		vo.setNo(articleNo);
		vo.setWriter(member.getNo());
		int result = noticeService.writeNotice(vo);
		if (result == 1) {
			mv.setViewName("redirect:/admin_notice_list");
			return mv;
		} else {
			mv.setViewName("redirect:/admin_notice_write");
			return mv;
		}
	}

	/**
	 * 관리자 QnA 목록 가져오기
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/admin_qna_list", method = RequestMethod.GET)
	public ModelAndView adminQnaList(QnaVO vo) {
		ModelAndView mv = new ModelAndView("admin/customer_center/qna/admin_qna_list");

		Integer category = vo.getCategory();
		Integer reply = vo.getReply();

		mv.addObject("categories", customerCenterService.getQnaCategories());
		mv.addObject("category", null == category ? "null" : category);
		mv.addObject("reply", null == reply ? "null" : reply);

		return mv;
	}

	/**
	 * 관리자 QnA 상세보기
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/admin_qna_info", method = RequestMethod.GET)
	public ModelAndView adminQnaInfo(QnaVO vo) {
		ModelAndView mv = new ModelAndView("admin/customer_center/qna/admin_qna_info");
		mv.addObject("qna", customerCenterService.getQnaInfo(vo));
		mv.addObject("images", fileService.getFileList(vo.getNo()));
		return mv;
	}

	/**
	 * 관리자 QnA 답변하기 처리
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin_qna_reply", method = RequestMethod.POST)
	public String admin_qna_reply(QnaVO qna, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		return String.valueOf(customerCenterService.replyQnA(member, qna));
	}

	/*
	 * 업체 관리 페이지
	 */
	@RequestMapping(value = "/admin_vendor_list", method = RequestMethod.GET)
	public ModelAndView adminVendorList(String page, String search) {
		ModelAndView mv = new ModelAndView("admin/vendor/admin_vendor_list");
		page = page == null ? "1" : page;
		mv.addObject("page", page);
		mv.addObject("search", search);
		mv.addObject("totalPage", vendorService.getTotalPageCount(search));
		return mv;
	}
	
	/*
	 * 업체 목록 JSON 형태
	 */
	@ResponseBody
	@RequestMapping(value = "admin_vendor_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String admin_vendor_list_ajax(int page, String search, HttpServletRequest request) {
		return Commons.parseJson(vendorService.getVendorList(page, search));
	}
	
	/*
	 * 업체 삭제 처리 결과 AJAX
	 */
	@ResponseBody
	@RequestMapping(value = "/admin_delete_vendor", method = RequestMethod.POST)
	public String admin_delete_vendor(VendorVO vo) {
		int result = vendorService.deleteVendor(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return Commons.parseJson(map);
	}
	
	/*
	 * 업체-후기 관리 페이지
	 */
	@RequestMapping(value = "/admin_reviews_list", method = RequestMethod.GET)
	public ModelAndView adminReviewsList(String page, String search) {
		ModelAndView mv = new ModelAndView("admin/vendor/admin_reviews_list");
		page = page == null ? "1" : page;
		mv.addObject("page", page);
		mv.addObject("search", search);
		mv.addObject("totalPage", vendorService.getTotalPageCount(search));
		return mv;
	}
	
	/*
	 * 업체-후기 목록 JSON 형태
	 */
	@ResponseBody
	@RequestMapping(value = "admin_reviews_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String admin_reviews_list_ajax(int page, String search, HttpServletRequest request) {
		return Commons.parseJson(vendorService.getReviewsList(page, search));
	}
	
	/*
	 * 업체-후기 삭제 처리 결과 AJAX
	 */
	@ResponseBody
	@RequestMapping(value = "/admin_delete_reviews", method = RequestMethod.POST)
	public String admin_delete_reviews(ReviewVO vo) {
		int result = vendorService.deleteReviews(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return Commons.parseJson(map);
	}
	
	/**
	 * 회원 관리 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin_member_list", method = RequestMethod.GET)
	public ModelAndView adminMemberList(String page, String search) {
		ModelAndView mv = new ModelAndView("admin/member/admin_member_list");
		page = page == null ? "1" : page;
		mv.addObject("page", page);
		mv.addObject("search", search);
		mv.addObject("totalPage", memberService.getTotalPageCount(search));
		mv.addObject("categories", customerCenterService.getQnaCategories());
		return mv;
	}

	/**
	 * 회원 목록 JSON 형태
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "admin_member_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String admin_member_list_ajax(int page, String search, HttpServletRequest request) {
		return Commons.parseJson(memberService.getMemberList(page, search));
	}

	/**
	 * 회원 삭제 처리 결과 AJAX
	 * 
	 * @param no
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin_delete_member", method = RequestMethod.POST)
	public String admin_delete_member(MemberVO vo) {
		int result = memberService.deleteMember(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return Commons.parseJson(map);
	}

	/**
	 * 물건 관리 페이지
	 * 
	 * @param page
	 * @param search
	 * @return
	 */
	@RequestMapping(value = "admin_product_list", method = RequestMethod.GET)
	public ModelAndView admin_product_list(String page, String search) {
		ModelAndView mv = new ModelAndView("admin/product/admin_product_list");
		page = page == null ? "1" : page;
		mv.addObject("page", page);
		mv.addObject("search", search);
		mv.addObject("totalPage", productService.getTotalPageCount(search));
		return mv;
	}

	/**
	 * 물건 목록 JSON 형태
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "admin_product_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String admin_product_list_ajax(int page, String search) {
		return Commons.parseJson(productService.getProductList(page, search));
	}

	@RequestMapping(value = "admin_product_info", method = RequestMethod.GET)
	public String adminProductInfo() {
		return "admin/product/admin_product_info";
	}

	/**
	 * 물건 삭제 처리 결과 AJAX
	 * 
	 * @param no
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin_delete_product", method = RequestMethod.POST)
	public String admin_delete_product(ProductVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		int result = productService.getDelete(member, vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return Commons.parseJson(map);
	}

	/**
	 * 내 근처 관리
	 * 
	 * @return
	 */
	@RequestMapping(value = "admin_near_home", method = RequestMethod.GET)
	public ModelAndView admin_near_home(String search) {
		ModelAndView mv = new ModelAndView("admin/near/admin_near_home");
		mv.addObject("search", search);
		return mv;
	}

	/**
	 * 내 근처 글 삭제
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin_near_delete", method = RequestMethod.GET)
	public String admin_near_delete_ajax(NearVO near, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		return String.valueOf(nearService.deleteNear(member, near));
	}

	@RequestMapping(value = "admin_town_list", method = RequestMethod.GET)
	public String adminTownList() {
		return "admin/town/admin_town_list";
	}

	@RequestMapping(value = "admin_town_info", method = RequestMethod.GET)
	public String adminTownInfo() {
		return "admin/town/admin_town_info";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("redirect:/admin_member_list");
		return mv;
	}
}
