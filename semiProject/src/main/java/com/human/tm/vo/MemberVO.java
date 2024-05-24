package com.human.tm.vo;

public class MemberVO {
	private int product_no;
	private String birth, main_bank, interest_type, product_type, product_bank, product_name;
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getProduct_bank() {
		return product_bank;
	}
	public void setProduct_bank(String product_bank) {
		this.product_bank = product_bank;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMain_bank() {
		return main_bank;
	}
	public void setMain_bank(String main_bank) {
		this.main_bank = main_bank;
	}
	public String getInterest_type() {
		return interest_type;
	}
	public void setInterest_type(String interest_type) {
		this.interest_type = interest_type;
	}
	
	@Override
	public String toString() {
		return "MemberVO [birth=" + birth + ", main_bank=" + main_bank + ", interest_type=" + interest_type + "]";
	}
	

	
}
