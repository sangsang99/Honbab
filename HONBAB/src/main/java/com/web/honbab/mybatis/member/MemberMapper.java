package com.web.honbab.mybatis.member;

import java.util.ArrayList;

import com.web.honbab.member.dto.BizMemberDTO;
import com.web.honbab.member.dto.MemberDTO;

public interface MemberMapper {
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ로그인ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public MemberDTO user_check(String id);

	public BizMemberDTO bizuser_check(String id);

	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ회원가입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public int join(MemberDTO member);
	
	public int biz_join(BizMemberDTO member);
	
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public ArrayList<MemberDTO> memberInfo(); //미확인 함수
	
	public MemberDTO getMember(String id); //info
	
	public int delete(String id);

	public int modifySave(MemberDTO dto);

	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ기타공통ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
}
