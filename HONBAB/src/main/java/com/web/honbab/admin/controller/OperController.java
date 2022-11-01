package com.web.honbab.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("oper")
public class OperController{

	/*
	 * @Autowired service
	 */
	@RequestMapping("operation")
	public String goNoticeWriteFrom() {
		return "admin/operation";
	}
	
	@RequestMapping("writeNoticeForm")
	public String goWriteNoticeForm() {
		return "admin/operNoticeWriteForm";
	}
	 	
	@RequestMapping("noticeConetentView")
	public String goNoticeConetentView() {
		return "admin/operNoticeContent";
	}
	
	@RequestMapping("deleteNoticeContent")
	public String deleteNoticeContent() {
		return "admin/operation";
	}

	@RequestMapping("updateNoticeContent")
	public String updateNoticeContent() {
		return "admin/operation";
	}
}
