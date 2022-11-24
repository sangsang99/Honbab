package com.web.honbab.review.dto;

public class ReviewLikeDTO {
	private int writeNo;
	private String likeId;
	private int likeWriteNo;
	private String isLike;
	
	public String getIsLike() {
		return isLike;
	}

	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getLikeId() {
		return likeId;
	}

	public void setLikeId(String likeId) {
		this.likeId = likeId;
	}

	public int getLikeWriteNo() {
		return likeWriteNo;
	}

	public void setLikeWriteNo(int likeWriteNo) {
		this.likeWriteNo = likeWriteNo;
	}

}
