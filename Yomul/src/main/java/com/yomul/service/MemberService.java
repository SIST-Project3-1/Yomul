package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;

public interface MemberService {
	int withdrawal(MemberVO vo);

	int cancleWithdrawal(MemberVO vo);

	int join(MemberVO vo);

	int emailCheck(String email);

	int nicknameCheck(String nickname);

	MemberVO getMyProfileInfo(MemberVO vo);

	int setMyProfileInfo(MemberVO vo);

	int getBuyCount(MemberVO vo);

	int getSellCount(MemberVO vo);

	int getFavoriteCount(MemberVO vo);

	FileVO getMyProfileImg(MemberVO vo);

	ArrayList<MemberVO> getMemberList(int page, String search);

	int deleteMember(MemberVO vo);

	MemberVO getLoginResult(MemberVO vo);

	String getHashsalt(MemberVO vo);

	int getTotalPageCount(String search);

	int kakaoRegister(MemberVO vo);

	int checkPW(MemberVO vo);

	ArrayList<ProductVO> getMyFavoriteList(MemberVO member, String page);
}
