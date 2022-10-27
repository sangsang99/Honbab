package com.web.honbab.find.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.find.dto.FindDTO;
import com.web.honbab.find.dto.FindRepDTO;
import com.web.honbab.mybatis.find.FindMapper;
import com.web.honbab.review.dto.ReviewRepDTO;


@Service
public class FindServiceImpl implements FindService{
	
	@Autowired
	FindMapper mapper;
	
	@Autowired
	FindFileService ffs;
	
	
	
	@Override
	public void findAllList(Model model, int num) {
		int pageLetter = 3;  
		int allCount = mapper.selectFindCount(); 
		int repeat = allCount/pageLetter; 
		if(allCount % pageLetter != 0) 
 			repeat += 1; 
		int end = num * pageLetter; 
		int start = end + 1 - pageLetter; 
		
		int block = 3;
		int startPage = (num - 1) / block * block + 1;
		int endPage = startPage + block - 1 ;
		if(endPage > repeat) endPage = repeat;
		
		model.addAttribute("block", block); 
		model.addAttribute("startPage", startPage); 
		model.addAttribute("endPage", endPage); 
		model.addAttribute("repeat", repeat); 
		model.addAttribute("findAllList", mapper.findAllList(start, end));
		
	}
	
	@Override
	public void findBestList(Model model) {
		model.addAttribute("findBestList", mapper.findBestList());
	}
	
	@Override
	public void upViews(int uSeq) {
		mapper.upViews(uSeq);
	}

	@Override
	public String findSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		FindDTO dto = new FindDTO();
		dto.setuNickName(mul.getParameter("nickName"));
		dto.setuAge(Integer.parseInt(mul.getParameter("age")));
		dto.setuGen(mul.getParameter("gen"));
		dto.setuRegion(mul.getParameter("region"));
		dto.setuTitle(mul.getParameter("title"));
		dto.setuContent(mul.getParameter("content"));
		
		int result = 0;
		try {
			result = mapper.findSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg = "구인 글이 등록 되었습니다.";
			url = "/find/findAllList";
		} else {
			msg ="문제가 생겼습니다";
			url = "/findWriteForm";
		}
		return ffs.getMessage(request,msg,url);
	}

	@Override
	public void findContent(int uSeq, Model model) {
		model.addAttribute("findContent", mapper.findContent(uSeq));
	}



	@Override
	public String findModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		FindDTO dto = new FindDTO();
		dto.setuSeq(Integer.parseInt(mul.getParameter("uSeq")));
		dto.setuAge(Integer.parseInt(mul.getParameter("age")));
		dto.setuGen(mul.getParameter("gen"));
		dto.setuRegion(mul.getParameter("region"));
		dto.setuTitle(mul.getParameter("title"));
		dto.setuContent(mul.getParameter("content"));
		
		int result = 0;
		try {
			result = mapper.modifyFind(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg = "수 정";
			url = "/find/findContent?uSeq="+dto.getuSeq();
		} else {
			msg ="문제가 생겼습니다";
			url = "/find/findModifyForm?uSeq="+dto.getuSeq();
		}
		return ffs.getMessage(request,msg,url);
		
	}



	@Override
	public String findDelete(int uSeq, HttpServletRequest request) {
		int result = mapper.findDelete(uSeq);
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제";
			url = "/find/findAllList";
		} else {
			msg = "문제 발생";
			url = "/find/findContent";
		}
		return  ffs.getMessage(request, msg, url);
	}

	@Override
	public void addReply(FindRepDTO dto) {
		mapper.addReply(dto);
	}

	@Override
	public List<FindRepDTO> getRepList(int uSeq) {
		return mapper.getRepList(uSeq);
	}

}
