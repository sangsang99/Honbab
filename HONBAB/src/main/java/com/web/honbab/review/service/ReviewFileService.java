package com.web.honbab.review.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewFileService {
	public static final String IMAGE_REVIEW = "D:\\HONBAB\\IMG_REPO\\REVIEW";
	public String getMessage(HttpServletRequest request, String msg, String url);
	public String saveFile(MultipartFile file);
	public void deleteImage(String imageFileName);
}
