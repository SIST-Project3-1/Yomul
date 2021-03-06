package com.yomul.yomul;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.api.APIKey;
import com.yomul.api.kakao.KakaoLoginAPI;
import com.yomul.service.MemberService;
import com.yomul.util.Cookies;
import com.yomul.util.Security;
import com.yomul.vo.MailVO;
import com.yomul.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	/**
	 * 카카오 로그인 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "kakao_login", method = RequestMethod.GET)
	public String kakao_login() {
		return "redirect:https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=" + APIKey.KAKAO_API_REST_KEY + "&redirect_uri="
				+ APIKey.KAKAO_REDIRECT_URI_LOGIN;
	}

	/**
	 * 카카오 로그인 후 토큰 생성
	 * 
	 * @param code
	 * @param error
	 * @param error_description
	 * @return
	 */
	@RequestMapping(value = "kakao_login_proc", method = RequestMethod.GET)
	public ModelAndView kakao_login_proc_(String code, String error, String error_description, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/");

		// 토큰으로 유저 정보를 받아옴
		String access_token = KakaoLoginAPI.getAccessToken(code, APIKey.KAKAO_REDIRECT_URI_LOGIN);
		Map<String, Object> map = KakaoLoginAPI.getUserInfo(access_token);

		String id = (String) map.get("id");

		MemberVO vo = new MemberVO();
		vo.setKakao_id(id);
		MemberVO member = memberService.getLoginResult(vo);
		if (member != null) {
			session.setAttribute("member", member);
		} else {
			mv.setViewName("redirect:/login");
		}
		return mv;
	}

	/**
	 * login_check : 로그인 처리
	 */
	@ResponseBody
	@RequestMapping(value = "login_proc", method = RequestMethod.POST)
	public String login_proc(MemberVO vo, String idStore, String autoLogin, HttpSession session, HttpServletResponse response) {
		String pw = vo.getPw();
		// 로그인 처리
		MemberVO member = memberService.getLoginResult(vo);

		// 로그인 성공 시
		if (member != null) {
			session.setAttribute("member", member);
			session.setAttribute("no", member.getNo());

			// 아이디 저장
			if (idStore != null) { // 아이디 저장을 체크 했으면 쿠키에 아이디 저장
				response.addCookie(Cookies.createCookie("idStore", vo.getEmail(), 60 * 60 * 24 * 30)); // 만든 쿠키를 브라우저에 전달
			} else { // 아이디 저장을 체크하지 않았으면 쿠키에 저장된 아이디 삭제
				response.addCookie(Cookies.createCookie("idStore", vo.getEmail(), 0)); // 만든 쿠키를 브라우저에 전달함
			}

			// 자동 로그인
			if (autoLogin != null) { // 자동로그인 설정했으면 적용
				response.addCookie(Cookies.createCookie("autoLogin", pw, 60 * 60 * 24 * 30)); // 만든 쿠키를 브라우저에 전달함
			} else { // 자동 로그인을 해제했으면 해당 쿠키 삭제
				response.addCookie(Cookies.createCookie("autoLogin", pw, 0)); // 만든 쿠키를 브라우저에 전달함
			}

		}
		return member != null ? "1" : "0";
	}

	/**
	 * 패스워드 초기화 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "reset_password", method = RequestMethod.GET)
	public ModelAndView reset_password() {
		ModelAndView mv = new ModelAndView("user/login/reset_password");
		return mv;
	}

	/**
	 * 패스워드 초기화 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "reset_password_proc", method = RequestMethod.GET)
	public String reset_password_proc(final MailVO vo) {

		// 비밀번호 초기화
		final String pw = Security.getRandomString();
		String hashsalt = Security.getSalt();
		String hashedPW = Security.pwHashing(pw, hashsalt);

		MemberVO member = new MemberVO();
		member.setEmail(vo.getTo());
		member.setPw(hashedPW);
		member.setHashsalt(hashsalt);
		memberService.resetPW(member);

		// 메일 전송
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				// root-contetx에 적힌 gmail 주소 보안 허용 해야함
				helper.setFrom(vo.getFrom());
				// 보낼 이메일 주소
				helper.setTo(vo.getTo());
				// 보낼 제목
				helper.setSubject(vo.getSubject());
				// 보내는 내용 -> 임시비밀번호
				helper.setText(vo.getContents() + ": " + pw, true);
			}
		};

		mailSender.send(preparator);
		return "redirect:/login";

	}

	/**
	 * 로그인 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(@CookieValue(value = "idStore", required = false) Cookie idStore,
			@CookieValue(value = "autoLogin", required = false) Cookie autoLogin) {
		ModelAndView mv = new ModelAndView("user/login/login");
		if (idStore != null) {
			mv.addObject("idStore", idStore.getValue());
		}

		if (autoLogin != null) {
			mv.addObject("autoLogin", autoLogin.getValue());
		}

		return mv;
	}

	/**
	 * 로그아웃 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response, @CookieValue(value = "autoLogin", required = false) Cookie autoLogin) {
		if (autoLogin != null) {
			Cookies.removeCookie(autoLogin);
			response.addCookie(autoLogin);
		}
		session.invalidate();
		return "redirect:/";
	}
}
