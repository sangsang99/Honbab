package com.web.honbab.challenge.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ChallengeService {
	
	public String challengeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void challengeView(int writeNo, Model model);
	
	public int challengeLike(int writeNo, Model model);

	public void challengeAllList(Model model, int num);
	
	public String challengeModify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String challengeDelete(int writeNo, HttpServletRequest request);
	
	public void challengeBestList(Model model);
	
	public void challengeSearch(MultipartHttpServletRequest mul, Model model, int num);

	
	
}
