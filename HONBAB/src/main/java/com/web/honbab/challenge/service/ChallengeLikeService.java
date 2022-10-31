package com.web.honbab.challenge.service;

import org.springframework.ui.Model;

import com.web.honbab.challenge.dto.ChallengeLikeDTO;

public interface ChallengeLikeService {

	//public int likeCount(ChallengeLikeDTO dto);
	public void likeInfo(int likeWriteNo, Model model);

	public void likeIn (ChallengeLikeDTO dto);
	
	public int likeInfo (ChallengeLikeDTO dto);

	public void likeUpdate (ChallengeLikeDTO dto);
	
}
