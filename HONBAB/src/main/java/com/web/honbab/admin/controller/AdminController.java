package com.web.honbab.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.honbab.admin.service.AdminService;
import com.web.honbab.member.service.MemberService;
import com.web.honbab.session.admin.AdminSession;

//css
@Controller
@RequestMapping("ban")
public class AdminController implements AdminSession {

	@Autowired
	private AdminService as;

	@Autowired
	private MemberService ms;

	@RequestMapping("userManagement")
	public String adminBanIndex() {
		return "admin/adminBan";
	};

	@GetMapping("adminBan") // 회원탈퇴권한 페이지
	public String adminBan(@RequestParam("id") String id) {
		System.out.println("id : " + id);
		as.ban(id);
		return "admin/adminBan";
	}

	@GetMapping("adminPartnerBan") // 회원탈퇴권한 페이지
	public String adminPartnerBan(@RequestParam("id") String id) {
		System.out.println("id : " + id);
		as.partnerBan(id);
		return "admin/adminBan";
	}

	@RequestMapping("member/info")
	public String info(@RequestParam("id") String id, Model model) {
		ms.info(id, model);
		return "member/info";
	}


}
