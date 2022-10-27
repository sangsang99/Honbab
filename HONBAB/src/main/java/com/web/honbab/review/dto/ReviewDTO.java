package com.web.honbab.review.dto;

import java.sql.Date;



public class ReviewDTO {

	private int uSeq;
	private String uNickName;
	private String uTitle;
	private String uContent;
	private int uViews;
	private Date uDate;
	private String uImageName;
	private int uLike;
	


	public int getuSeq() {
		return uSeq;
	}
	public void setuSeq(int uSeq) {
		this.uSeq = uSeq;
	}
	public String getuNickName() {
		return uNickName;
	}
	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}
	public String getuTitle() {
		return uTitle;
	}
	public void setuTitle(String uTitle) {
		this.uTitle = uTitle;
	}
	public String getuContent() {
		return uContent;
	}
	public void setuContent(String uContent) {
		this.uContent = uContent;
	}
	public int getuViews() {
		return uViews;
	}
	public void setuViews(int uViews) {
		this.uViews = uViews;
	}
	public Date getuDate() {
		return uDate;
	}
	public void setuDate(Date uDate) {
		this.uDate = uDate;
	}
	
	public int getuLike() {
		return uLike;
	}
	public void setuLike(int uLike) {
		this.uLike = uLike;
	}
	public String getuImageName() {
		return uImageName;
	}
	public void setuImageName(String uImageName) {
		this.uImageName = uImageName;
	}
	
	
	
	
	
	
}
