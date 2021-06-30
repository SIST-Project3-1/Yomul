package com.mycgv.vo;

public class MemberVO {
	private String id, pass, name, gender, email1, email2, hp1, hp2, hp3, intro, email, hp, hlist, mdate;
	private String[] hobby;
	private int rno, choice;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getEmail() {
		if (email1 != null) {
			email = email1 + "@" + email2;
		}
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		String str = "";

		if (hp1 != null) {
			str = hp1 + "-" + hp2 + "-" + hp3;
		} else {
			str = hp;
		}
		return str;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getHlist() {
		if (hlist == null) {
			hlist = "";
			for (int i = 0; i < hobby.length; i++) {
				if (i == 0) {
					hlist += hobby[i];
				} else {
					hlist += "," + hobby[i];
				}
			}
		}
		return hlist;
	}

	public void setHlist(String hlist) {
		this.hlist = hlist;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}

}
