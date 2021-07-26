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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.api.APIKey;
import com.yomul.api.kakao.KakaoLoginAPI;
import com.yomul.service.CommentService;
import com.yomul.service.MemberService;
import com.yomul.service.NearService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.util.Security;
import com.yomul.vo.CommentVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;
import com.yomul.vo.ProductVO;

@Controller
public class MyPageController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private NearService nearService;

	@Autowired
	private FileUtils fileUtils;

	/**
	 * 카카오 계정 연동하기 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/kakao_register")
	public String kakao_register() {
		return "redirect:https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=" + APIKey.KAKAO_API_REST_KEY + "&redirect_uri="
				+ APIKey.KAKAO_REDIRECT_URI_REGISTER;
	}

	/**
	 * 카카오 계정 연동 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/kakao_register_proc")
	public ModelAndView kakao_register_proc(String code, String error, String error_description, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/mypage/myprofile_info");

		// 로그인 토큰으로 세션 처리 해야함
		String access_token = KakaoLoginAPI.getAccessToken(code, APIKey.KAKAO_REDIRECT_URI_REGISTER);
		Map<String, Object> map = KakaoLoginAPI.getUserInfo(access_token);

		String id = (String) map.get("id");

		MemberVO vo = (MemberVO) session.getAttribute("member");
		vo.setKakao_id(id);

		memberService.kakaoRegister(vo);
		return mv;
	}

	/**
	 * 회원 탈퇴 취소
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/withdrawal_cancle", method = RequestMethod.GET)
	public ModelAndView withdrawal_cancle(HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/mypage/myprofile_info");

		MemberVO vo = (MemberVO) session.getAttribute("member");
		memberService.cancleWithdrawal(vo);
		return mv;
	}

	/**
	 * 회원 탈퇴 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/withdrawal_proc", method = RequestMethod.GET)
	public ModelAndView withdrawal_proc(HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/logout");
		MemberVO vo = (MemberVO) session.getAttribute("member");
		memberService.withdrawal(vo);
		return mv;
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/mypage/withdrawal", method = RequestMethod.GET)
	public ModelAndView withdrawal() {
		ModelAndView mv = new ModelAndView("user/mypage/withdrawal");
		return mv;
	}

	/**
	 * 내가 쓴 글 보기
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/myarticle_list", method = RequestMethod.GET)
	public ModelAndView myacticle_list() {
		ModelAndView mv = new ModelAndView("user/mypage/myarticle_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	/**
	 * 내가 쓴 글 목록 AJAX
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/myarticle_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String myarticle_list_ajax(String page, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		ArrayList<NearVO> articleList = nearService.getMyArticleList(member, page);
		return Commons.parseJson(articleList);
	}

	/**
	 * 내가 쓴 댓글 보기
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/mycomment_list", method = RequestMethod.GET)
	public ModelAndView mycomment_list() {
		ModelAndView mv = new ModelAndView("user/mypage/mycomment_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	/**
	 * 내가 쓴 댓글 삭제
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/delete_comment", method = RequestMethod.POST)
	public String delete_comment(CommentVO vo, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setWriter(member.getNo());
		return String.valueOf(commentService.deleteComment(vo));
	}

	/**
	 * 내가 쓴 댓글 목록 AJAX
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/mycomment_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String mycomment_list_ajax(int page, HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		ArrayList<CommentVO> commentList = commentService.getCommentList(vo, page);
		return Commons.parseJson(commentList);
	}

	/**
	 * 구매 내역 보기
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/buy_list", method = RequestMethod.GET)
	public ModelAndView buy_list() {
		ModelAndView mv = new ModelAndView("user/mypage/buy_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	/**
	 * 판매 내역 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/sell_list", method = RequestMethod.GET)
	public ModelAndView sell_list(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/mypage/sell_list");

		MemberVO member = (MemberVO) session.getAttribute("member");

		mv.addObject("headerType", "buy_list");
		mv.addObject("sellingCount", memberService.getSellingcount(member.getNo()));
		mv.addObject("soldCount", memberService.getSoldCount(member.getNo()));
		return mv;
	}

	/**
	 * 판매 내역 AJAX
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/sell_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String sell_list_ajax(String page, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		ArrayList<ProductVO> sellList = memberService.getSellList(member, page);
		return Commons.parseJson(sellList);
	}
	
	/**
	 * 찜 목록 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage/favorite_list", method = RequestMethod.GET)
	public ModelAndView favorite_list() {
		ModelAndView mv = new ModelAndView("user/mypage/favorite_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	/**
	 * 찜 목록 AJAX
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/favorite_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String favorite_list_ajax(String page, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		ArrayList<ProductVO> favoriteList = memberService.getMyFavoriteList(member, page);
		return Commons.parseJson(favoriteList);
	}

	/**
	 * 프로필 수정 비밀번호 확인 페이지
	 * 
	 * @param no
	 * @return
	 */
	@RequestMapping(value = "/mypage/myprofile_update", method = RequestMethod.GET)
	public ModelAndView myprofile_update() {
		ModelAndView mv = new ModelAndView("user/check_pw");

		mv.addObject("title", "요물 프로필 수정");
		mv.addObject("useAjax", true);
		mv.addObject("url", "/yomul/mypage/myprofile_update_check");
		mv.addObject("method", "POST");
		mv.addObject("successMsg", "비밀번호가 일치합니다.");
		mv.addObject("successLink", "/yomul/mypage/myprofile_update/");
		mv.addObject("failMsg", "비밀번호가 일치하지 않습니다.");
		mv.addObject("bodyMsg", "프로필을 수정하려면 비밀번호를 입력하세요.");
		mv.addObject("btnName", "확인");
		mv.addObject("cancleLink", "/yomul/mypage/myprofile_info");
		return mv;
	}

	/**
	 * 프로필 수정 비밀번호 확인 처리
	 * 
	 * @param no
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/myprofile_update_check", method = RequestMethod.POST)
	public String myprofile_update_cehck(String pw, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		member.setPw(pw);
		member.setHashsalt(memberService.getHashsalt(member));
		member.setPw(Security.pwHashing(pw, member.getHashsalt()));

		int result = memberService.checkPW(member);
		if (result == 1) {
			session.setAttribute("pwChk", result);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return Commons.parseJson(map);
	}

	/**
	 * 프로필 수정 페이지
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/mypage/myprofile_update/", method = RequestMethod.GET)
	public ModelAndView myprofile_update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/mypage/myprofile_update");

		HttpSession session = request.getSession();
		if (session.getAttribute("pwChk") == null) {
			mv.setViewName("redirect:/mypage/myprofile_info");
			return mv;
		} else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			MemberVO vo = memberService.getMyProfileInfo(member);

			mv.addObject("headerType", "myprofile");
			mv.addObject("member", vo);
			mv.addObject("file", memberService.getMyProfileImg(vo));
			return mv;
		}
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
