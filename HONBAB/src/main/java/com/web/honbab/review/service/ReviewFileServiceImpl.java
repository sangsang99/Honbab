package com.web.honbab.review.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ReviewFileServiceImpl implements ReviewFileService {

	@Override
	// service에서 file저장 실행결과에따라 message에 들어갈 msg,url값을 전달받는다.
	// request는 Cotroller-Service-FileService 순으로 들어와서 주소 경로를 전달한다.
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script> alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;
	}

	@Override
	public String saveFile(MultipartFile file) {
		// 파일이름에 저장날짜 삽입하기
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = format.format(calendar.getTime());
		sysFileName += file.getOriginalFilename();

		// 파일경로 + 파일이름
		File saveFile = new File(IMAGE_REVIEW + "/" + sysFileName);

		try {
			// 실제로 파일이 저장되는 명령문 arg로는 파일 경로와 이름을 전달
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sysFileName;
	}

	@Override
	public void deleteImage(String imageFileName) {
		File file = new File(IMAGE_REVIEW + "\\" + imageFileName);
		file.delete();
	}

}
