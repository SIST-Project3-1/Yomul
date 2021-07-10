package com.yomul.service;

import com.yomul.vo.MemberVO;

public interface MemberService {
	int join(MemberVO vo);

	int emailCheck(String email);

	int nicknameCheck(String nickname);
}
