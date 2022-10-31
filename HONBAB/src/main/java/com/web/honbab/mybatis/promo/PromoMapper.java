package com.web.honbab.mybatis.promo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.promo.dto.PromoDTO;
import com.web.honbab.promo.dto.PromoRepDTO;


public interface PromoMapper {
	//public List<BoardDTO> boardAllList();
	//시작번호 끝번호 받아오기 
	public List<PromoDTO> promoList(@Param("s") int start, @Param("e") int end);
	
	public int writeSave(PromoDTO dto);
	
	public PromoDTO contentView(int writeNo);
	
	public void upHit(int writeNo);
	
	public int modify(PromoDTO dto);
	
	public int delete(int writeNo);
	
	public int selectBoardCount();
	
	public void addReply(PromoRepDTO dto);

	public List<PromoRepDTO> getRepList(int write_group);
	
	
	
}
