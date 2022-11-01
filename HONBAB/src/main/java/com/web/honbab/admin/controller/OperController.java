package com.web.honbab.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.honbab.admin.service.OperService;

@Controller
@RequestMapping("oper")
public class OperController{

	@Autowired
	private OperService os;
	
	//영업관리 메인페이지
	@RequestMapping("operation")
	public String goNoticeWriteFrom(Model model) {
		os.viewNoticeList(model);
		return "admin/operation";
	}
	
	//공지작성이동
	@RequestMapping("writeNoticeForm")
	public String goWriteNoticeForm() {
		return "admin/operNoticeWriteForm";
	}
	 
	//공지사항 보기
	@RequestMapping("noticeConetentView")
	public String goNoticeConetentView(Model model, @RequestParam int writeNo) {
		os.noticeConetentView(model, writeNo);
		return "admin/operNoticeContent";
	}
	
	//공지사항 삭제버튼
	@RequestMapping("deleteNoticeContent")
	public void deleteNoticeContent(@RequestParam int writeNo,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = os.deleteNoticeContent(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	
	@RequestMapping("modifyNoticeContent")
	public String updateNoticeForm(Model model, @RequestParam int writeNo) {
		os.noticeConetentView(model, writeNo);
		return "admin/operNoticeModifyForm";
	}
	
	//공지사항 수정버튼
	@RequestMapping("noticeModify")
	public void updateNoticeContent(@RequestParam int writeNo,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		String message = os.updateNoticeContent(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	//공지사항 작성버튼 누르면 반응
	@RequestMapping("noticeWrite")
	public void insertNoiticeWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = os.noticeWrite(request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
}
