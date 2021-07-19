package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.MemberDAO;
import com.yomul.util.Security;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;

@Service("memberService")
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

	@Override
	public ArrayList<MemberVO> getMemberList(int page, String search) {
		return memberDAO.getMemberList(page, search);
	}

	@Override
	public int deleteMember(MemberVO vo) {
		return memberDAO.deleteMember(vo) == 1 ? 1 : 0;
	}

	@Override
	public int getTotalPageCount(String search) {
		return memberDAO.getTotalPageCount(search);
	}

	@Override
	public MemberVO getLoginResult(MemberVO vo) {
		String pw = vo.getPw();
		if (vo.getKakao_id() == null) {
			String hashsalt = getHashsalt(vo);
			vo.setPw(Security.pwHashing(pw, hashsalt));
		}
		return memberDAO.getLoginResult(vo);
	}

	@Override
	public String getHashsalt(MemberVO vo) {
		return memberDAO.getHashsalt(vo);
	}

	@Override
	public int kakaoRegister(MemberVO vo) {
		return memberDAO.kakaoRegister(vo);
	}

	@Override
	public int withdrawal(MemberVO vo) {
		return memberDAO.withdrawal(vo);
	}

	@Override
	public int cancleWithdrawal(MemberVO vo) {
		return memberDAO.cancleWithdrawal(vo);
	}

}
