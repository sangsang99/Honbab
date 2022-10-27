package com.web.honbab.mybatis.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.review.dto.ReviewDTO;
import com.web.honbab.review.dto.ReviewRepDTO;

public interface ReviewMapper {

	public int reviewSave(ReviewDTO review) ;

	public List<ReviewDTO> reviewAllList(@Param("s") int start, @Param("e") int end);

	public ReviewDTO reviewContent(int uSeq);

	public List<ReviewDTO> reviewBestList();

	public int reviewDelete(int uSeq);

	public int modifyReview(ReviewDTO dto);

	public void addReply(ReviewRepDTO dto);

	public List<ReviewRepDTO> getRepList(int uSeq);

	public int selectReviewCount();

	public void upViews(int uSeq);

	public void reviewLike(int uSeq);

}
