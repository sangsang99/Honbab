package com.web.honbab.promo.dto;

import java.sql.Timestamp;


/*
CREATE table mvc_board(
Write_no number(10) primary key,
Title varchar2(100),
Content varchar2(300),
Savedate date default sysdate,
Hit number(10) default 0,
Image_file_name varchar2(100),
Id VARCHAR2(20) not null,
--constraint fk_test foreign key(id) REFERENCES membership(id) on delete cascade
);
 
 */
public class PromoRepDTO {
	private String id;
	private String title;
	private String content;
	private int write_group;
	private Timestamp write_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getWrite_group() {
		return write_group;
	}
	public void setWrite_group(int write_group) {
		this.write_group = write_group;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	
}
