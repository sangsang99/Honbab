package com.web.honbab.challenge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.honbab.challenge.dto.ChallengeLikeDTO;
import com.web.honbab.mybatis.challenge.ChallengeMapper;

@Service
public class ChallengeLikeServiceImpl implements ChallengeLikeService {
	
	@Autowired
	ChallengeMapper mapper;
	
	/*
	@Override
	public int likeCount(ChallengeLikeDTO dto) {
		return mapper.likeCount(dto);
	}
	*/

	@Override
	public void likeIn(ChallengeLikeDTO dto) {
		mapper.likeIn(dto);
	}

	@Override
	public int likeInfo(ChallengeLikeDTO dto) {
		return mapper.likeInfo(dto);
	}

	@Override
	public void likeUpdate(ChallengeLikeDTO dto) {
		mapper.likeUpdate(dto);
	}
	

	
	//public void likeCount(int likeWriteNo, String likeId, String likeNickName, Model model) {
	public void likeInfo(int likeWriteNo, Model model) {
		ChallengeLikeDTO dto = new ChallengeLikeDTO();
		//dto.setLikeWriteNo(likeWriteNo);
		//dto.setLikeId(likeId);
		//dto.setLikeNickName(likeNickName);
		
		int defaultLike = 0;
		int likeChk = mapper.likeCount(dto);
		
		if(likeChk == 0) {
			mapper.likeCount(dto);
		} else if(likeChk == 1) {
			defaultLike = mapper.likeInfo(dto);
		}
		model.addAttribute("defaultLike", defaultLike);
		model.addAttribute("like", likeChk);
		
	}
	
	

	
}
