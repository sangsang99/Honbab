package com.web.honbab.challenge.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.challenge.service.ChallengeFileService;
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
	public String challengeView(@RequestParam int uWriteNo, Model model) {
		cs.challengeView(uWriteNo, model);
		
		return "challenge/challengeView";
	}
	
	@GetMapping("challengeAllList")
	public String challengeAllList(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		cs.challengeAllList(model, num);
		
		return "challenge/challengeAllList";
	}
	
	@GetMapping("challengeModifyForm")
	public String challengeModifyForm(@RequestParam int uWriteNo, Model model) {
		cs.challengeView(uWriteNo, model);
		
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
	public void challengeDelete(@RequestParam int uWriteNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = cs.challengeDelete(uWriteNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	@GetMapping("download")
	public void download(@RequestParam String uImgName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + uImgName);
		File file = new File(ChallengeFileService.IMAGE_REPO+"\\"+ uImgName);
		FileInputStream in = new FileInputStream(file);
		file.setWritable(true);
		file.setReadable(true);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@RequestMapping("challengePop")
	public String challengePop() {
		
		return "challenge/challengePop";
	}
	
	
	
	
	

}
