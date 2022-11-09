package com.web.honbab.mybatis.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.review.dto.ReviewDTO;
import com.web.honbab.review.dto.ReviewRepDTO;

public interface ReviewMapper {

	public int reviewSave(ReviewDTO review) ;

	public List<ReviewDTO> reviewAllList(@Param("s") int start, @Param("e") int end);

	public ReviewDTO reviewContent(int writeNo);

	public List<ReviewDTO> reviewBestList();

	public int reviewDelete(int writeNo);

	public int modifyReview(ReviewDTO dto);

	public void addReply(ReviewRepDTO dto);

	public List<ReviewRepDTO> getRepList(int writeNo);

	public int selectReviewCount();

	public void upViews(int writeNo);
	
	public int reviewLikeChk(@Param("likeId") String likeId, @Param("writeNo") int writeNo); 
	public int reviewLikeUp(@Param("writeNo") int writeNo);
	public int reviewLikeDown(@Param("writeNo") int writeNo);
	public int reviewLikeEnrl(@Param("likeId") String likeId, @Param("writeNo") int writeNo);
	public int reviewLikeWtdr(@Param("likeId") String likeId, @Param("writeNo") int writeNo);

	public List<ReviewDTO> searchForTitle(@Param("keyword") String keyword, @Param("s") int startEnd, @Param("e") int startEnd2);
	public List<ReviewDTO> searchForNick(@Param("keyword") String keyword, @Param("s") int startEnd, @Param("e") int startEnd2);
	public int selectReviewCountForTitle(@Param("keyword") String keyword);
	public int selectReviewCountForNick(@Param("keyword") String keyword);

	public boolean deleteBoard1(int writeGroup);



}
