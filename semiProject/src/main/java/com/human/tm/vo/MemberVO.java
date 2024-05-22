package com.human.tm.vo;

public class MemberVO {
	String nickname, birth, main_bank, interest_type;

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

	@Override
	public String toString() {
		return "MemverVO [nickname=" + nickname + ", birth=" + birth + ", main_bank=" + main_bank + ", interest_type="
				+ interest_type + "]";
	}
}
