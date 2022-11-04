package com.web.honbab.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.find.dto.FindDTO;
//
public interface BoardMapper {
	
	public int selectFindCount();

	public List<FindDTO> findAllList(@Param("s")int start, @Param("e")int end);

	public FindDTO findContent(int writeNo);

	public void upViews(int writeNo);

	public int findDelete(int writeNo);
	
	public void upViews1(int writeNo);
	
	public int reviewDelete(int writeNo);

	public int delete(int writeNo);

	public int upView2(int writeNo);

	public int challengeDelete(int writeNo);
}