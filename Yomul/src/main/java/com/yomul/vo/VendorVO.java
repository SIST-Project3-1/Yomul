package com.yomul.vo;

public class VendorVO extends VO {
	private String no; // 업체 번호
	private String owner; // 소유자 유저 번호
	private String name; // 업체명
	private String category; // 카테고리
	private String info; // 상세정보
	private String tel; // 전화번호
	private String addr; // 주소
	private String img; // 이미지
	private int news; // 소식 수
	private int customers; // 단골 수
	private int reviews; // 후기 수
	private int withdrawal; // 탈퇴 신청 여부
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getImg() {
		if(img.equals("__")) { // 파일이 없을 경우 기본 이미지
			return "default.jpg";
		}
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getNews() {
		return news;
	}
	public void setNews(int news) {
		this.news = news;
	}
	public int getCustomers() {
		return customers;
	}
	public void setCustomers(int customers) {
		this.customers = customers;
	}
	public int getReviews() {
		return reviews;
	}
	public void setReviews(int reviews) {
		this.reviews = reviews;
	}
	public int getWithdrawal() {
		return withdrawal;
	}
	public void setWithdrawal(int withdrawal) {
		this.withdrawal = withdrawal;
	}
	
}
