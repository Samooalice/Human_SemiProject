package com.human.tm.vo;

import java.text.SimpleDateFormat;
import java.util.*;

public class MemberVO {
	int mno, cnt;
	String nickname, birth, main_bank, interest_type, gen, sdate;
	Date birthdate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		sdate = form.format(birthdate);
	}
	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", cnt=" + cnt + ", nickname=" + nickname + ", birth=" + birth + ", main_bank="
				+ main_bank + ", interest_type=" + interest_type + ", gen=" + gen + ", sdate=" + sdate + ", birthdate="
				+ birthdate + "]";
	}

	
}
