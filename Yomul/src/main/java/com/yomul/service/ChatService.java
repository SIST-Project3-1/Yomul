package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.ChatVO;
import com.yomul.vo.MemberVO;

public interface ChatService {
	int chat(ChatVO chat);

	ArrayList<ChatVO> getChatList(MemberVO member);

	ArrayList<ChatVO> getChatHistory(ChatVO chat);
}
