package com.web.honbab.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.honbab.admin.service.BoardService;
import com.web.honbab.challenge.service.ChallengeService;
import com.web.honbab.find.service.FindService;
import com.web.honbab.promo.service.PromoService;
import com.web.honbab.review.service.ReviewService;

@Controller
@RequestMapping("admin")
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@Autowired
	private FindService fs;
	
	@Autowired
	private ReviewService rs;
	
	@Autowired
	private PromoService ps;
	
	@Autowired
	private ChallengeService cs;
	
	@RequestMapping("boardManagement")
	public String boardManagement() {
		
		return "admin/boardManagement";
	}
	
	@RequestMapping("findBoard")
	public String findBoard(Model model, 
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		fs.findAllList(model, num);
		
		return "admin/findBoard";
	}
	
	@RequestMapping(value = "upViews")
	public String upViews(@RequestParam int writeNo) {
		fs.upViews(writeNo);
		return "redirect:findContent?writeNo=" + writeNo;
	}
	
	@RequestMapping("findContent")
	public String findContent(@RequestParam int writeNo, Model model) {
		fs.findContent(writeNo, model);
		
		return "admin/findContent";
	}
	
	@GetMapping("find_delete")
	public void find_Delete(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = bs.findDelete(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	//
	@RequestMapping("challBoard")
	public String challBoard(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		cs.challengeAllList(model, num);
		return "admin/challBoard";
	}
	
	@GetMapping("challContent")
	public String challengeView(@RequestParam int writeNo, Model model) {
		cs.challengeView(writeNo, model);
		
		return "admin/challContent";
	}
	
	@GetMapping("challengeDelete")
	public void challengeDelete(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = bs.challengeDelete(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	
	@RequestMapping("honbabBoard")
	public String honbabBoard(Model model, 
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		rs.reviewAllList(model, num);
		return "admin/honbabBoard";
	}
	
	@RequestMapping(value = "upViews1")
	public String upViews1(@RequestParam int writeNo) {
		bs.upViews1(writeNo);
		return "redirect:honbabContent?writeNo=" + writeNo;
	}
	
	@RequestMapping(value = "honbabContent")
	public String honbabContent(@RequestParam int writeNo, Model model) {
		rs.reviewContent(writeNo, model);
		return "admin/honbabContent";
	}
	
	@GetMapping("review_delete")
	public void review_delete(@RequestParam int writeNo, @RequestParam String imageFileName,
						HttpServletRequest request, HttpServletResponse response) throws IOException{
		String message = bs.reviewDelete(writeNo, imageFileName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter()	;
		out.println(message);
	}
	
	//
	
	@RequestMapping("promoBoard")
	public String promoBoard(Model model, @RequestParam(value="num", required = false, defaultValue ="1") int num) {
		ps.promoList(model, num);
		return "admin/promoBoard";
	}
	
	@RequestMapping(value="promoContent")
	public String promoContent(@RequestParam int writeNo, Model model) {
		ps.contentView(writeNo, model);
		return "admin/promoContent";
	}
	@GetMapping("delete")
	public void delete(@RequestParam int writeNo, @RequestParam String imageFileName,
					  HttpServletResponse response,
					  HttpServletRequest request) throws IOException{
		String message = bs.boardDelete(writeNo, imageFileName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter()	;
		out.println(message);
	}
	
}
