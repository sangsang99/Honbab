package com.web.honbab.challenge.dto;

/*
<id property="writeNo" column="WRITE_NO" />
<result property="chLevel" column="CH_LEVEL" />
<result property="title" column="TITLE" />
<result property="content" column="CONTENT" />
<result property="nickName" column="NICKNAME" />
<result property="saveDate" column="SAVE_DATE" />
<result property="views" column="VIEWS" />
<result property="imgName" column="IMGNAME" />
<result property="likes" column="LIKES" />
<result property="id" column="ID" />
*/

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChallengeDTO {
	private int writeNo;
	private String chLevel;
	private String title;
	private String content;
	private String nickName;
	private String saveDate;
	private int views;
	private String imgName;
	private int likes;
	private String id;

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getChLevel() {
		return chLevel;
	}

	public void setChLevel(String chLevel) {
		this.chLevel = chLevel;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(Timestamp saveDate) {
		SimpleDateFormat smallFormat = new SimpleDateFormat("YYYY-MM-dd");
		this.saveDate = smallFormat.format(saveDate);
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
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
	
	private int level;
	
	private String keyword;

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

}
