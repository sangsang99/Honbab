package com.web.honbab.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.web.honbab.admin.dto.NoticeRepDTO;
import com.web.honbab.review.dto.ReviewRepDTO;

public interface OperService {

	public String getMessage(HttpServletRequest request, String msg, String url);
	public String noticeWrite(HttpServletRequest request);
	public void viewNoticeList(Model model);
	public void noticeConetentView(Model model, int writeNo);
	public String deleteNoticeContent(int writeNo, HttpServletRequest request);
	public String updateNoticeContent(int writeNo, HttpServletRequest request);
	
	public void addReply(NoticeRepDTO dto);
	public List<ReviewRepDTO> getRepList(int writeNo);
	
	public int setAD(HttpServletRequest request);
	public void promoList(Model model, int num);
}
