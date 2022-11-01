package com.web.honbab.admin.dto;

import java.sql.Date;

public class NoticeRepDTO {
	private String reId;
	private String reComent;
	private int writeGroup;
	private Date reDate;
	private String reNick;
	
	public String getReId() {
		return reId;
	}
	public void setReId(String reId) {
		this.reId = reId;
	}
	
	public String getReComent() {
		return reComent;
	}
	public void setReComent(String reComent) {
		this.reComent = reComent;
	}
	public int getWriteGroup() {
		return writeGroup;
	}
	public void setWriteGroup(int writeGroup) {
		this.writeGroup = writeGroup;
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	public String getReNick() {
		return reNick;
	}
	public void setReNick(String reNick) {
		this.reNick = reNick;
	}
	
	
}
