package com.web.honbab.challenge.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.challenge.dto.ChallengeDTO;
import com.web.honbab.mybatis.challenge.ChallengeMapper;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	ChallengeMapper mapper;
	
	@Autowired
	ChallengeFileService cfs;
	
	@Override
	public String challengeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ChallengeDTO dto = new ChallengeDTO();
		dto.setuLevel(mul.getParameter("uLevel"));
		dto.setuTitle(mul.getParameter("uTitle"));
		dto.setuContent(mul.getParameter("uContent"));
		dto.setuWriter(mul.getParameter("uWriter"));
		MultipartFile file = mul.getFile("uImgName");

		if(file.getSize() != 0) {
			dto.setuImgName(cfs.saveFile(file));
		} 
		else {
			dto.setuImgName("nan");	
		}
		
		int result = 0;
		try {
			result = mapper.challengeSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새 글 등록 완료";
			url = "/challengeAllList";
		} else {
			msg = "새 글 등록 중 문제 발생";
			url = "/challengeWriteForm";
		}
		return cfs.getMessage(request, msg, url);
		
	}
	
	@Override
	public void challengeView(int uWriteNo, Model model) {
		model.addAttribute("challengeData", mapper.challengeView(uWriteNo));
		upView(uWriteNo);
	}

	@Override
	public void challengeAllList(Model model, int num) {
		int pageLetter = 8;
		int allCount = mapper.challengePgCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		model.addAttribute("repeat", repeat);
		model.addAttribute("challengeList", mapper.challengeAllList(start, end));
	}

	@Override
	public String challengeModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		ChallengeDTO dto = new ChallengeDTO();
		dto.setuLevel(mul.getParameter("uLevel"));
		dto.setuTitle(mul.getParameter("uTitle"));
		dto.setuContent(mul.getParameter("uContent"));
		MultipartFile file = mul.getFile("uImgName");

		if(file.getSize() != 0) {	//이미지 변경
			dto.setuImgName(cfs.saveFile(file));
			cfs.deleteImage(mul.getParameter("originFileName"));
		}  else { 
			dto.setuImgName(mul.getParameter("originFileName")); 
		}
		
		int result = 0;
		try { 
			result = mapper.challengeModify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "수정 완료";
			url = "/challengeAllList";
		} else {
			msg = "수정 중 문제 발생";
			url = "/challengeView?uWriteNo="+dto.getuWriteNo();
		}
		return cfs.getMessage(request, msg, url);
	}

	@Override
	public String challengeDelete(int uWriteNo, HttpServletRequest request) {
		ChallengeDTO dto = new ChallengeDTO();
		int result = mapper.challengeDelete(uWriteNo);
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제 완료";
			url = "/challengeAllList";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/challengeView?uWriteNo="+uWriteNo;
		}
		return  cfs.getMessage(request, msg, url);
	}
	
	public void upView(int uWriteNo) {
		mapper.upView(uWriteNo);
	}
	
	
	

}
