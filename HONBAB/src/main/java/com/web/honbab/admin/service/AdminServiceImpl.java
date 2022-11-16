package com.web.honbab.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.honbab.mybatis.admin.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public void ban(String id) {
		mapper.ban(id);
	}

	@Override
	public void partnerBan(String id) {
		mapper.partnerBan(id);
	}

}
