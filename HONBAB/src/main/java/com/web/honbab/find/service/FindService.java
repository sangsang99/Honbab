package com.web.honbab.find.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.find.dto.FindRepDTO;

public interface FindService {
	
	public void findAllList(Model model, int num);
	
	public void findBestList(Model model);
	
	public void upViews(int uSeq);
	
	String findSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void findContent(int uSeq, Model model);
	
    String findModify(MultipartHttpServletRequest mul, HttpServletRequest request);

    String findDelete(int uSeq, HttpServletRequest request);

	public void addReply(FindRepDTO dto);

	public List<FindRepDTO> getRepList(int uSeq);

	
}
