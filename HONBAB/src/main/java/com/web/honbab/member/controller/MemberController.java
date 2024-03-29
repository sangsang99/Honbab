package com.web.honbab.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.honbab.admin.service.OperService;
import com.web.honbab.challenge.service.ChallengeService;
import com.web.honbab.find.service.FindService;
import com.web.honbab.member.dto.BizMemberDTO;
import com.web.honbab.member.dto.MemberDTO;
import com.web.honbab.member.service.BizMemberService;
import com.web.honbab.member.service.MemberService;
import com.web.honbab.review.service.ReviewService;
import com.web.honbab.session.admin.AdminSession;
import com.web.honbab.session.name.MemberSession;

@Controller
@RequestMapping(value = "member")
public class MemberController implements MemberSession, AdminSession {

	@Autowired
	private MemberService ms;

	@Autowired
	private BizMemberService bms;

	@Autowired
	private HttpSession session;
	
	/*index페이지 이동시 Best게시글 import */
	@Autowired
	private OperService os;

	@Autowired
	private ReviewService rs;

	@Autowired
	private FindService fs;

	@Autowired
	private ChallengeService cs;

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 로그인 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("user_check")
	public String userCheck(HttpServletRequest request, RedirectAttributes ra) {
		int result = ms.user_check(request);
		if (result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}

	@PostMapping("bizuser_check")
	public String bizuserCheck(HttpServletRequest request,  HttpSession session, RedirectAttributes ra) {
		int result = bms.user_check(request);
		if (result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			session.setAttribute(BIZ, true);
			return "redirect:successLogin";
		}
		return "redirect:login";
	}

	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session, Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1")  int num) {
		session.setAttribute(LOGIN, id);
		rs.reviewBestList(model);
		fs.findBestList(model);
		cs.challengeBestList(model);
		os.promoList(model, num);
		return "index";
	}

	@RequestMapping("adminUserCheck")
	public String adminUserCheck(HttpServletRequest request, RedirectAttributes ra) {
		int result = os.adminUserCheck(request);
		if (result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:successADMLogin";
		}
		return "redirect:login";
	}

	@RequestMapping("successADMLogin")
	public String successADMLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(ADMIN, id);
		return "admin/ADMIndex";
	}


	@GetMapping("logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "redirect:/index";
	}

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 회원가입 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	@RequestMapping("/join_form")
	public String join_form() {
		return "member/join";
	}

	//admin페이지에서 접속
	@RequestMapping("/bRegister_form")
	public String bizRegisterForm() {
		return "member/bizRegister";
	}
	
	@RequestMapping("join")
	public String join(MemberDTO member) {
		int result = ms.join(member);
		if (result == 1) {
			return "redirect:login";
		}
		return "redirect:join_form";
	}
	
	@RequestMapping("biz_join")
	public void bizJoin(BizMemberDTO member, MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = bms.join(member, mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 마이페이지 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
		
	@RequestMapping("/info")
	public String info(Model model) {
		String id = (String) session.getAttribute(LOGIN);
		ms.info(id, model);
		return "member/info";
	}

	@RequestMapping("bizInfo")
	public String bizInfo(@RequestParam("id") String id, Model model) {
		bms.info(id, model);
		return "member/bizInfo";
	}
	
	@GetMapping("download") //file
	public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception {
		response.addHeader("Context-disposition", "attachment; fileName=" + imageFileName);
		File file = new File(BizMemberService.IMAGE_BIZJOIN + "\\" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("delete")
	public void delete(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String message = ms.memberDelete(id, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@GetMapping("bizDelete")
	public void bizDelete(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String message = bms.memberDelete(id, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	//TODO 어디에 쓰는건지 확인필요
	@RequestMapping("/callback")
	public String callback() {
		return "redirect:register_form";
	}

	@RequestMapping("/modifyForm")
	public String modifyForm(Model model) {
		String id = (String) session.getAttribute(LOGIN);
		ms.info(id, model);
		return "member/modifyForm";
	}

	@RequestMapping("bizModifyForm")
	public String bizModifyForm(Model model) {
		String id = (String) session.getAttribute(LOGIN);
		bms.info(id, model);
		return "member/bizModifyForm";
	}

	@PostMapping("modifySave")
	public void modifySave(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String message = ms.modifySave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@PostMapping("bizModifySave")
	public void bizModifySave(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String message = bms.modifySave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
}
