package com.yomul.yomul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yomul.service.MemberService;
import com.yomul.util.Security;
import com.yomul.vo.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private MemberService memberService;

	/**
	 * 회원가입 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "user/join/join";
	}

	/**
	 * 회원가입 처리
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/join_proc", method = RequestMethod.POST)
	public String join_proc(MemberVO vo) {
		// 비밀번호 암호화
		vo.setHashsalt(Security.getSalt());
		vo.setPw(Security.pwHashing(vo.getPw(), vo.getHashsalt()));
		return String.valueOf(memberService.join(vo));
	}

	/**
	 * 이메일 중복 확인
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/email_check", method = RequestMethod.POST)
	public String email_check(String email) {
		if (email.equals("")) {
			return "1";
		}
		return String.valueOf(memberService.emailCheck(email));
	}

	/**
	 * 닉네임 중복 확인
	 */
	@ResponseBody
	@RequestMapping(value = "/nickname_check", method = RequestMethod.POST)
	public String nickname_check(String nickname) {
		if (nickname.equals("") || nickname.length() <= 1 || nickname.length() > 15) {
			return "1";
		}
		return String.valueOf(memberService.nicknameCheck(nickname));
	}
}
