package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.yomul.vo.ChatVO;
import com.yomul.vo.MemberVO;

@Repository
public class ChatDAO extends DAO {

	private String nameSpace = "mapper.chat";

	/**
	 * 채팅 하기
	 * 
	 * @return
	 */
	public int chat(ChatVO chat) {
		return sqlSession.insert(nameSpace + ".chat", chat);
	}

	/**
	 * 채팅 유저 목록 가져오기
	 * 
	 * @param member
	 * @return
	 */
	public ArrayList<ChatVO> getChatList(MemberVO member) {
		String no = member.getNo();
		List<ChatVO> list = sqlSession.selectList(nameSpace + ".getChatList", no);
		return (ArrayList<ChatVO>) list;
	}

	/**
	 * 채팅 내역 가져오기
	 * 
	 * @param chat
	 * @return
	 */
	public ArrayList<ChatVO> getChatHistory(ChatVO chat) {
		List<ChatVO> list = sqlSession.selectList(nameSpace + ".getChatHistory", chat);
		return (ArrayList<ChatVO>) list;
	}
}
