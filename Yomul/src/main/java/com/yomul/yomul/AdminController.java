package com.yomul.yomul;

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

import com.yomul.service.MemberService;
import com.yomul.util.Commons;
import com.yomul.vo.MemberVO;

@Controller
public class AdminController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "admin_faq_list", method = RequestMethod.GET)
	public String adminFaqList() {
		return "admin/customer_center/faq/admin_faq_list";
	}

	@RequestMapping(value = "admin_faq_write", method = RequestMethod.GET)
	public String adminFaqWrite() {
		return "admin/customer_center/faq/admin_faq_write";
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

	@RequestMapping(value = "admin_notice_write", method = RequestMethod.GET)
	public String adminNoticeWrite() {
		return "admin/customer_center/notice/admin_notice_write";
	}

	@RequestMapping(value = "admin_qna_list", method = RequestMethod.GET)
	public String adminQnaList() {
		return "admin/customer_center/qna/admin_qna_list";
	}

	@RequestMapping(value = "admin_qna_info", method = RequestMethod.GET)
	public String adminQnaInfo() {
		return "admin/customer_center/qna/admin_qna_info";
	}

	/**
	 * 회원 관리 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "admin_member_list", method = RequestMethod.GET)
	public String adminMemberList() {
		return "admin/member/admin_member_list";
	}

	/**
	 * 회원 목록 JSON 형태
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "admin_member_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String admin_member_list_ajax(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		MemberVO member = (MemberVO) session.getAttribute("member");
//		String authority = member.getAuthority();
//		if(!authority.equals("ADMIN")) {
//			return null;
//		}
		return Commons.parseJson(memberService.getMemberList());
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
		System.out.println(vo.toStringJson());
		int result = memberService.deleteMember(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return Commons.parseJson(map);
	}

	@RequestMapping(value = "admin_near_home", method = RequestMethod.GET)
	public String adminNearHome() {
		return "admin/near/admin_near_home";
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
		ModelAndView mv = new ModelAndView("/admin/member/admin_member_list");
		return mv;
	}
}
