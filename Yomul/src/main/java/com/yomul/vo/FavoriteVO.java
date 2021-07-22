package com.yomul.vo;

public class FavoriteVO extends VO {

	private String product_no; // 물건 번호
	private String member_no; // 회원 번호

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
}
