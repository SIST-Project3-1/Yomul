package com.yomul.yomul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.CustomerCenterService;
import com.yomul.service.FaqService;
import com.yomul.service.FileService;
import com.yomul.service.MemberService;
import com.yomul.service.NoticeService;
import com.yomul.util.Commons;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NoticeVO;
import com.yomul.vo.QnaVO;

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

	/*
	 * FAQ
	 */
	@RequestMapping(value = "admin_faq_list", method = RequestMethod.GET)
	public String adminFaqList() {
		return "admin/customer_center/faq/admin_faq_list";
	}

	@RequestMapping(value = "admin_faq_write", method = RequestMethod.GET)
	public ModelAndView adminFaqWrite() {
		ModelAndView mv = new ModelAndView();

		ArrayList<CategoryVO> categories = customerCenterService.getFaqCategories(); // 카테고리 정보

		mv.setViewName("admin/customer_center/faq/admin_faq_write");
		mv.addObject("categories", categories);

		return mv;
	}

	@RequestMapping(value = "admin_faq_write_proc", method = RequestMethod.GET)
	public ModelAndView adminFaqWriteProc(FaqVO faq) {
		ModelAndView mv = new ModelAndView();

		int result = faqService.getAdminFaqWrite(faq);

		if (result == 1) {
			mv.setViewName("redirect:/admin_faq_list");
		} else {
			// mv.setViewName("error"); 에러페이지
		}
		return mv;
	}

	@RequestMapping(value = "admin_faq_update", method = RequestMethod.GET)
	public String adminFaqUpdate() {
		return "admin/customer_center/faq/admin_faq_update";
	}

	@RequestMapping(value = "admin_notice_list", method = RequestMethod.GET)
	public String adminNoticeList() {
		return "admin/customer_center/notice/admin_notice_list";
	}

	@RequestMapping(value = "admin_notice_info", method = RequestMethod.GET)
	public String adminNoticeInfo() {
		return "admin/customer_center/notice/admin_notice_info";
	}

	@RequestMapping(value = "admin_notice_update", method = RequestMethod.GET)
	public String adminNoticeUpdate() {
		return "admin/customer_center/notice/admin_notice_update";
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
	public String adminNoticeWrite_proc(NoticeVO vo) {
		vo.setWriter("M1");
		int result = noticeService.writeNotice(vo);
		if (result == 1) {
			return "redirect:/admin_notice_list";
		} else {
			return "redirect:/admin_notice_write";
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

	@RequestMapping(value = "admin_near_home", method = RequestMethod.GET)
	public ModelAndView admin_near_home() {
		ModelAndView mv = new ModelAndView("admin/near/admin_near_home");
		return mv;
	}

	@RequestMapping(value = "admin_near_info", method = RequestMethod.GET)
	public String adminNearInfo() {
		return "admin/near/admin_near_info";
	}

	@RequestMapping(value = "admin_product_list", method = RequestMethod.GET)
	public String adminProductList() {
		return "admin/product/admin_product_list";
	}

	@RequestMapping(value = "admin_product_info", method = RequestMethod.GET)
	public String adminProductInfo() {
		return "admin/product/admin_product_info";
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
