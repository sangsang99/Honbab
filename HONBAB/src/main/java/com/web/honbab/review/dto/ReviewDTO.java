package com.web.honbab.review.dto;

import java.sql.Date;

/*
CREATE TABLE REVIEW_BOARD(
    WRITE_NO NUMBER(10) PRIMARY KEY,
    NICKNAME VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    VIEWS NUMBER(10) DEFAULT 0,
    WRITE_DATE DATE DEFAULT SYSDATE,
    IMGNAME VARCHAR2(1000),
    LIKES NUMBER(10) DEFAULT 0,
    ID VARCHAR(100) NOT NULL
);

CREATE SEQUENCE REVIEW_BOARD_SEQ INCREMENT BY 1 MAXVALUE 1000;
*/

public class ReviewDTO {

	private int writeNo;
	private String nickname;
	private String title;
	private String content;
	private int views;
	private Date writeDate;
	private String imgName;
	private int likes;
	private String id;
	
	
	public int getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
