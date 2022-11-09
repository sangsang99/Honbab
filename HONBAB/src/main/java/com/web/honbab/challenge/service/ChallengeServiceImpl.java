package com.web.honbab.challenge.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.challenge.dto.ChallengeDTO;
import com.web.honbab.common.service.CommonService;
import com.web.honbab.mybatis.challenge.ChallengeMapper;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	ChallengeMapper mapper;
	
	@Autowired
	ChallengeFileService cfs;

	@Autowired
	CommonService cms;
	
	@Override
	public String challengeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ChallengeDTO dto = new ChallengeDTO();
		dto.setChLevel(mul.getParameter("chLevel"));
		dto.setNickName(mul.getParameter("nickName"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setId(mul.getParameter("id"));
		MultipartFile file = mul.getFile("imgName");

		if(file.getSize() != 0) {
			dto.setImgName(cfs.saveFile(file));
		} 
		else if(file.isEmpty()) {
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
		int currentPg = num;
		int pageLetter = 8;
		int allCount = mapper.challengePgCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
		model.addAttribute("challengeList", mapper.challengeAllList(start, end));
		//System.out.println(pageLetter);
		System.out.println("현재 페이지 " + currentPg);
		System.out.println("총 글 수 " + allCount);
		System.out.println("한 페이지 글 수 " + (allCount - ((currentPg - 1) * pageLetter)));
	}

	
	@Override
	public String challengeModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		ChallengeDTO dto = new ChallengeDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setChLevel(mul.getParameter("level"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("imgName");
		
		if(file.getSize() != 0) {	//이미지 변경
			dto.setImgName(cfs.saveFile(file));
			cfs.deleteImage(mul.getParameter("originFileName"));
		} else if(file.isEmpty()) { 
			dto.setImgName(mul.getParameter("originFileName"));
			/* dto.setImgName("nan"); */
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
	
	@Override
	public void challengeBestList(Model model) {		
		model.addAttribute("challengeBestList", mapper.challengeBestList());
	}

	
	/*
	 * @Override public int likesCount(int writeNo) { return
	 * mapper.likesCount(writeNo); }
	 * 
	 * @Override public int updateLike(int writeNo) throws Exception { return
	 * mapper.updateLike(writeNo); }
	 * 
	 * @Override public int unLike(int writeNo) throws Exception { return
	 * mapper.unLike(writeNo); }
	 */
	
	@Override
	public void challengeSearch(MultipartHttpServletRequest mul, Model model, int num) {
		int level = Integer.parseInt(mul.getParameter("level"));
		String keyword = mul.getParameter("keyword");
		List<ChallengeDTO> challList = new ArrayList<>();
		
		switch(level) {
		case 1:
			challList = mapper.searchLevelOne(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 2:
			challList = mapper.searchLevelTwo(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 3:
			challList = mapper.searchLevelThree(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 4:
			challList = mapper.searchLevelFour(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 5:
			challList = mapper.searchLevelFive(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 6:
			challList = mapper.searchLevelSix(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 7:
			challList = mapper.searchLevelSeven(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 8:
			challList = mapper.searchLevelEight(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		case 9:
			challList = mapper.searchLevelNine(keyword, level);
			model.addAttribute("challengeList", challList);
			break;
		default:
			System.out.println("검색 중 오류");
			break;
		}
		
		int currentPg = num;
		int pageLetter = 8;
		int allCount = challList.size();
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
//		int end = num * pageLetter;
//		int start = end + 1 - pageLetter;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
	}


	
	/*
	@Override
	public void challengeSearch(MultipartHttpServletRequest mul, Model model) {
		int level = Integer.parseInt(mul.getParameter("level"));
		String keyword = mul.getParameter("keyword");
		
		switch(level) {
		case 1:
			model.addAttribute("challengeList", mapper.searchLevelOne(keyword, level));
			break;
		case 2:
			model.addAttribute("challengeList", mapper.searchLevelTwo(keyword, level));
			break;
		case 3:
			model.addAttribute("challengeList", mapper.searchLevelThree(keyword, level));
			break;
		case 4:
			model.addAttribute("challengeList", mapper.searchLevelFour(keyword, level));
			break;
		case 5:
			model.addAttribute("challengeList", mapper.searchLevelFive(keyword, level));
			break;
		case 6:
			model.addAttribute("challengeList", mapper.searchLevelSix(keyword, level));
			break;
		case 7:
			model.addAttribute("challengeList", mapper.searchLevelSeven(keyword, level));
			break;
		case 8:
			model.addAttribute("challengeList", mapper.searchLevelEight(keyword, level));
			break;
		case 9:
			model.addAttribute("challengeList", mapper.searchLevelNine(keyword, level));
			break;
		default:
			System.out.println("검색 중 오류");
			break;
		}
	}
	*/	
	
	
	
	
	
	
	

}
