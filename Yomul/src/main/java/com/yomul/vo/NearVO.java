package com.yomul.vo;

public class NearVO extends VO {

	private String no; // 게시글 번호
	private String vno; // 작성 업체 번호
	private int price = -1; // 게시글 등록 가격
	private int chatCheck = 0; // 채팅 여부
	private int hits = -1; // 조회수
	private int files = -1; // 이미지 수
	private String title; // 게시글 제목
	private String category; // 게시글 카테고리
	private String hp; // 게시글 전화번호
	private String content; // 게시글 내용
	private String ndate; // 게시글 등록 일자
	private String writer; // 작성 업체

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getVno() {
		return vno;
	}

	public void setVno(String vno) {
		this.vno = vno;
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
		if((Integer)chatCheck == null) {
			chatCheck = 0;
		}else {
			this.chatCheck = chatCheck;
		}
	}

	public int getHits() {
		return hits;
	}

	public int getFiles() {
		return files;
	}

	public void setFiles(int files) {
		this.files = files;
	}

	public void setHits(int hits) {
		this.hits = hits;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
