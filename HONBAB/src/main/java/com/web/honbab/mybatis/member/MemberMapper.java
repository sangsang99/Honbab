package com.web.honbab.mybatis.member;

import java.util.ArrayList;

import com.web.honbab.member.dto.MemberDTO;
import com.web.honbab.member.dto.TableDTO;

public interface MemberMapper {
	public MemberDTO user_check(String id);

	/* public TableDTO table_check(String chk_info); */
	public ArrayList<MemberDTO> memberInfo();
	public MemberDTO getMember(String userid);
	public int register(MemberDTO member);

}
