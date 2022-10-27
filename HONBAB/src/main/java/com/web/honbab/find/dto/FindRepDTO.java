package com.web.honbab.find.dto;

import java.sql.Date;

public class FindRepDTO {
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
