package com.web.honbab.promo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.honbab.promo.dto.PromoRepDTO;
import com.web.honbab.promo.service.PromoService;
import com.web.honbab.session.name.MemberSession;

@RestController
@RequestMapping("/promotion")
public class PromoRepController implements MemberSession {
	@Autowired
	PromoService ps;
	
	@PostMapping(value="addReply", produces = "applacition/json; charset=utf-8")
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		PromoRepDTO dto = new PromoRepDTO();
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setWrite_group(Integer.parseInt((String)map.get("write_no")));
		dto.setTitle((String)map.get("title"));
		dto.setContent((String)map.get("content"));		
		dto.setStar(Integer.parseInt((String)map.get("star")));		
				
		
		ps.addReply(dto);
		return "{\"result\":true}";
	}
	
	@GetMapping(value = "replyData/{write_group}", produces = "application/json; charset=utf-8")
	public List<PromoRepDTO> replyData(@PathVariable int write_group){
		return ps.getRepList(write_group);
	}
	
//	@GetMapping(value = "replyData/{star}", produces = "application/json; charset=utf-8")
//	public List<PromoRepDTO> star(@PathVariable int star){
//		return ps.getRepList(star);
//	}
	
	
}
