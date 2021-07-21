package com.yomul.vo;

import org.springframework.stereotype.Repository;

@Repository
public class MemberVO extends VO {
	private String no;
	private String email;
	private String pw;
	private String nickname;
	private String hashsalt;
	private String phone;
	private String gender;
	private String intro;
	private String kakao_id;
	private String authority;
	private int withdrawal = -1;
	private String mdate;
	private String subscribe;
	private String profileImg = "default.jpg";

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getHashsalt() {
		return hashsalt;
	}

	public void setHashsalt(String hashsalt) {
		this.hashsalt = hashsalt;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(int withdrawal) {
		this.withdrawal = withdrawal;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSubscribe() {
		return subscribe != null ? subscribe : "off";
	}

	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}

	public String getProfileImg() {
		if ("__".equals(profileImg)) { // 프로필 사진이 없을 경우 기본 이미지 출력
			return "default.jpg";
		}
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

}
