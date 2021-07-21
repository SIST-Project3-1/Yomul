package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.ChatDAO;
import com.yomul.vo.ChatVO;
import com.yomul.vo.MemberVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;

	@Override
	public int chat(ChatVO chat) {
		return chatDAO.chat(chat) == 1 ? 1 : 0;
	}

	@Override
	public ArrayList<ChatVO> getChatList(MemberVO member) {
		return chatDAO.getChatList(member);
	}

	@Override
	public ArrayList<ChatVO> getChatHistory(ChatVO chat) {
		return chatDAO.getChatHistory(chat);
	}
}
