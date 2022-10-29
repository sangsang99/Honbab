package com.web.honbab.review.dto;

import java.sql.Date;

/*
CREATE TABLE REVIEW_RE(
RE_ID VARCHAR2(100) NOT NULL,
RE_COMENT VARCHAR2(300) NOT NULL,
WRITE_GROUP NUMBER,
RE_DATE DATE DEFAULT SYSDATE,
RE_NICK VARCHAR2(100) NOT NULL,
CONSTRAINT FK_REVIEW_RE_BOARD FOREIGN KEY(WRITE_GROUP) REFERENCES REVIEW_BOARD(WRITE_NO) ON DELETE CASCADE
);
*/

public class ReviewRepDTO {

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
