package com.web.honbab.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.common.service.CommonService;
import com.web.honbab.mybatis.review.ReviewMapper;
import com.web.honbab.review.dto.ReviewDTO;
import com.web.honbab.review.dto.ReviewRepDTO;
import com.web.honbab.session.search.SearchSession;

@Service
public class ReviewServiceImpl implements ReviewService, SearchSession {

	@Autowired
	private ReviewMapper mapper;

	@Autowired
	private ReviewFileService rfs;

	@Autowired
	private HttpSession session;

	@Autowired
	private CommonService cms;
	
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

		String msg, url;
		if (result == 1) {
			msg = "혼밥후기 작성 완료!";
			url = "/review/reviewAllList";
		} else {
			msg = "문제가 있습니다.";
			url = "/review/reviewWriteForm";
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
		System.out.println(dto.getImgName());
		int result = 0;
		try {
			result = mapper.modifyReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg, url;
		if (result == 1) {
			msg = "글 수정 완료!";
			url = "/review/reviewContent?writeNo=" + dto.getWriteNo();
		} else {
			msg = "문제가 있습니다.";
			url = "/review/reviewModifyForm?writeNo=" + dto.getWriteNo();
		}

		return rfs.getMessage(request, msg, url);
	}

	@Override
	public void reviewAllList(Model model, int num) {

		int allCount = mapper.selectReviewCount(); // 전체 글수
		int[] startEnd = new int[1];

		startEnd = cms.paging(model, num, allCount);
		model.addAttribute("reviewAllList", mapper.reviewAllList(startEnd[0], startEnd[1]));
		model.addAttribute("isSearchPage", false);
	}

	@Override
	public void reviewBestList(Model model) {
		model.addAttribute("reviewBestList", mapper.reviewBestList());
	}

	@Override
	public void reviewContent(int writeNo, Model model) {
		model.addAttribute("reviewContent", mapper.reviewContent(writeNo));
		model.addAttribute("likeIt", "no");
		String likeId = (String) session.getAttribute("loginUser");

		if(likeId !=null) {
			int isAlreadyLike = mapper.reviewLikeChk(likeId, writeNo);
			
			if ((isAlreadyLike) == 1) { 
				model.addAttribute("likeIt", "yes");
			} 
		}
	}

	@Override
	public void upViews(int writeNo) {
		mapper.upViews(writeNo);
	}

	@Override
	public String reviewDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		int result = mapper.reviewDelete(writeNo);
		String msg, url;

		if (result == 1) {
			if (imageFileName != null) {
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
	public int reviewLike(int writeNo, Model model) {

		String likeId = (String) session.getAttribute("loginUser");
		int isAlreadyLike = mapper.reviewLikeChk(likeId, writeNo);
		int result = 0;

		// 아직 좋아요를 안눌렀고
		if ((isAlreadyLike) == 0) { 
			result = mapper.reviewLikeUp(writeNo);
			if(result == 1) mapper.reviewLikeEnrl(likeId, writeNo);
		// 이미 좋아요를 눌렀고
		} else if((isAlreadyLike) == 1) {
			result = mapper.reviewLikeDown(writeNo);
			if(result == 1) mapper.reviewLikeWtdr(likeId, writeNo);
		} else 
			System.out.println("알 수 없는 오류");
			
		
		// result가 1이면 정상 1이아니면 오류   ..라고 컨트롤러에게 전달
		return result;
	}

	@Override
	public void searchReview(Model model, int num) {

		String keyword = (String) session.getAttribute(SEARCHVALUE);
		String select = (String) session.getAttribute(SEARCHOPTION);
		int allCount;
		int[] startEnd = new int[1];

		switch (select) {
		case "title":
			allCount = mapper.selectReviewCountForTitle(keyword); // Title로 설정해서 검색한 전체 글수
			startEnd = cms.paging(model, num, allCount);
			model.addAttribute("reviewAllList", mapper.searchForTitle(keyword, startEnd[0], startEnd[1]));
			model.addAttribute("isSearchPage", true);
			break;
		case "nickname":
			allCount = mapper.selectReviewCountForNick(keyword); // Nick으로 설정해서 검색한 전체 글수
			startEnd = cms.paging(model, num, allCount);
			model.addAttribute("reviewAllList", mapper.searchForNick(keyword, startEnd[0], startEnd[1]));
			model.addAttribute("isSearchPage", true);
			break;
		default:
			System.out.println("에러발생");
			break;
		}
	}
	
	@Override 
	  public boolean deleteBoard1(int writeGroup) { 
		  
		  return mapper.deleteBoard1(writeGroup); 
		  }

}
