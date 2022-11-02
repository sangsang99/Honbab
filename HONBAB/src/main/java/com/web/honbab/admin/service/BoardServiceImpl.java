package com.web.honbab.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.honbab.challenge.dto.ChallengeDTO;
import com.web.honbab.challenge.service.ChallengeService;
import com.web.honbab.find.service.FindFileService;
import com.web.honbab.mybatis.board.BoardMapper;
import com.web.honbab.mybatis.challenge.ChallengeMapper;
import com.web.honbab.mybatis.promo.PromoMapper;
import com.web.honbab.mybatis.review.ReviewMapper;
import com.web.honbab.promo.service.PromoFileService;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	ReviewMapper mapper1;
	
	@Autowired
	PromoMapper mapper2;
	
	@Autowired
	FindFileService ffs;
	
	@Autowired
	PromoFileService pfs;
	
	@Autowired
	ChallengeMapper mapper3;
	
	
	@Override
	public void findBoard(Model model, int num) {
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
	public String findDelete(int writeNo, HttpServletRequest request) {
		int result = mapper.findDelete(writeNo);
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제";
			url = "/admin/findBoard";
		} else {
			msg = "문제 발생";
			url = "/admin/boardContent";
		}
		return  ffs.getMessage(request, msg, url);
	}
	
	@Override
	public void honbabBoard(Model model, int num) {
		//page부여
		int pageLetter = 3; // 한 페이지당 글 목록수 
		int allCount = mapper1.selectReviewCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호 jsp에서 foreach에 사용할 값, 2/3=0
		if(allCount % pageLetter != 0) // 2/3일 때 마지막 페이지는 1, 5/3일때 마지막페이지는 2
 			repeat += 1; 
		int end = num * pageLetter; //numDefault는 1, pageLetter는 3 이면 end는 3 // 3의 배수만 나옴
		int start = end + 1 - pageLetter; // 끝번호가 15면 첫번호는 13 이런식
		
		//block처리
		int block = 3;
		int startPage = (num - 1) / block * block + 1;
		int endPage = startPage + block - 1 ;
		if(endPage > repeat) endPage = repeat;
		
		model.addAttribute("block", block); //jsp파일에 보낼값
		model.addAttribute("startPage", startPage); //jsp파일에 보낼값
		model.addAttribute("endPage", endPage); //jsp파일에 보낼값
		model.addAttribute("repeat", repeat); //jsp파일에 보낼값
		model.addAttribute("reviewAllList", mapper1.reviewAllList(start, end));
	}

	@Override
	public void upViews1(int writeNo) {
		mapper.upViews1(writeNo);
	}
	
	@Override
	public String reviewDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		int result = mapper.reviewDelete(writeNo);
		String msg, url;
		
		if(result == 1) {
			if(imageFileName != null) {
				ffs.deleteImage(imageFileName);
			}
			msg = "게시글 삭제 완료";
			url = "/admin/honbabBoard";
		} else {
			msg = "문제가 생겼습니다";
			url = "/admin/reviewContent";
		}
		return ffs.getMessage(request, msg, url);
	}
	
	@Override
	public void promoBoard(Model model, int num) {
		int pageLetter = 10; // 한 페이지당 글 목록수 
		int allCount = mapper2.selectBoardCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호 jsp에서 foreach에 사용할 값, 2/3=0
		if(allCount % pageLetter != 0) // 2/3일 때 마지막 페이지는 1, 5/3일때 마지막페이지는 2
 			repeat += 1; 
		int end = num * pageLetter; //numDefault는 1, pageLetter는 3 이면 end는 3 // 3의 배수만 나옴
		int start = end + 1 - pageLetter; // 끝번호가 15면 첫번호는 13 이런식
		model.addAttribute("repeat", repeat); //jsp파일에 보낼값
		model.addAttribute("promoList", mapper2.promoList(start, end)); 
	}
	
	@Override
	public String boardDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		int result = mapper.delete(writeNo);
		String msg, url;
		
		if(result == 1) {
			if(imageFileName != null) {
				pfs.deleteImage(imageFileName);
			}
			msg = "글이 삭제 되었습니다.";
			url = "/admin/promoBoard";
		} else {
			msg ="오류 발생, 작업이 완료되지 않았습니다.";
			url = "/admin/promoContent?writeNo="+writeNo;
		}
		return pfs.getMessage(request, msg, url);
	}
	
	@Override
	public void challBoard(Model model, int num) {
		int currentPg = num;
		int pageLetter = 8;
		int allCount = mapper3.challengePgCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
		model.addAttribute("challengeList", mapper3.challengeAllList(start, end));
		//System.out.println(pageLetter);
		//System.out.println(currentPg);
		//System.out.println(allCount);
	}
	
	public void upView2(int writeNo) {
		mapper.upView2(writeNo);
	}
	
	@Override
	public String challengeDelete(int writeNo, HttpServletRequest request) {
		ChallengeDTO dto = new ChallengeDTO();
		int result = mapper.challengeDelete(writeNo);
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제 완료";
			url = "/admin/challBoard";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/admin/challContent?writeNo="+ writeNo;
		}
		return  ffs.getMessage(request, msg, url);
	}
	
}
