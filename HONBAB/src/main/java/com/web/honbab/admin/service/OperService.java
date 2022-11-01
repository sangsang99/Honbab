package com.web.honbab.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface OperService {

	public String getMessage(HttpServletRequest request, String msg, String url);
	public String noticeWrite(HttpServletRequest request);
	public void viewNoticeList(Model model);
	public void noticeConetentView(Model model, int writeNo);
	public String deleteNoticeContent(int writeNo, HttpServletRequest request);
	public String updateNoticeContent(int writeNo, HttpServletRequest request);
}
