package com.yomul.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class QnaVO extends VO {
	private String no; // 글 번호
	private String name; // 작성자 이름
	private String email; // 작성자 이메일
	private String pw; // 작성자 비밀번호
	private String hashsalt; // 비밀번호 해쉬솔트
	private String wdate; // 작성일자
	private int category; // 카테고리
	private String title; // 글 제목
	private String content; // 글 내용
	private CommonsMultipartFile file;// 첨부파일
	private int hits; // 조회수

	private String rdate; // 답변 일자
	private String rwriter; // 답변자
	private String rcontent; // 답변 내용

	private String secret;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public String getHashsalt() {
		return hashsalt;
	}

	public void setHashsalt(String hashsalt) {
		this.hashsalt = hashsalt;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
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

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public String getSecret() {
		return secret != null ? secret : "off";
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

}
