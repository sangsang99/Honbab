package com.web.honbab.find.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.common.service.CommonService;
import com.web.honbab.find.dto.FindDTO;
import com.web.honbab.find.dto.FindRepDTO;
import com.web.honbab.mybatis.find.FindMapper;
import com.web.honbab.review.dto.ReviewRepDTO;
import com.web.honbab.session.search.SearchSession;


@Service
public class FindServiceImpl implements FindService, SearchSession{
	
	@Autowired
	FindMapper mapper;
	
	@Autowired
	FindFileService ffs;
	
	@Autowired
	CommonService cms;
	
	@Autowired
	HttpSession session;
	
	@Override
	public void findAllList(Model model, int num) {

		int allCount = mapper.selectFindCount(); // 전체 글수
		int[] startEnd = new int[1];

		startEnd = cms.paging(model, num, allCount);
		model.addAttribute("findAllList", mapper.findAllList(startEnd[0], startEnd[1]));
		model.addAttribute("isSearchPage", false);
		
	}
	
	@Override
	public void findBestList(Model model) {
		model.addAttribute("findBestList", mapper.findBestList());
	}
	
	@Override
	public void upViews(int writeNo) {
		mapper.upViews(writeNo);
	}

	@Override
	public String findSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		FindDTO dto = new FindDTO();
		dto.setNickName(mul.getParameter("nickName"));
		dto.setId(mul.getParameter("id"));
		dto.setAge(Integer.parseInt(mul.getParameter("age")));
		dto.setGen(mul.getParameter("gen"));
		dto.setRegion(mul.getParameter("region"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
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
			url = "/find/findWriteForm";
		}
		return ffs.getMessage(request,msg,url);
	}

	@Override
	public void findContent(int writeNo, Model model) {
		model.addAttribute("findContent", mapper.findContent(writeNo));
	}



	@Override
	public String findModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		FindDTO dto = new FindDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setAge(Integer.parseInt(mul.getParameter("age")));
		dto.setGen(mul.getParameter("gen"));
		dto.setRegion(mul.getParameter("region"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		int result = 0;
		try {
			result = mapper.modifyFind(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg = "수 정";
			url = "/find/findContent?writeNo="+dto.getWriteNo();
		} else {
			msg ="문제가 생겼습니다";
			url = "/find/findModifyForm?writeNo="+dto.getWriteNo();
		}
		return ffs.getMessage(request,msg,url);
		
	}



	@Override
	public String findDelete(int writeNo, HttpServletRequest request) {
		int result = mapper.findDelete(writeNo);
		
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
	public List<FindRepDTO> getRepList(int writeNo) {
		return mapper.getRepList(writeNo);
	}
	
	@Override 
	  public boolean deleteBoard(int writeGroup) { 
		  
		  return mapper.deleteBoard(writeGroup); 
		  }

	@Override
	public void searchReview(Model model, int num) {

		String optRegion = (String) session.getAttribute(SEARCHOPTION);
		String optGender = (String) session.getAttribute(SEARCHOPTION2);
		String optAge = (String) session.getAttribute(SEARCHOPTION3);
		int btwA = 0;
		int btwB = 0;

		
		switch (optAge) {
		case "10":
			btwA = 1;
			btwB = 99;
			break;
		case "20":
			btwA = 1;
			btwB = 29;
			break;
		case "30":
			btwA = 30;
			btwB = 39;
			break;
		case "40":
			btwA = 40;
			btwB = 99;
			break;
		default:
			System.out.println("문제발생");
			break;
		}

		int allCount;
		int[] startEnd = new int[1];
	
		allCount = mapper.selectFindCountForOptions(optRegion, optGender, btwA, btwB); // Title로 설정해서 검색한 전체 글수
		startEnd = cms.paging(model, num, allCount);
		model.addAttribute("findAllList", mapper.searchForOptions(optRegion, optGender, btwA, btwB, startEnd[0], startEnd[1]));
		model.addAttribute("isSearchPage", true);
	}


}
