package com.web.honbab.challenge.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ChallengeService {
	
	public String challengeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void challengeView(int writeNo, Model model);

	public void challengeAllList(Model model, int num);
	
	public String challengeModify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String challengeDelete(int writeNo, HttpServletRequest request);
	
	public void challengeBestList(Model model);
	
	/*
	 * public int likesCount(int writeNo);
	 * 
	 * public int updateLike(int writeNo) throws Exception;
	 * 
	 * public int unLike(int writeNo) throws Exception;
	 */
	
	// 검색
	//public void challengeSearch(MultipartHttpServletRequest mul, Model model); 
	public void challengeSearch(MultipartHttpServletRequest mul, Model model, int num);

	
	
}
