package com.web.honbab.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.mybatis.review.ReviewMapper;
import com.web.honbab.review.dto.ReviewDTO;
import com.web.honbab.review.dto.ReviewRepDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	
	@Autowired
	private ReviewFileService rfs;

	@Override
	public String reviewSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ReviewDTO dto = new ReviewDTO();
		dto.setNickname(mul.getParameter("nickname"));
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("image_file_name");
		
		if (file.getSize() != 0) {
			dto.setImgName(rfs.saveFile(file));
		} else {
			dto.setImgName("None");
		}
		
		int result = 0;
		try {
			result = mapper.reviewSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="혼밥후기 작성 완료!";
			url ="/review/reviewAllList";
		} else {
			msg ="문제가 있습니다.";
			url ="/review/reviewWriteForm";
		}
		
		return rfs.getMessage(request, msg, url);
	}

	
	@Override
	public String reviewModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ReviewDTO dto = new ReviewDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("image_file_name");
		
		if (file.getSize() != 0) {
			dto.setImgName(rfs.saveFile(file));
			rfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImgName(mul.getParameter("originFileName"));
		}
		
		int result = 0;
		try {
			result = mapper.modifyReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="글 수정 완료!";
			url ="/review/reviewContent?writeNo="+dto.getWriteNo();
		} else {
			msg ="문제가 있습니다.";
			url ="/review/reviewModifyForm?writeNo="+dto.getWriteNo();
		}
		
		return rfs.getMessage(request, msg, url);
	}

//	int article = 5; // 한 페이지 글 목록수 == pageLetter
//	int currentPage = pg;    // 현재 페이지 == num
//	int startNum = (currentPage - 1) * article + 1; // 시작 페이지 번호 = end 
//	int lastNum = startNum + article - 1;           // 마지막 페이지 번호 = start
//	int totalArticle = boardDAO.getTotalArticle(); // 전체 글수 == allCount
//	int totalPage = (totalArticle - 1)/article + 1; // 전체 페이지 수  == repeat
//
//	int block = 3;  // 페이지 블록
//	int startPage = (currentPage - 1) / block * block + 1;
//	int endPage = startPage + block - 1;
//	if(endPage > totalPage) endPage = totalPage;


	@Override
	public void reviewAllList(Model model, int num) {
		//page부여
		int pageLetter = 3; // 한 페이지당 글 목록수 
		int allCount = mapper.selectReviewCount(); // 전체 글수
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
		model.addAttribute("reviewAllList", mapper.reviewAllList(start, end));
	}

	
	@Override
	public void reviewBestList(Model model) {
		model.addAttribute("reviewBestList", mapper.reviewBestList());
	}

	@Override
	public void reviewContent(int writeNo, Model model) {
		model.addAttribute("reviewContent", mapper.reviewContent(writeNo));
	}
	
	
	@Override
	public void upViews(int writeNo) {
		mapper.upViews(writeNo);
	}


	@Override
	public String reviewDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		int result = mapper.reviewDelete(writeNo);
		String msg, url;
		
		if(result == 1) {
			if(imageFileName != null) {
				rfs.deleteImage(imageFileName);
			}
			msg = "게시글 삭제 완료";
			url = "/review/reviewAllList";
		} else {
			msg = "문제가 생겼습니다";
			url = "/review/reviewContent";
		}
		return rfs.getMessage(request, msg, url);
	}


	@Override
	public void addReply(ReviewRepDTO dto) {
		mapper.addReply(dto);
	}


	@Override
	public List<ReviewRepDTO> getRepList(int writeNo) {
		return mapper.getRepList(writeNo);
	}


	@Override
	public void reviewLike(int writeNo) {
		mapper.reviewLike(writeNo);
	}
	
	
	
	
}
