package com.web.honbab.review.dto;

import java.sql.Date;

//CREATE TABLE REPLY_TEST(
//U_RE_NICK varchar2(50),
//U_RE_COMENT varchar2(300),
//U_SEQ_GROUP NUMBER,
//U_RE_DATE date default sysdate
//);

public class ReviewRepDTO {

	private String uReNick; 
	private String uReComent;
	private int uSeqGroup;
	private Date uReDate;
	
	
	public String getuReNick() {
		return uReNick;
	}
	public void setuReNick(String uReNick) {
		this.uReNick = uReNick;
	}
	public String getuReComent() {
		return uReComent;
	}
	public void setuReComent(String uReComent) {
		this.uReComent = uReComent;
	}
	public int getuSeqGroup() {
		return uSeqGroup;
	}
	public void setuSeqGroup(int uSeqGroup) {
		this.uSeqGroup = uSeqGroup;
	}
	public Date getuReDate() {
		return uReDate;
	}
	public void setuReDate(Date uReDate) {
		this.uReDate = uReDate;
	}
	
	
	
}
