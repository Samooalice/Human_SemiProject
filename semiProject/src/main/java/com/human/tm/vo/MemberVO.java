package com.human.tm.vo;

import java.sql.Clob;

public class MemberVO {
	private int product_no, mno, rno, nowPage, startRno, endRno, total;
	private String nickname, period_day, birth, gen, main_bank, interest_type, product_type, product_bank, product_name, isshow, join_target, type;
	private Clob product_file;
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartRno() {
		return startRno;
	}
	public void setStartRno(int startRno) {
		this.startRno = startRno;
	}
	public int getEndRno() {
		return endRno;
	}
	public void setEndRno(int endRno) {
		this.endRno = endRno;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPeriod_day() {
		return period_day;
	}
	public void setPeriod_day(String period_day) {
		this.period_day = period_day;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
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
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getJoin_target() {
		return join_target;
	}
	public void setJoin_target(String join_target) {
		this.join_target = join_target;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Clob getProduct_file() {
		return product_file;
	}
	public void setProduct_file(Clob product_file) {
		this.product_file = product_file;
	}
	@Override
	public String toString() {
		return "MemberVO [product_no=" + product_no + ", mno=" + mno + ", rno=" + rno + ", nowPage=" + nowPage
				+ ", startRno=" + startRno + ", endRno=" + endRno + ", total=" + total + ", nickname=" + nickname
				+ ", period_day=" + period_day + ", birth=" + birth + ", gen=" + gen + ", main_bank=" + main_bank
				+ ", interest_type=" + interest_type + ", product_type=" + product_type + ", product_bank="
				+ product_bank + ", product_name=" + product_name + ", isshow=" + isshow + ", join_target="
				+ join_target + ", type=" + type + ", product_file=" + product_file + "]";
	}

	
	
}