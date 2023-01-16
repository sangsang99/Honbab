package com.web.honbab.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.member.dto.MemberDTO;
import com.web.honbab.mybatis.member.MemberMapper;
import com.web.honbab.session.name.MemberSession;

@Service
public class MemberServiceImpl implements MemberService, MemberSession {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private HttpSession session;
		
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ로그인ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		if (dto != null) {
			if (request.getParameter("pw").equals(dto.getPw())) {
				session.setAttribute(NICK, dto.getNickName());
				return 0;
			}
		}
		return 1;
	}
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ회원가입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	@Override
	public int join(MemberDTO member) {
		try {
			return mapper.join(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	@Override
	public void info(String id, Model model) {
		MemberDTO dto = mapper.getMember(id);
		model.addAttribute("info", dto);
	}
	

	@Override
	public String memberDelete(String id, HttpServletRequest request) {
		int result = mapper.delete(id);
		String msg, url;

		if (result == 1) {
			msg = "회원탈퇴가 완료되었습니다.";
			session.invalidate();
			url = "/index";
		} else {
			msg = "오류 발생, 작업이 완료되지 않았습니다.";
			url = "/member/info?id=" + id;
		}
		return getMessage(request, msg, url);
	}

	@Override
	public String modifySave(MultipartHttpServletRequest mul, HttpServletRequest request) {

		MemberDTO dto = new MemberDTO();
		dto.setEmail(mul.getParameter("email"));
		dto.setGender(mul.getParameter("gender"));
		dto.setId(mul.getParameter("id"));
		dto.setName(mul.getParameter("name"));
		dto.setNickName(mul.getParameter("nickName"));
		dto.setPw(mul.getParameter("pw"));
		dto.setRegion(mul.getParameter("region"));
		dto.setTel(mul.getParameter("tel"));

		int result = 0;
		try {
			result = mapper.modifySave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg, url;
		if (result == 1) {
			msg = "회원정보를 수정하였습니다.";
			url = "/member/info?id=" + dto.getId();
		} else {
			msg = "회원정보 수정에 실패하였습니다. 다시 시도해주세요.";
			url = "/member/modifyForm?id=" + dto.getId();
		}
		return getMessage(request, msg, url);
	}
	
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ기타ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {

		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;
	}
	
}
