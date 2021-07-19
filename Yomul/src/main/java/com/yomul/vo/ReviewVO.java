package com.yomul.vo;

public class ReviewVO extends VO {
	private String no; // 후기 번호
	private String vendor_no; // 업체 번호
	private String member_no; // 작성자 회원 번호
	private String nickname; // 작성자 닉네임
	private String profileImg; // 작성자 프로필 사진
	private String content; // 내용
	private String vdate; // 작성일시
	private int hits; // 조회수
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getVendor_no() {
		return vendor_no;
	}
	public void setVendor_no(String vendor_no) {
		this.vendor_no = vendor_no;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileImg() {
		if(profileImg.equals("__")) {
			return "default.jpg";
		}
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
}
