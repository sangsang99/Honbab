package com.web.honbab.mybatis.member;

import java.util.ArrayList;

import com.web.honbab.member.dto.BizMemberDTO;
import com.web.honbab.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO user_check(String id);
	public BizMemberDTO bizuser_check(String id);
	public ArrayList<MemberDTO> memberInfo();
	public MemberDTO getMember(String id);
	public int register(MemberDTO member);
	public int delete(String id);
	

	public int modifySave(MemberDTO dto);


}
