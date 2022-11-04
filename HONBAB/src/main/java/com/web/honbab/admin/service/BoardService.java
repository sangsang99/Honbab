package com.web.honbab.admin.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface BoardService {
	////
	public void findBoard(Model model, int num);

	public String findDelete(int writeNo, HttpServletRequest request);
	
	public void honbabBoard(Model model, int num);
	
	public void upViews1(int writeNo);
	
	String reviewDelete(int writeNo, String imageFileName, HttpServletRequest request);
	
	public void promoBoard(Model model, int num);

	public String boardDelete(int writeNo, String imageFileName, HttpServletRequest request);
	
	public void challBoard(Model model, int num);

	public String challengeDelete(int writeNo, HttpServletRequest request);

	
}
