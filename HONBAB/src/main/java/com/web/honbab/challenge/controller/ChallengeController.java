package com.web.honbab.challenge.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.challenge.dto.ChallengeLikeDTO;
import com.web.honbab.challenge.service.ChallengeFileService;
import com.web.honbab.challenge.service.ChallengeLikeService;
import com.web.honbab.challenge.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService cs;

	@RequestMapping("challengeWriteForm")
	public String challengeWriteForm() {
		
		return "challenge/challengeWriteForm";
	}

	@PostMapping("/challengeSave")
	public void challengeSave(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = cs.challengeSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);		
	}
	
	@GetMapping("challengeView")
	public String challengeView(@RequestParam int writeNo, Model model) {
		cs.challengeView(writeNo, model);
		
		return "challenge/challengeView";
	}
	
	@GetMapping("challengeAllList")
	public String challengeAllList(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		cs.challengeAllList(model, num);
		
		return "challenge/challengeAllList";
	}
	
	@GetMapping("challengeModifyForm")
	public String challengeModifyForm(@RequestParam int writeNo, Model model) {
		cs.challengeView(writeNo, model);
		
		return "challenge/challengeModifyForm";
	}
	
	@PostMapping("challengeModify")
	public void challengeModify(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = cs.challengeModify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@GetMapping("challengeDelete")
	public void challengeDelete(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = cs.challengeDelete(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	@GetMapping("download")
	public void download(@RequestParam String imgName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + imgName);
		File file = new File(ChallengeFileService.IMAGE_REPO+"\\"+ imgName);
		file.setWritable(true);
		file.setReadable(true);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@RequestMapping("challengePop")
	public String challengePop() {
		
		return "challenge/challengePop";
	}
	
	@Autowired
	ChallengeLikeService cls;
	
	@PostMapping("/likeUpdate")
	public Map<String, String> likeUpdate(@RequestBody ChallengeLikeDTO dto) {
		Map<String, String> like = new HashMap<String, String>();
		
		try {
			cls.likeUpdate(dto);
			like.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			like.put("result", "fail");
		}
		return like;
	}
	
	/*
	public void likeCount(int likeWriteNo, String likeId, String likeNickName, Model model) {
		ChallengeLikeDTO dto = new ChallengeLikeDTO();
		dto.setLikeWriteNo(likeWriteNo);
		dto.setLikeId(likeId);
		dto.setLikeNickName(likeNickName);
		
		int defaultLike = 0;
		int likeChk = cls.likeCount(dto);
		
		if(likeChk == 0) {
			cls.likeIn(dto);
		} else if(likeChk == 1) {
			defaultLike = cls.likeInfo(dto);
		}
		model.addAttribute("like", defaultLike);
		
	}
	*/
	

}
