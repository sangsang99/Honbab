package com.web.honbab.challenge.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ChallengeFileService {
	
	public static final String IMAGE_REPO = "D:\\HONBAB\\IMG_REPO\\challenge";
	
	public String getMessage(HttpServletRequest request, String msg, String url);

	public String saveFile(MultipartFile file);
	
	public void deleteImage(String originFileName);

}
