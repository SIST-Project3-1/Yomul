package com.yomul.vo;

public class NearVO extends VO {

	private String no; // 게시글 번호
	private String writer; // 작성자 닉네임
	private String mimg; // 작성자 프로필 이미지
	private String vno; // 작성 업체 번호
	private String vname; // 작성 업체명
	private String vimg; // 작성 업체 프로필 이미지
	private int price = -1; // 게시글 등록 가격
	private int chatCheck = 0; // 채팅 여부
	private int hits = -1; // 조회수
	private int files = -1; // 이미지 수
	private String title; // 게시글 제목
	private String category; // 게시글 카테고리
	private String hp; // 게시글 전화번호
	private String content; // 게시글 내용
	private String ndate; // 게시글 등록 일자

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getMimg() {
		if(mimg.equals("__")) { // 파일이 없을 경우 기본 이미지
			return "default.jpg";
		}
		return mimg;
	}
	
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	
	public String getVno() {
		return vno;
	}

	public void setVno(String vno) {
		this.vno = vno;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}
	
	public String getVimg() {
		if(vimg.equals("") || vimg.equals("__")) { // 파일이 없을 경우 기본 이미지
			return "default.jpg";
		}
		return vimg;
	}
	
	public void setVimg(String vimg) {
		this.vimg = vimg;
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

}
