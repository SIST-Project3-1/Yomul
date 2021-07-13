package com.yomul.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.dao.MemberDAO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int join(MemberVO vo) {
		return memberDAO.join(vo) == 1 ? 1 : 0;
	}

	@Override
	public int emailCheck(String email) {
		return memberDAO.emailCheck(email) == 1 ? 1 : 0;
	}

	@Override
	public int nicknameCheck(String nickname) {
		return memberDAO.nicknameCheck(nickname) == 1 ? 1 : 0;
	}


	@Override
	public int getBuyCount(MemberVO vo) {
		return memberDAO.getBuyCount(vo);
	}

	@Override
	public int getSellCount(MemberVO vo) {
		return memberDAO.getSellCount(vo);
	}

	@Override
	public MemberVO getMyProfileInfo(MemberVO vo) {
		return memberDAO.getMyProfileInfo(vo);
	}

	@Override
	public int getFavoriteCount(MemberVO vo) {
		return memberDAO.getFavoriteCount(vo);
	}

	@Override
	public int setMyProfileInfo(MemberVO vo) {
		int result = memberDAO.setMyProfileInfo(vo);
		return result == 1 ? 1 : 0;
	}

	@Override
	public FileVO getMyProfileImg(MemberVO vo) {
		return memberDAO.getMyProfileImg(vo);
	}

}
