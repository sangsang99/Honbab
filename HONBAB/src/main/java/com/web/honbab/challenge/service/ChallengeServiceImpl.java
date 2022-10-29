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
		dto.setChLevel(mul.getParameter("chLevel"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("Content"));
		dto.setNickName(mul.getParameter("nickName"));
		MultipartFile file = mul.getFile("imgName");

		if(file.getSize() != 0) {
			dto.setImgName(cfs.saveFile(file));
		} 
		else {
			dto.setImgName("nan");	
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
	public void challengeView(int writeNo, Model model) {
		model.addAttribute("challengeData", mapper.challengeView(writeNo));
		upView(writeNo);
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
		dto.setChLevel(mul.getParameter("chLevel"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("imgName");

		if(file.getSize() != 0) {	//이미지 변경
			dto.setImgName(cfs.saveFile(file));
			cfs.deleteImage(mul.getParameter("originFileName"));
		}  else { 
			dto.setImgName(mul.getParameter("originFileName")); 
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
			url = "/challengeView?writeNo="+dto.getWriteNo();
		}
		return cfs.getMessage(request, msg, url);
	}

	@Override
	public String challengeDelete(int writeNo, HttpServletRequest request) {
		ChallengeDTO dto = new ChallengeDTO();
		int result = mapper.challengeDelete(writeNo);
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제 완료";
			url = "/challengeAllList";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/challengeView?writeNo="+ writeNo;
		}
		return  cfs.getMessage(request, msg, url);
	}
	
	public void upView(int writeNo) {
		mapper.upView(writeNo);
	}
	
	
	

}
