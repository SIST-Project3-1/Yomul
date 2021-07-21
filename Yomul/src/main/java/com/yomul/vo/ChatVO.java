package com.yomul.vo;

public class ChatVO extends VO {

	private String no;
	private String chat_from;
	private String chat_to;
	private String content;
	private String cdate;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getChat_from() {
		return chat_from;
	}

	public void setChat_from(String chat_from) {
		this.chat_from = chat_from;
	}

	public String getChat_to() {
		return chat_to;
	}

	public void setChat_to(String chat_to) {
		this.chat_to = chat_to;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
}
