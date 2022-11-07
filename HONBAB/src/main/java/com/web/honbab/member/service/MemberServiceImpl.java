package com.web.honbab.member.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.member.dto.BizMemberDTO;
import com.web.honbab.member.dto.MemberDTO;
import com.web.honbab.member.service.MemberService;
import com.web.honbab.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
	}
	public int bizuser_check(HttpServletRequest request) {
		BizMemberDTO dto = mapper.bizuser_check(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
	}

	
	@Override
	public void info(String id, Model model) {
		MemberDTO dto = mapper.getMember(id);
		model.addAttribute("info", dto);
	}
	
	@Override
	public int register(MemberDTO member) {
		try {
			return mapper.register(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public String memberDelete(String id, HttpServletRequest request) {
		int result = mapper.delete(id);
		String msg, url;
		
		if(result == 1) {
			msg = "회원탈퇴가 완료되었습니다.";
			url = "/index";
		} else {
			msg ="오류 발생, 작업이 완료되지 않았습니다.";
			url = "/member/info?id="+id;
		}
	return getMessage(request, msg, url);
	}
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {

		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;
		
	}
	
	@Override
	public String modify(String id, HttpServletRequest request) {
		
		MemberDTO dto = new MemberDTO();
		
		int result = 0;
		try {
			result = mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "수정 되었습니다...";
			url = "/index";
		} else {
			msg = "오류입니다~";
			url = "/member/modify?id="+dto.getId();
		}
		
		return getMessage(request, msg, url);
		
	}

}
