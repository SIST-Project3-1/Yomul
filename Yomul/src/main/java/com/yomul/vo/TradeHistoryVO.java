package com.yomul.vo;

public class TradeHistoryVO extends VO {

	private String no; // 거래 번호
	private String product_no; // 물건 번호
	private String buyer; // 구매자 번호
	private String trade_date; // 거래 일자

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getTrade_date() {
		return trade_date;
	}

	public void setTrade_date(String trade_date) {
		this.trade_date = trade_date;
	}
}
