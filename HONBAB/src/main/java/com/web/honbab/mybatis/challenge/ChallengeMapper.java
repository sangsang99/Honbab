package com.web.honbab.mybatis.challenge;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.challenge.dto.ChallengeDTO;

public interface ChallengeMapper {
	
	public int challengeWrite(ChallengeDTO dto);

	public int challengeSave(ChallengeDTO dto);
	
	public ChallengeDTO challengeView(int writeNo);
	
	public List<ChallengeDTO> challengeAllList(@Param("s")int start, @Param("e")int end);
	
	public int challengeModify(ChallengeDTO dto);
	
	public int challengeDelete(int writeNo);
	
	public int challengePgCount();
	
	public int upView(int writeNo);
	
	public List<ChallengeDTO> challengeBestList(); 
	
	// 검색
	public int challengeSearchCount();
	
	public List<ChallengeDTO> searchLevelOne(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelTwo(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelThree(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelFour(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelFive(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelSix(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelSeven(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelEight(@Param("keyword") String keyword, @Param("level") int level); 
	public List<ChallengeDTO> searchLevelNine(@Param("keyword") String keyword, @Param("level") int level);


	
}
