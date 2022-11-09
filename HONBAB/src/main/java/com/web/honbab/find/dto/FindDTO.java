package com.web.honbab.find.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class FindDTO {
	private int writeNo ;
	private String nickName;
	private String title;
	private String content;
	private int views;
	private String writeDate;
	private int age;
	private String region;
	private String gen;
	private String id;
	
	//admin test 해보즈아ㅏㅏㅏㅏㅏㅏㅏㅏ
	public int getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		SimpleDateFormat smallFormat = new SimpleDateFormat("YYYY-MM-dd");
		this.writeDate = smallFormat.format(writeDate);
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
