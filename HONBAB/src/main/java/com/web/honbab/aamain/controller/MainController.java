package com.web.honbab.aamain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.honbab.challenge.service.ChallengeService;
import com.web.honbab.find.service.FindService;
import com.web.honbab.review.service.ReviewService;

@Controller
public class MainController {
	@Autowired
	private ReviewService rs;

	@Autowired
	private FindService fs;

	@Autowired
	private ChallengeService cs;

	// "http://localhost:8080/honbab/" 으로 (firstView) 들어가면 나오는 것
	// 접시페이지
	@RequestMapping(value = "/")
	public String defalutMain(Model model) {
		return "home";
	}

	@RequestMapping(value = "jstest")
	public String jstest(Model model) {
		return "jstest";
	}

	@RequestMapping(value = "index")
	public String defalutMainIndex(Model model) {
		rs.reviewBestList(model);
		fs.findBestList(model);
		cs.challengeBestList(model);

		return "index";
	}

	@RequestMapping(value = "home")
	public String Mainhome(Model model) {
		return "/home";
	}

	@RequestMapping(value = "admin")
	public String goAdmin(Model model) {
		return "admin/ADMIndex";
	}
	
	@RequestMapping(value = "juso")
	public String jusoAPI() {
		return "juso/Sample";
	}
	
	@RequestMapping(value = "juso/jusoPopup")
	public String jusoPopup() {
		return "juso/jusoPopup";
	}
	
	
}
