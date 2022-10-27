package com.web.honbab.challenge.dto;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChallengeDTO {
	private int uWriteNo;
	private String uLevel;
	private String uTitle;
	private String uContent;
	private int uViews;
	private String uSaveDate;
	private String uImgName;
	private String uWriter;

	public int getuWriteNo() {
		return uWriteNo;
	}

	public void setuWriteNo(int uWriteNo) {
		this.uWriteNo = uWriteNo;
	}

	public String getuLevel() {
		return uLevel;
	}

	public void setuLevel(String uLevel) {
		this.uLevel = uLevel;
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

	public String getuSaveDate() {
		return uSaveDate;
	}

	public void setuSaveDate(Timestamp saveDate) {
		SimpleDateFormat smallFormat = new SimpleDateFormat("YYYY-MM-dd");
		this.uSaveDate = smallFormat.format(saveDate);
		// (Timestamp saveDate) �� format ��ü�� format �޼ҵ带 ���� "YYYY-MM-dd HH:mm:ss" ��������
	}

	public String getuImgName() {
		return uImgName;
	}

	public void setuImgName(String uImgName) {
		this.uImgName = uImgName;
	}

	public String getuWriter() {
		return uWriter;
	}

	public void setuWriter(String uWriter) {
		this.uWriter = uWriter;
	}

	
	
	
}
