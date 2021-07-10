package com.yomul.service;

import com.yomul.vo.MemberVO;

public interface MemberService {
	int join(MemberVO vo);

	int emailCheck(String email);

	int nicknameCheck(String nickname);

	MemberVO getMyProfileInfo(MemberVO vo);

	int getBuyCount(MemberVO vo);

	int getSellCount(MemberVO vo);
	
	int getFavoriteCount(MemberVO vo);
}
