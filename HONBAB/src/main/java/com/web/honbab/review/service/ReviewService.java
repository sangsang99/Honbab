package com.web.honbab.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.review.dto.ReviewRepDTO;

public interface ReviewService {

	String reviewSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	String reviewModify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void reviewBestList(Model model);
	
	public void reviewAllList(Model model, int num);

	public void reviewContent(int writeNo, Model model);

	String reviewDelete(int writeNo, String imageFileName, HttpServletRequest request);

	public void addReply(ReviewRepDTO dto);

	public List<ReviewRepDTO> getRepList(int writeNo);

	public void upViews(int writeNo);

	public int reviewLike(int writeNo, Model model);

	public void searchReview(Model model, int num);
	
	public boolean deleteBoard1(int writeGroup);



	
}
