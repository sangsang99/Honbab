package com.web.honbab.mybatis.challenge;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.challenge.dto.ChallengeDTO;

public interface ChallengeMapper {
	
	// 기본 CRUD

	public int challengeWrite(ChallengeDTO dto);

	public int challengeSave(ChallengeDTO dto);

	public ChallengeDTO challengeView(int writeNo);

	public List<ChallengeDTO> challengeAllList(@Param("s") int start, @Param("e") int end);

	public int challengeModify(ChallengeDTO dto);

	public int challengeDelete(int writeNo);

	
	// 부가기능
	public int challengePgCount();

	public int upView(int writeNo);

	public List<ChallengeDTO> challengeBestList();

	// 검색
	public int challengeSearchCount();

	public List<ChallengeDTO> searchForLevel(@Param("keyword") String keyword, @Param("level") int level);
	
	
	// 좋아요

	public int challengeLikeChk(@Param("likeId") String likeId, @Param("writeNo") int writeNo);

	public int challengeLikeUp(@Param("writeNo") int writeNo);

	public void challengeLikeEnrl(@Param("likeId")String likeId, @Param("writeNo") int writeNo);

	public int challengeLikeDown(@Param("writeNo") int writeNo);

	public void challengeLikeWtdr(@Param("likeId")String likeId, @Param("writeNo") int writeNo);

}
