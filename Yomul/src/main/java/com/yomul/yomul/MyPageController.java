package com.yomul.yomul;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.MemberService;
import com.yomul.util.FileUtils;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;

@Controller
public class MyPageController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private FileUtils fileUtils;

	@RequestMapping(value = "/mypage//withdrawal_cancle", method = RequestMethod.GET)
	public ModelAndView withdrawal_cancle() {
		ModelAndView mv = new ModelAndView("user/mypage/withdrawal_cancle");
		return mv;
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/mypage//withdrawal", method = RequestMethod.GET)
	public ModelAndView withdrawal() {
		ModelAndView mv = new ModelAndView("user/mypage/withdrawal");
		return mv;
	}

	@RequestMapping(value = "/mypage//myarticle_list", method = RequestMethod.GET)
	public ModelAndView myacticle_list() {
		ModelAndView mv = new ModelAndView("user/mypage/myarticle_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	@RequestMapping(value = "/mypage//mycomment_list", method = RequestMethod.GET)
	public ModelAndView mycomment_list() {
		ModelAndView mv = new ModelAndView("user/mypage/mycomment_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	@RequestMapping(value = "/mypage//buy_list", method = RequestMethod.GET)
	public ModelAndView buy_list() {
		ModelAndView mv = new ModelAndView("user/mypage/buy_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "/mypage//sell_list", method = RequestMethod.GET)
	public ModelAndView sell_list() {
		ModelAndView mv = new ModelAndView("user/mypage/sell_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "/mypage//favorite_list", method = RequestMethod.GET)
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
	@RequestMapping(value = "/mypage/myprofile_update", method = RequestMethod.GET)
	public ModelAndView myprofile_update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/mypage/myprofile_update");

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		MemberVO vo = memberService.getMyProfileInfo(member);

		mv.addObject("headerType", "myprofile");
		mv.addObject("member", vo);
		mv.addObject("file", memberService.getMyProfileImg(vo));
		return mv;
	}

	/**
	 * 프로필 수정 처리
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/myprofile_update_proc", method = RequestMethod.POST)
	public String myprofile_update_proc(MemberVO vo, MultipartFile profile_img, HttpServletRequest request) {
		int result = 0; // service 결과를 저장하는 변수

		// 세션으로부터 접속한 유저 정보를 받아서 실행
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null) { // 로그인이 되어있지 않으면 0 반환
			return "0";
		}
		vo.setNo(member.getNo());

		result = memberService.setMyProfileInfo(vo); // 프로필 내용 업데이트

		if (result == 1 && profile_img.getSize() != 0) { // 프로필 사진 업데이트
			FileVO fileVO = new FileVO();
			fileVO.setArticle_no(member.getNo());
			fileVO.setNo(0);
			fileVO.setFilename(profile_img.getOriginalFilename());
			;

			// 파일을 서버와 DB에 업로드
			result = fileUtils.uploadFile(fileVO, profile_img, request);
		}
		return String.valueOf(result);
	}

	/**
	 * 프로필 보기 페이지
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/mypage/myprofile_info", method = RequestMethod.GET)
	public ModelAndView myprofile_info(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/mypage/myprofile_info");

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		MemberVO vo = memberService.getMyProfileInfo(member);

		mv.addObject("headerType", "myprofile");
		mv.addObject("member", vo);
		mv.addObject("file", memberService.getMyProfileImg(vo));
		mv.addObject("buyCount", memberService.getBuyCount(member));
		mv.addObject("sellCount", memberService.getSellCount(member));
		mv.addObject("favoriteCount", memberService.getFavoriteCount(member));
		return mv;
	}
}
