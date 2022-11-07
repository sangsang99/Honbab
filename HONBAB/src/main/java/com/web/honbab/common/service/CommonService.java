package com.web.honbab.common.service;

import org.springframework.ui.Model;

public interface CommonService {
	
	public int[] paging(Model model, int num, int allCount);

}
