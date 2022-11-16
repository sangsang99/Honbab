package com.web.honbab.aacommon.service;

import org.springframework.ui.Model;

public interface CommonService {
	
	public int[] paging(Model model, int num, int allCount);

}
