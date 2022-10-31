package com.web.honbab.challenge.dto;

/*
	CREATE TABLE LEVEL_CHALLENGE_LIKE (
	LIKE_NO NUMBER DEFAULT 0,
	LIKE_WRITE_NO NUMBER NOT NULL,
	LIKE_ID VARCHAR2(100),
	LIKE_NICKNAME VARCHAR2(100),
	FOREIGN KEY(LIKE_WRITE_NO) REFERENCES LEVEL_CHALLENGE(WRITE_NO)
	);
*/

public class ChallengeLikeDTO {

	private int likeNo;
	private int likeWriteNo;
	private String likeId;
	private String likeNickName;

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getLikeWriteNo() {
		return likeWriteNo;
	}

	public void setLikeWriteNo(int likeWriteNo) {
		this.likeWriteNo = likeWriteNo;
	}

	public String getLikeId() {
		return likeId;
	}

	public void setLikeId(String likeId) {
		this.likeId = likeId;
	}

	public String getLikeNickName() {
		return likeNickName;
	}

	public void setLikeNickName(String likeNickName) {
		this.likeNickName = likeNickName;
	}

}
