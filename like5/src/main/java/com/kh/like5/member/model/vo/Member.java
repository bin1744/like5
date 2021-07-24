package com.kh.like5.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memNo;
	private String email;
	private String memPwd;
	private String memName;
	private String nickName;
	private String memProfile;
	private String memCheck;
	private String bank;
	private String accountNum;
	private Date enrDate;
	private String userStatus;
	private String entYN;
	
	public Member() {}
	
	public Member(int memNo, String email, String memPwd, String memName, String nickName, String memProfile,
			String memCheck, String bank, String accountNum, Date enrDate, String userStatus, String entYN) {
		super();
		this.memNo = memNo;
		this.email = email;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickName = nickName;
		this.memProfile = memProfile;
		this.memCheck = memCheck;
		this.bank = bank;
		this.accountNum = accountNum;
		this.enrDate = enrDate;
		this.userStatus = userStatus;
		this.entYN = entYN;
	}



	public int getMemNo() {
		return memNo;
	}



	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getMemPwd() {
		return memPwd;
	}



	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}



	public String getMemName() {
		return memName;
	}



	public void setMemName(String memName) {
		this.memName = memName;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getMemProfile() {
		return memProfile;
	}



	public void setMemProFile(String memProfile) {
		this.memProfile = memProfile;
	}



	public String getMemCheck() {
		return memCheck;
	}



	public void setMemCheck(String memCheck) {
		this.memCheck = memCheck;
	}



	public String getBank() {
		return bank;
	}



	public void setBank(String bank) {
		this.bank = bank;
	}



	public String getAccountNum() {
		return accountNum;
	}



	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}



	public Date getEnrDate() {
		return enrDate;
	}



	public void setEnrDate(Date enrDate) {
		this.enrDate = enrDate;
	}



	public String getUserStatus() {
		return userStatus;
	}



	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}



	public String getEntYN() {
		return entYN;
	}



	public void setEntYN(String entYN) {
		this.entYN = entYN;
	}



	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", email=" + email + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", nickName=" + nickName + ", memProFile=" + memProfile + ", memCheck=" + memCheck + ", bank=" + bank
				+ ", accountNum=" + accountNum + ", enrDate=" + enrDate + ", userStatus=" + userStatus + ", entYN="
				+ entYN + "]";
	}
	
	
	
}
