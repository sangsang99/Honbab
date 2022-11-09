package com.web.honbab.promo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.promo.dto.PromoRepDTO;

public interface PromoService {

	void promoList(Model model, int num);

	public void promoAllList(Model model);
	
	String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	void contentView(int writeNo, Model model);

	String modify(MultipartHttpServletRequest mul, HttpServletRequest request);

	String boardDelete(int writeNo, String imageFileName, HttpServletRequest request);

	void addReply(PromoRepDTO dto);

	List<PromoRepDTO> getRepList(int write_group);

	public void getSearch(Model model, int num);

	int isBizUser(String user);

}
