package com.yomul.vo;

public class NoticeVO extends VO {
	private int hits; // 조회수
	private int no; // 글 번호
	private String wrtier; // 작성자
	private String title; // 제목
	private String content; // 내용
	private String ndate; // 작성일시
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getWrtier() {
		return wrtier;
	}
	public void setWrtier(String wrtier) {
		this.wrtier = wrtier;
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
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	
}
