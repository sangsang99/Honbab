package com.web.honbab.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.honbab.admin.dto.NoticeBoardDTO;
import com.web.honbab.admin.dto.NoticeRepDTO;
import com.web.honbab.mybatis.admin.OperMapper;
import com.web.honbab.review.dto.ReviewRepDTO;

@Service
public class OperServiceImpl implements OperService {

	@Autowired
	private OperMapper mapper;
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script> alert('" + msg +"');";
		message += "location.href='" + path + url + "';</script>";
		return message;
	}
	
	@Override
	public String noticeWrite(HttpServletRequest request) {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		int result =  0;
		try {
			result = mapper.noticeWrite(dto);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="공지사항 작성 완료";
			url ="/oper/operation";
		} else {
			msg ="문제가 있습니다.";
			url ="/oper/writeNoticeForm";
		}
		
		return getMessage(request, msg, url);
	}

	@Override
	public void viewNoticeList(Model model) {
		model.addAttribute("noticeList", mapper.viewNoticeList()) ;
	}

	@Override
	public void noticeConetentView(Model model, int writeNo) {
		model.addAttribute("noticeContent", mapper.viewNoticeContent(writeNo));
	}

	@Override
	public String deleteNoticeContent(int writeNo, HttpServletRequest request) {
		int result =  0;
		try {
			result = mapper.deleteNoticeContent(writeNo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="공지사항 삭제 완료";
			url ="/oper/operation";
		} else {
			msg ="문제가 있습니다.";
			url ="/oper/operNoticeContent" + writeNo;
		}
		
		return getMessage(request, msg, url);
	}

	@Override
	public String updateNoticeContent(int writeNo, HttpServletRequest request) {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setWriteNo(writeNo);
		
		int result =  0;
		try {
			result = mapper.updateNoticeContent(dto);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="공지사항 수정 완료";
			url ="/oper/operation";
		} else {
			msg ="문제가 있습니다.";
			url ="/oper/operNoticeContent" + writeNo;
		}
		
		return getMessage(request, msg, url);
	}
	
	@Override
	public void addReply(NoticeRepDTO dto) {
		mapper.addReply(dto);
	}


	@Override
	public List<ReviewRepDTO> getRepList(int writeNo) {
		return mapper.getRepList(writeNo);
	}
	
}
