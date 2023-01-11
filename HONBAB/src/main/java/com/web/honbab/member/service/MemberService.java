package com.web.honbab.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.member.dto.BizMemberDTO;
import com.web.honbab.member.dto.MemberDTO;

public interface MemberService {
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ로그인ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public int user_check(HttpServletRequest request);

	public int bizuser_check(HttpServletRequest request);

	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ회원가입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public int join(MemberDTO member);
	
	public int bizJoin(BizMemberDTO member);

	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public void info(String id, Model model);
	
	public void bizInfo(String id, Model model);
	
	public String memberDelete(String id, HttpServletRequest request);
	
	public String bizMemberDelete(String id, HttpServletRequest request);

	String modifySave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ기타ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/	
	public String getMessage(HttpServletRequest request, String msg, String url);




}
