package com.yomul.yomul;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.ChatService;
import com.yomul.util.Commons;
import com.yomul.vo.ChatVO;
import com.yomul.vo.MemberVO;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	/**
	 * 채팅 페이지
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public ModelAndView chat(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/chat/chat");

		MemberVO member = (MemberVO) session.getAttribute("member");

		mv.addObject("chatList", chatService.getChatList(member));
		return mv;
	}

	/**
	 * 채팅 내역 AJAX 불러오기
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/chat_history_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String chat_history_ajax(ChatVO chat) {
		return Commons.parseJson(chatService.getChatHistory(chat));
	}
	
	@ResponseBody
	@RequestMapping(value="/chat_proc", method = RequestMethod.POST)
	public String chat_proc(ChatVO chat) {
		return Commons.parseJson(chatService.chat(chat));
	}
}
