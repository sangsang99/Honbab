package com.web.honbab.promo.dto;

import java.sql.Timestamp;

public class PromoRepDTO {
	private String id;
	private String title;
	private String content;
	private int write_group;
	private Timestamp write_date;
	private String reNick;
	private int star;	
	
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
	public String getReNick() {
		return reNick;
	}
	
	public void setReNick(String reNick) {
		this.reNick = reNick;
	}
	
	public int getStar() {
		return star;
	}	
	
	public void setStar(int star) {
		this.star = star;
	}	
	
	
	
	
	
		
	
		 
		
	}
	
	
	
	
	
	

