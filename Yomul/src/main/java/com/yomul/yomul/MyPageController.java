package com.yomul.yomul;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.yomul.service.MemberService;
import com.yomul.vo.MemberVO;

@Controller
public class MyPageController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/withdrawal_cancle", method = RequestMethod.GET)
	public ModelAndView withdrawal_cancle() {
		ModelAndView mv = new ModelAndView("user/mypage/withdrawal_cancle");
		return mv;
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public ModelAndView withdrawal() {
		ModelAndView mv = new ModelAndView("user/mypage/withdrawal");
		return mv;
	}

	@RequestMapping(value = "/myarticle_list", method = RequestMethod.GET)
	public ModelAndView myacticle_list() {
		ModelAndView mv = new ModelAndView("user/mypage/myarticle_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	@RequestMapping(value = "/mycomment_list", method = RequestMethod.GET)
	public ModelAndView mycomment_list() {
		ModelAndView mv = new ModelAndView("user/mypage/mycomment_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	@RequestMapping(value = "/buy_list", method = RequestMethod.GET)
	public ModelAndView buy_list() {
		ModelAndView mv = new ModelAndView("user/mypage/buy_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "/sell_list", method = RequestMethod.GET)
	public ModelAndView sell_list() {
		ModelAndView mv = new ModelAndView("user/mypage/sell_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "/favorite_list", method = RequestMethod.GET)
	public ModelAndView favorite_list() {
		ModelAndView mv = new ModelAndView("user/mypage/favorite_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	/**
	 * 프로필 수정 페이지
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "myprofile_update", method = RequestMethod.GET)
	public ModelAndView myprofile_update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {// 로그인 되어 있으면 접속 허용
			mv = new ModelAndView("user/mypage/myprofile_update");
		} else { // 로그인이 되어 있지 않으면 로그인 페이지로 이동
			return new ModelAndView("redirect:/login");
		}

		mv.addObject("headerType", "myprofile");
		mv.addObject("member", memberService.getMyProfileInfo(member));
		return mv;
	}

	/**
	 * 프로필 수정 처리
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "myprofile_update_proc", method = RequestMethod.POST)
	public String myprofile_update_proc(MemberVO vo, HttpServletRequest request) {
		// 세션으로부터 접속한 유저 정보를 받아서 실행
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setNo(member.getNo());

		return String.valueOf(memberService.setMyProfileInfo(vo));
	}

	/**
	 * 프로필 보기 페이지
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "myprofile_info", method = RequestMethod.GET)
	public ModelAndView myprofile_info(HttpServletRequest request) {
		ModelAndView mv;

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {// 로그인 되어 있으면 접속 허용
			mv = new ModelAndView("user/mypage/myprofile_info");
		} else { // 로그인이 되어 있지 않으면 로그인 페이지로 이동
			return new ModelAndView("redirect:/login");
		}

		mv.addObject("headerType", "myprofile");
		mv.addObject("member", memberService.getMyProfileInfo(member));
		mv.addObject("buyCount", memberService.getBuyCount(member));
		mv.addObject("sellCount", memberService.getSellCount(member));
		mv.addObject("favoriteCount", memberService.getFavoriteCount(member));
		return mv;
	}
}
