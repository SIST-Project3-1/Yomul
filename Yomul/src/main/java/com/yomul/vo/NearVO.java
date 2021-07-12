package com.yomul.vo;

public class NearVO {

	private int no; // 게시글 번호
	private int price; // 게시글 등록 가격
	private int chatCheck; // 채팅 여부
	private String title ; // 게시글 제목
	private String category ; // 게시글 카테고리
	private String hp;  // 게시글 전화번호
	private String content; // 게시글 내용
	private String ndate; // 게시글 등록 일자
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getChatCheck() {
		return chatCheck;
	}
	public void setChatCheck(int chatCheck) {
		this.chatCheck = chatCheck;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	
	
}
