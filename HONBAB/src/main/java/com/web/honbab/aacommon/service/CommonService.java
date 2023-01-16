package com.web.honbab.aacommon.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface CommonService {
	
	public int[] paging(Model model, int num, int allCount);

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡfile저장ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	public String getMessage(HttpServletRequest request, String msg, String url);

	public String saveFile(MultipartFile file, String route);

	public void deleteImage(String imageFileName, String route);
	
}
