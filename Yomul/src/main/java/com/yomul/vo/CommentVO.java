package com.yomul.vo;

public class CommentVO extends VO {
	private String no; // 댓글 번호
	private int likes; // 좋아요 수
	private int reports; // 신고 수
	private String articleNo; // 게시글 번호
	private String writer; // 작성자 회원번호
	private String nickname; // 작성자 닉네임
	private String content; // 내용
	private String wdate; // 작성일시
	private String img; // 작성자 프로필 이미지
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getReports() {
		return reports;
	}
	public void setReports(int reports) {
		this.reports = reports;
	}
	public String getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(String articleNo) {
		this.articleNo = articleNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		if(img.equals("__")) {
			this.img = "default.jpg";
		}else {
			this.img = img;
		}
	}
}
