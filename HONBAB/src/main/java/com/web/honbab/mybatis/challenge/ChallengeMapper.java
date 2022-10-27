package com.web.honbab.mybatis.challenge;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.challenge.dto.ChallengeDTO;

public interface ChallengeMapper {
	
	public int challengeWrite(ChallengeDTO dto);

	public int challengeSave(ChallengeDTO dto);
	
	public ChallengeDTO challengeView(int uWriteNo);
	
	public List<ChallengeDTO> challengeAllList(@Param("s")int start, @Param("e")int end);
	
	public int challengeModify(ChallengeDTO dto);
	
	public int challengeDelete(int uWriteNo);
	
	public int challengePgCount();
	
	public int upView(int uWriteNo);
	
	
}
