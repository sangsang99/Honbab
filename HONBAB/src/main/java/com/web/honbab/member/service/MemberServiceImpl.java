package com.web.honbab.member.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.honbab.member.dto.MemberDTO;
import com.web.honbab.member.dto.TableDTO;
import com.web.honbab.member.service.MemberService;
import com.web.honbab.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		/* TableDTO tdto = mapper.table_check(request.getParameter("chk_info")); */
		if(dto != null) {
			if(request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
	}
	
	
	
	@Override
	public void memberInfo(Model model) {
		model.addAttribute("memberList", mapper.memberInfo());		
	} 
	
	@Override
	public void info(String userid, Model model) {
		MemberDTO dto = mapper.getMember(userid);
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

}
