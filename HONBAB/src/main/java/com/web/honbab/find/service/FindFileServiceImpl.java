package com.web.honbab.find.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;



@Service
public class FindFileServiceImpl implements FindFileService{
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		
		return message;
	}
	
	@Override
	public void deleteImage(String imageFileName) {
		File file = new File(IMAGE_REVIEW + "\\" + imageFileName);
		file.delete();
	}
	
}
