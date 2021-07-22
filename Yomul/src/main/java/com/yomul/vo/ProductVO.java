package com.yomul.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ProductVO extends VO {
	private String no; // 물품 번호
	private int category_no = -1; // 카테고리 번호
	private String category_content; // 카테고리 정보
	private String seller; // 판매자 회원번호
	private String seller_nickname; // 판매자 닉네임
	private String title; // 제목
	private String content; // 내용
	private int price = -1; // 가격
	private String state; // 상태
	private int hits = -1; // 조회수
	private String pdate; // 등록일자
	private String location; // 거래 장소
	private int likes = -1; // 좋아요 수
	private int comments = -1; // 댓글 수
	private String img = "default.jpg"; // 대표 이미지
	private CommonsMultipartFile file; //첨부파
	

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCategory_content() {
		return category_content;
	}

	public void setCategory_content(String category_content) {
		this.category_content = category_content;
	}

	public String getSeller_nickname() {
		return seller_nickname;
	}

	public void setSeller_nickname(String seller_nickname) {
		this.seller_nickname = seller_nickname;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
