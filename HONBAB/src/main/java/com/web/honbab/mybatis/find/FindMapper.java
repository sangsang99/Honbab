package com.web.honbab.mybatis.find;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.find.dto.FindDTO;
import com.web.honbab.find.dto.FindRepDTO;
import com.web.honbab.review.dto.ReviewDTO;

public interface FindMapper {


	public FindDTO findContent(int writeNo);
	
	public List<FindDTO> findAllList(@Param("s")int start, @Param("e")int end);

	public int selectFindCount();

	public List<FindDTO> findBestList();

	public void upViews(int writeNo);

	public int findSave(FindDTO find);

	public int modifyFind(FindDTO dto);

	public int findDelete(int writeNo);

	public void addReply(FindRepDTO dto);

	public List<FindRepDTO> getRepList(int writeNo);
	
	public boolean deleteBoard(int writeGroup);
	
	public int selectFindCountForOptions(@Param("optRegion") String optRegion,
			 @Param("optGender") String optGender,
			 @Param("btwA") int btwA,
				 @Param("btwB") int btwB);
	
	public List<FindRepDTO> searchForOptions(@Param("optRegion") String optRegion, 
				@Param("optGender") String optGender,
				@Param("btwA") int btwA,
				@Param("btwB") int btwB,
				@Param("s") int start, @Param("e") int end);
	
}
