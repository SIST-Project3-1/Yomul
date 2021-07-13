package com.yomul.vo;

public class FileVO extends VO {
	private String article_no;
	private int no;
	private String filename;

	public String getArticle_no() {
		return article_no;
	}

	public void setArticle_no(String article_no) {
		this.article_no = article_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSavedFilename() {
		return article_no + "_" + no + "_" + filename;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
