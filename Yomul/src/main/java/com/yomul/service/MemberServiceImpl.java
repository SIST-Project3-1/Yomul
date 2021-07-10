package com.yomul.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.dao.MemberDAO;
import com.yomul.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int emailCheck(String email) {
		return memberDAO.emailCheck(email) == 1 ? 1 : 0;
	}

}
