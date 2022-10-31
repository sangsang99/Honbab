package com.web.honbab.mybatis.challenge;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.challenge.dto.ChallengeDTO;
import com.web.honbab.challenge.dto.ChallengeLikeDTO;

public interface ChallengeMapper {
	
	public int challengeWrite(ChallengeDTO dto);

	public int challengeSave(ChallengeDTO dto);
	
	public ChallengeDTO challengeView(int writeNo);
	
	public List<ChallengeDTO> challengeAllList(@Param("s")int start, @Param("e")int end);
	
	public int challengeModify(ChallengeDTO dto);
	
	public int challengeDelete(int writeNo);
	
	public int challengePgCount();
	
	public int upView(int writeNo);
	
	//------------- ChallengeLike -------------
	
	public int likeCount(ChallengeLikeDTO dto);

	public void likeIn(ChallengeLikeDTO dto);
	
	public int likeInfo(ChallengeLikeDTO dto);

	public void likeUpdate(ChallengeLikeDTO dto);
	
	
	
}
