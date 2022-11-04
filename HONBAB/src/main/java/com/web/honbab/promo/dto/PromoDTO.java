package com.web.honbab.promo.dto;

import com.web.honbab.admin.dto.ADDTO;

public class PromoDTO {
	
	private int writeNo;
	private String title;
	private String content;
	private String saveDate;
	private int hit;
	private String imageFileName;
	private String id;
	private String comName;
	private int star; //원래 reply.dto에 작성 해야 하는거 같은데 인식을 못해서 여기에도 추가함. 문제 생기면 삭제 필요
	
	private ADDTO addto;
	//ADMIN TEST
	public int getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
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
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComName() {
		return comName;
	}
	
	public void setComName(String comName) {
		this.comName = comName;
	}
	
	public int getStar() {
		return star; //문제 발생시 삭제 필요
	}
	public void setStar(int star) {
		this.star = star; //문제 발생시 삭제 필요
	}
	public ADDTO getAddto() {
		return addto;
	}
	public void setAddto(ADDTO addto) {
		this.addto = addto;
	}
	

	
	
	
	

	
	
	
	
	
	
	
}
