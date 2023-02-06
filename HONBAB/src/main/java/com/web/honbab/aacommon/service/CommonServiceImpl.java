package com.web.honbab.aacommon.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonServiceImpl implements CommonService {
	
	// 페이징 함수 쿼리에 쓰일 START값, END값 int[1] 배열로 반환, num은 페이지 넘버
	public int[] paging(Model model, int num, int allCount) {
		// page부여
		int pageLetter = 8; // 한 페이지당 글 목록수
		int repeat = allCount / pageLetter; // 마지막 페이지 번호
		if (allCount % pageLetter != 0) // 글이 한개라도 나머지가 있으면 추가페이지 필요
			repeat += 1;
		int end = num * pageLetter; // numDefault는 1, pageLetter는 3 이면 end는 3 // 3의 배수만 나옴
		int start = end + 1 - pageLetter; // 끝번호가 15면 첫번호는 13 이런식

		// block처리
		int block = 3;
		int startPage = (num - 1) / block * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > repeat)
			endPage = repeat;

		model.addAttribute("block", block); // jsp파일에 보낼값
		model.addAttribute("startPage", startPage); // jsp파일에 보낼값
		model.addAttribute("endPage", endPage); // jsp파일에 보낼값
		model.addAttribute("repeat", repeat); // jsp파일에 보낼값
		model.addAttribute("nowPage", num); 

		return new int[] { start, end };
	}
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡfile저장ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
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
	public String saveFile(MultipartFile file, String route) {
		// 파일이름에 저장날짜 삽입하기
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = format.format(calendar.getTime());
		sysFileName += file.getOriginalFilename();

		// 파일경로 + 파일이름
		File saveFile = new File(route + "/" + sysFileName);

		try {
			// 실제로 파일이 저장되는 명령문 arg로는 파일 경로와 이름을 전달
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sysFileName;
	}

	@Override
	public void deleteImage(String imageFileName, String route) {
		File file = new File(route + "\\" + imageFileName);
		file.delete();
	}
}
